import 'package:breast_cancer/widgets/modelReservation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import '../../widgets/my_button.dart';
import '../shared_pref/shared_pref_componants.dart';

class HomeDoctor extends StatefulWidget {


  @override
  State<HomeDoctor> createState() => _HomeDoctorState();
}

class _HomeDoctorState extends State<HomeDoctor> {


  final _firestore = FirebaseFirestore.instance;

  void initState() {
    getService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorButtonpink,
        elevation: 0,
        title: const Text(
          "الحجوزات",
          style: TextStyle(
              color: Color(0xFFF8F9FA),
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: ConditionalBuilder(
        condition: condition,
        builder: (context) => users.isEmpty ? noData() : isData(),
        fallback: (context) => const Center(child: CircularProgressIndicator()),
      ),
      // body: StreamBuilder<QuerySnapshot>(
      //   stream:
      //       FirebaseFirestore.instance.collection('reservations').snapshots(),
      //   builder: (context, snapshot) {
      //     List<Widget> itemWidget = [];
      //     if (!snapshot.hasData) {
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //     final users = snapshot.data!.docs.reversed;
      //
      //     for (var item in users) {
      //       print(item);
      //       final name = item.get('name');
      //       final phone = item.get('phone');
      //       final date = item.get('date');
      //       final time = item.get('time');
      //       itemWidget.add(buildUs(name, phone, date, time));
      //     }
      //     return Expanded(
      //       child: ListView(
      //         reverse: true,
      //         padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      //         children: itemWidget,
      //       ),
      //     );
      //   },
      // ),

      // StreamBuilder<List<ItemListDoctor>>(
      //     stream: readDoctor(),
      //     builder: (context, snapshot) {
      //       if (snapshot.hasData) {
      //         final users = snapshot.data!;
      //         return ListView(
      //           children: users.map(buildUser).toList(),
      //         );
      //       } else {
      //         return Center(
      //           child: CircularProgressIndicator(),
      //         );
      //       }
      //     }),
    );
  }

  Widget isData() => Container(
        margin: const EdgeInsets.all(15),
        child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) => buildUser(context, users[index])),
      );
  Widget noData() => const Center(
        child: Text(
          "There are no Data",
          style: TextStyle(
              fontSize: 24, color: Colors.grey, fontWeight: FontWeight.bold),
        ),
      );

  List<Map<String, String>> users = [];
  bool condition = false;

  Future<void> getService() async {
    bool x = false;
    String username = SharedPrefController().getStringData(key: "username");
    await getServiceData(username).then((value) {
      users = value;
      x = true;
    });
    setState(() {
      condition = x;
    });
  }

  Widget buildUser(context, Map model) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Material(
          elevation: 1,
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
          child: ListTile(
            leading: Container(
              height: 60,
              width: 60,
              child: Material(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0, top: 8.0),
                  child: Center(
                    child: Text(' ${model['time']}',
                        style: TextStyle(color: Colors.black)),
                  ),
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            title: Text('${model['name']}',
                style: TextStyle(
                    color: Colors.black,
                    // fontWeight: FontWeight.bold,
                    fontSize: 20)),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${model['phone']}', style: TextStyle()),
                      SizedBox(
                        height: 5,
                      ),
                      Text('${model['date']}'),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      removeReservationsData(model['name'], model['time'])
                          .then((value) {
                        setState(() {
                          snackBar(context, "تم الحذف بنجاح", Colors.green);
                        });
                      });
                    },
                    icon: Icon(Icons.delete),
                  )
                ],
              ),
            ),
          ),
        ),
      );

  //
  // Stream<List<ItemListDoctor>> readDoctor() => FirebaseFirestore.instance
  //     .collection('reservations')
  //     .snapshots()
  //     .map((snapshot) => snapshot.docs
  //         .map((doc) => ItemListDoctor.fromJson(doc.data()))
  //         .toList());
  //
  // Widget buildUser(ItemListDoctor user) => ListTile(
  //       leading: Text('${user.time}'),
  //       title: Text('${user.name}'),
  //       subtitle: Column(
  //         children: [
  //           Text('${user.phone}'),
  //           SizedBox(
  //             height: 10,
  //           ),
  //           Text('${user.date}'),
  //         ],
  //       ),
  //     );
  //

}
