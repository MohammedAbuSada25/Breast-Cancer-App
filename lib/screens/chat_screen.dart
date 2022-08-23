import 'dart:io';

import 'package:breast_cancer/widgets/my_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firestore = FirebaseFirestore.instance;
late User signedInUser;

class ChatScreen extends StatefulWidget {
  static const String screenRoute = 'chat_screen';

  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance; //انشاء متغير باسم FirebaseAuth
  String? messageText;
  final messageController = TextEditingController();

  @override
  void initState() {
    // هاد الميثود يثم تشغيلها اول شي قبل build
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    // هاد الميثود بيجيب ايميل المستخدم الي فايت فيه التطبيق
    try {
      final user = _auth.currentUser;
      if (user != null) {
        signedInUser = user;
        print(signedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  // void getMessages() async{
  //   final messages = await _firestore.collection('messages').get();
  //   for(var message in messages.docs){
  //     print(message.data());
  //   }
  // }

  // void getMessagesStreams() async {
  //   await for (var snapshot in _firestore.collection('messages').snapshots()) {
  //     for (var message in snapshot.docs) {
  //       print(message.data());
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorButtonpink, //هاد لون الاب بار  معرفو بهاد الاسم
        // leading: IconButton(
        //   onPressed: () {
        //     // getMessagesStreams();
        //
        //   },
        //   icon: Icon(Icons.back),
        // ),
        title: Row(
          children: [
            Material(
                // هاد زي الكنتينر موجود بداخله اللوقو
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('images/logo.png', height: 25),
                )),
            SizedBox(width: 10),
            Text(
              'المحادثة الجماعية',
              style: TextStyle(fontSize: 22),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MessageStreamBuilder(),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: colorButtonpink!,
                    width: 2,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        hintText: 'اكتب رسالتك هنا...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      stdin.readLineSync();
                      if (messageController.text.isNotEmpty) {
                        messageController.clear();
                        _firestore.collection("messages").add({
                          "text": messageText,
                          "sender": signedInUser.email,
                          "time": FieldValue.serverTimestamp()
                        });
                      } else {
                        snackBar(context, "الرجاء ادخل الرسالة", Colors.red);
                      }
                    },
                    child: Text(
                      'ارسال',
                      style: TextStyle(
                        color: Colors.blue[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class MessageLine extends StatelessWidget {
  MessageLine({
    // بستقبل البيانات الي ارسلتها هين الي هي الرسالة والمرسل وازا كان الحساب هو صاحب الرسالة ولا لا
    required this.text,
    required this.sender,
    required this.isMe, // ازا كان الحساب هو صاحب الرسالة ولا لا هاد بستخدمها انو صاحب الرسالة بشوف رسالتو على ناحية والحسابات الأخرى على ناحية اخرى والنتيجة بحفظها ب bool اسمها isMe
  });

  final String text;
  final String sender;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isMe
            ? CrossAxisAlignment.start
            : CrossAxisAlignment
                .end, // عامل if تفحص isMe صح ام خطا حسب النتيجة بحدد ازا يمين الرسالة تكون او شمال
        children: [
          Text(
            sender,
            style: TextStyle(fontSize: 12, color: colorButtonpink),
          ),
          Material(
            elevation: 5,
            borderRadius:
                isMe // عامل if تفحص isMe صح ام خطا حسب النتيجة بحدد شكل حاوية الرسالة
                    ? BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))
                    : BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
            color: isMe
                ? Colors.blue[800]
                : Colors
                    .white, // عامل if تفحص isMe صح ام خطا حسب النتيجة بحدد لون حاوية الرسالة
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 15,
                    color: isMe
                        ? Colors.white
                        : Colors
                            .black54), // عامل if تفحص isMe صح ام خطا حسب النتيجة بحدد لون النص
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MessageStreamBuilder extends StatelessWidget {
  const MessageStreamBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      // StreamBuilder عشان يستنى عبال م يجيب البيانات من الفير بيز
      stream: _firestore
          .collection('messages')
          .orderBy('time')
          .snapshots(), // بجيب البيانات على شكل ستريم
      builder: (context, snapshot) {
        // داخل هاد بحدد كيف بدي اعرض البيانات
        List<MessageLine> messageWidgets = [];
        if (!snapshot.hasData) {
          // اذا كانت البيانت لسا ما اجت بعرضلي دائرة التحميل بوسط الشاشة
          return Center(
            child: CircularProgressIndicator(),
          );
          //add her a spinner
        }
        final messages = snapshot.data!.docs.reversed;
        for (var message in messages) {
          // بهاد الفور بجيب البيانات وبفصل الرسالة عن ايميل المرسل عشان اقدر اتعامل مع كل وحدة على حدى
          final textMessage = message.get('text');
          final senderMessage = message.get('sender');
          final currentUser = signedInUser.email;

          final messageWidget = MessageLine(
            // بستدعي MessageLine class وبرسل الها الرسالة وايميل المرسل
            text: textMessage,
            sender: senderMessage,
            isMe: currentUser ==
                senderMessage, // هين بحدد ازا المرسل هو صاحب الحساب الي فايت ام لا
          );
          messageWidgets.add(messageWidget); // بضيف البيانات على الليست
        }

        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            children: messageWidgets, // بعرض الليست ب listView
          ),
        );
      },
    );
  }
}
