import 'package:flutter/material.dart';

import '../widgets/my_button.dart';

class Prevention extends StatelessWidget {
  const Prevention({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorButtonpink,
        title: const Text(
          "طرق الوقاية",
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
              Image.asset("images/prevention.jpeg"),
              SizedBox(height: 10,),
              Text("الوقاية من الإصابة بسرطان الثدي",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5,),
              Text("1. الغذاء الصحي والرياضة(المشي ساعة واحدة على الأقل أسبوعياً) والمحافظة على الوزن الصحي"
                  "\n2. استشارة الطبيب في حال استخدام الهرمونات البديلة"
                  "\n3. حرص النساء على ارضاع أطفالهن رضاعة طبيعية"
                  "\n4. الامتناع عن التدخين بكافة أنواعه وتجنب التدخين السلبي (الجلوس جوار المدخنين)"
                  "\n5. الامتناع عن تناول المشروبات الكحولية"
                  "\n6. الفحص الذاتي للثدي بشكل دائم بعد كل دورة شهرية"
                  "\n7. الانخراط في برنامج الكشف المبكر والذي يتم سنوياً"
              ),


            ],
          ),
        ),
      ),
    );
  }
}
