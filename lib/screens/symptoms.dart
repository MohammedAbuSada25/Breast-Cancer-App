import 'package:flutter/material.dart';

import '../widgets/my_button.dart';

class Symptoms extends StatelessWidget {
  const Symptoms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorButtonpink,
        title: const Text(
          "أعراض الاصابة بالمرض",
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
              Image.asset("images/symptoms.jpeg"),
              SizedBox(height: 10,),
              Text("غالباً لا تظهر أي أعراض أو علامات عند الإصابة، لكن قد تظهر هذه العلامات في المراحل المتقدمة:",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5,),
              Text("قد يصيب سرطان الثدي الرجال ولكنه يصيب النساء بشكل أكبر"
                  "\n1. ظهور كتلة أو عقدة صلبة غير مؤلمة في الثدي أو تحت الإبط (90% من أورام الثدي لا يصاحبها أي ألم)"
                  "\n2. انتفاخ وتورم الثدي"
                  "\n3. خروج إفرازات من الثدي"
                  "\n4. تغير في حجم وشكل الثدي أو تغيرات في الجلد"
                  "\n5. انعكاس حلمة الثدي (دخولها إلى داخل الثدي) أو انحراف اتجاهها مقارنةً بالحلمة الأخرى"
                  "\n6. حكة، أو تقرحات قشرية أو طفح جلدي حول الثدي"
              ),
              Text("بالرغم من ذلك فإن ظهور الكتل في الثدي لا يعني الإصابة بالسرطان، فقد تكون تكيسات أو عدوى",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
