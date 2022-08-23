import 'package:flutter/material.dart';

import '../widgets/my_button.dart';

class Diagnosis extends StatelessWidget {
   Diagnosis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorButtonpink,
        title: const Text(
          "طرق التشخيص",
          style: TextStyle(
              color: Color(0xFFF8F9FA),
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 5,),
              Text("طرق تشخيص سرطان الثدي",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5,),
              Text("أولا الفحص الذاتي",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5,),
              Text("جب على جميع النساء القيام به كل شهر،"
                  " وذلك بعد الدورة الشهرية بثلاثة أيام"
                  " إلى خمسة أيام، ويجب زيارة الطبيب عند ملاحظة أي تغيرات"
                  "\nوتتلخص طرق الفحص الذاتي كما هو موضح  في الرسومات التالية"
                  ,style: TextStyle(
                  fontSize: 17,
                  ),
              ),
              SizedBox(height: 5,),
              Item(index: 0),
              SizedBox(height: 5,),
              Item(index: 1),
              SizedBox(height: 5,),
              Item(index: 2),
              SizedBox(height: 5,),
              Item(index: 3),
              SizedBox(height: 5,),
              Item(index: 4),
              SizedBox(height: 5,),
              Item(index: 5),
              SizedBox(height: 5,),
              Text("ثانيا الفحص السريري",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5,),
              Text("وهو الفحص الذي يتم اجراؤه في المستشفيات أو المراكز الطبية المعنية بذلك.",
                style: TextStyle(
                    fontSize: 17,
                ),
              ),
              SizedBox(height: 5,),
              Text("ثالثا الفحص الإشعاعي للثدي (الماموجرام):",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5,),
              Text("وهو تصوير الثدي بالأشعة السينية، ويعتبر"
                  " أدق وسيلة للكشف المبكر عن سرطان الثدي."
                  " حيث يمكنه الكشف عن السرطان عندما يكون"
                  " حجمه صغيرًا مما يساعد على المعالجة مبكرًا.",
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              SizedBox(height: 5,),
              Text("ننصح جميع النساء بإجراء هذا الفحص كل "
                  "سنة على الأقل خصوصاً بعد بلوغ سن الأربعين",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              SizedBox(height: 5,),
              Text("أهمية الفحص المبكر لسرطان الثدي",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5,),
              Text("الفحص المبكر لسرطان الثدي يساعد بنسبة"
                  " (90%) في معالجته والشفاء منه. وتقل نسبة"
                  " الشفاء من سرطان الثدي وتصل إلى (40%)"
                  " إذا تم اكتشافه في مراحل متأخرة.",
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget Item({required int index}) => Material(
    elevation: 2,
    shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10)),
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Text(textItem[index]),
          Image.asset(imgItem[index],height: 200,width: 200,)
        ],
      ),
    ),
  );

  List textItem =[
    "قفي أمام مرآه كبيرة وانزعي ملابسك حتى الخصر",
    "ضعي يديك على خصرك ومن خلال النظر راقبي شكل ثديك واستدارته أو تغير الحلمة",
    "ارفعي ذراعيكِ لأعلى ( مضمومتان فوق الرأس )  ولاحظي أي تغيير في ثديك من حيث الحجم وارتفاعهما إلى الأعلى بنفس النسبة",
    "افصحي ثديك بضغط خفيف بشكل دائري",
    "استلقي على ظهرك",
    "تأكدي من عدم وجود افرازات أو أي سائل غريب من الحلمة",
  ];
  List imgItem = [
    "images/diagnosis/diagnosis1.jpeg",
    "images/diagnosis/diagnosis2.jpeg",
    "images/diagnosis/diagnosis3.jpeg",
    "images/diagnosis/diagnosis4.jpeg",
    "images/diagnosis/diagnosis5.jpeg",
    "images/diagnosis/diagnosis6.jpeg",

  ];
}
