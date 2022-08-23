import 'package:flutter/material.dart';

import '../widgets/my_button.dart';

class Treatment extends StatelessWidget {
  const Treatment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorButtonpink,
        title: const Text(
          "طرق العلاج",
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
              Image.asset("images/treatment.jpeg"),
              SizedBox(height: 10,),
              Text("طرق العلاج",
                style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
              SizedBox(height: 5,),
              Text("يتم تحديد العلاج وفقًا لتشخيص المرض (نوع الورم، مرحلته، حجمه) والحالة الصحية للمريضة:"
                  "\n1.الجراحة"
                  "\n2.العلاج الكيميائي والبيولوجي"
                  "\n3.العلاج الإشعاعي"
                  "\n4.العلاج الهرموني"
                  "\n5.العلاج المناعي وغيرها من طرق العلاج المعتمدة"

              ),

            ],
          ),
        ),
      ),
    );
  }
}
