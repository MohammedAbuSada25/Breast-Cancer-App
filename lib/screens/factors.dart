
import 'package:flutter/material.dart';

import '../widgets/my_button.dart';

class FactorsScreen extends StatelessWidget {
  static const String screenRoute = 'Factors_screen';
  const FactorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorButtonpink,
        title: const Text(
          "العوامل المساعدة للاصابة",
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("images/factors.jpeg",),
              SizedBox(height: 10,),
              Text("العوامل المساعدة للإصابة بسرطان الثدي",
                style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
              SizedBox(height: 5,),
              Text("قد يصيب سرطان الثدي الرجال ولكنه يصيب النساء بشكل أكبر"
                  "\n1. التقدم في العمر (إذا تجاوزت النساء سن 55 فإنهن أكثر عرضة للإصابة بسرطان الثدي)"
                  "\n2. العامل الوراثي: إصابة الأقارب من الدرجة الأولى (بسبب الوراثة) وليس لأسباب أخرى فيجب القيام بالفحص الدوري لسرطان الثدي وسرطان المبايض"
                  "\n3. لتأخر في الحمل بعد عمر 30 سنة، أو عدم الحمل"
                  "\n4. عدم الإرضاع طبيعيًا (الإرضاع الطبيعي يقي النساء من الإصابة بسرطان الثدي)"
                  "\n5. البلوغ في سن مبكرة قبل 12 سنة"
                  "\n6. التأخر في انقطاع (الدورة الشهرية) بعد عمر 55 سنة"
                  "\n7. لتأخر في الحمل بعد عمر 30 سنة، أو عدم الحملبعض أنواع العلاج مثل: العلاج بالأشعة أو العلاج الهرموني أو استخدام وسائل منع الحمل الهرمونية"
                  "\n8. لتعرض للإشعاع في عمر مبكر (قبل الثلاثين)"
                  "\n9. إصابة سابقة بأورام خبيثة في الثدي أو بعض أنواع الأورام الحميدة"
                  "\n10.  السمنة وعدم ممارسة الرياضة"
                  "\n11. تناول المشروبات الكحولية"
                  "\n12. التدخين بكافة أنواعه"
              ),



            ],
          ),
        ),
      ),
    );
  }
}
