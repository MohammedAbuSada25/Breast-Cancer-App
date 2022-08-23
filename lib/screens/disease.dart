
import 'package:flutter/material.dart';

import '../widgets/my_button.dart';

class DiseaseScreen extends StatelessWidget {
  static const String screenRoute = 'Disease_screen';
  const DiseaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorButtonpink,
        title: const Text(
          "سرطان الثدي",
          style: TextStyle(
              color: Color(0xFFF8F9FA),
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("images/onboard/img3.jpeg"),
            SizedBox(height: 10,),
            Text("ما و مرض السرطان",
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
            SizedBox(height: 5,),
            Text("سرطان الثدي عبارة عن سرطان يتشكل "
                "في خلايا الثديين. ويعد أكثر انتشاراً بين "
                "النساء في سن الانجاب. وقد يصيب سرطان الثدي"
                " كلًّا من الرجال والنساء، إلا إنه أكثر شيوعًا"
                " بين النساء. ويختلف سرطان الثدي عن غيره "
                "من الأورام الخبيثة بقابليته للكشف المبكر "
                "وعلاجه في مراحل مبكرة قبل استفحاله وانتشاره"),
            SizedBox(height: 10,),
            Text("أسباب الاصابة بالمرض",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
            SizedBox(height: 5,),
            Text("لم يتم التعرف على السبب الحقيقي للإصابة بسرطان"
                " الثدي، ولكن هنالك بعض العوامل تؤدي إلى"
                " زيادة خطر الإصابة به. ويعرِّف الأطباء أن م"
                " (تنتقل) من خلال الثدي إلى العُقَد اللمفية"
                " (تحت الإبط)، أو إلى أجزاء أخرى من جسمك."
                ),


          ],
        ),
      ),
    );
  }
}
