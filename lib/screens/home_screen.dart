import 'package:breast_cancer/widgets/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'treatment.dart';
import 'welcome_screen.dart';
import 'diagnosis.dart';
import 'disease.dart';
import 'factors.dart';
import 'chat_screen.dart';
import 'prevention.dart';
import 'seeDoctor.dart';
import 'symptoms.dart';

class HomeScreen extends StatefulWidget {
  static const String screenRoute = 'Home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _advancedDrawerController = AdvancedDrawerController();

  List<Image> list = [
    Image.asset(
      "images/onboard/img1.jpeg",
    ),
    Image.asset(
      "images/onboard/img2.jpeg",
    ),
    Image.asset(
      "images/onboard/img3.jpeg",
    ),
  ];

  var boardControl = PageController();
  final _auth = FirebaseAuth.instance;

  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
        backdropColor: colorButtonpink,
        controller: _advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        animateChildDecoration: true,
        rtlOpening: true,
        // openScale: 1.0,
        disabledGestures: false,
        drawer: SafeArea(
          child: Container(
            child: ListTileTheme(
              textColor: Colors.white,
              iconColor: Colors.white,
              child: Column(
                children: [
                  Container(
                    width: 128.0,
                    height: 128.0,
                    margin: const EdgeInsets.only(
                      top: 24.0,
                      bottom: 40.0,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      shape: BoxShape.circle,
                    ),
                    child: Material(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset('images/logo.png',),
                        )),
                  ),
                  // ListTile(
                  //   onTap: () {
                  //      navigatePush(context, HomeScreen());
                  //   },
                  //   leading: Icon(Icons.home),
                  //   title: Text('الرئيسية'),
                  // ),
                  ListTile(
                    onTap: () {
                      navigatePush(context, DiseaseScreen());
                    },
                    leading: Icon(Icons.workspaces_filled),
                    title: Text('ما هو المرض'),
                  ),
                  ListTile(
                    onTap: () {
                      navigatePush(context, FactorsScreen());
                    },
                    leading: Icon(Icons.menu),
                    title: Text('العوامل المساعدة للاصابة'),
                  ),
                  ListTile(
                    onTap: () {
                      navigatePush(context, Symptoms());
                    },
                    leading: Icon(Icons.error),
                    title: Text('أعراض المرض'),
                  ),
                  ListTile(
                    onTap: () {
                      navigatePush(context, SeeDoctor());
                    },
                    leading: Icon(Icons.person),
                    title: Text('رؤية الطبيب'),
                  ),
                  ListTile(
                    onTap: () {
                      navigatePush(context, Diagnosis());
                    },
                    leading: Icon(Icons.favorite),
                    title: Text('طرق التشخيص'),
                  ),
                  ListTile(
                    onTap: () {
                      navigatePush(context, Treatment());
                    },
                    leading: Icon(Icons.favorite),
                    title: Text('طرق العلاج'),
                  ),
                  ListTile(
                    onTap: () {
                      navigatePush(context, Prevention());
                    },
                    leading: Icon(Icons.favorite),
                    title: Text('طرق الوقاية'),
                  ),
                  ListTile(
                    onTap: () {
                      navigatePush(context, ChatScreen());
                    },
                    leading: Icon(Icons.chat),
                    title: Text('المحادثة الجماعية'),
                  ),
                  ListTile(
                    onTap: () {
                      _auth.signOut();
                      Navigator.pushReplacementNamed(context,WelcomeScreen.screenRoute);

                    },
                    leading: Icon(Icons.settings),
                    title: Text('تسجيل الخروج'),
                  ),
                 Spacer(),
                ],
              ),
            ),
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: colorButtonpink,
            elevation: 0,
            leading: IconButton(
              onPressed: _handleMenuButtonPressed,
              icon: ValueListenableBuilder<AdvancedDrawerValue>(
                valueListenable: _advancedDrawerController,
                builder: (_, value, __) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: Icon(
                      value.visible ? Icons.clear : Icons.menu,
                      key: ValueKey<bool>(value.visible),
                    ),
                  );
                },
              ),
            ),
            title: const Text(
              "الرئيسية",
              style: TextStyle(
                  color: Color(0xFFF8F9FA),
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    onboarding(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 20,),
                        Text(" في سرطان الثدي الفحص المبكر خيرآ من العلاج الفحص المبكر يحدث فرق"
                            " \n لا تنتظري الاعراض إفحصيه كرمال ما تخسريه",
                          style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                        SizedBox(height: 20,),
                        Text("تجربة سابقة",
                          style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.blue),),
                        SizedBox(height: 10,),
                        Text("خديجة مصطفى فلسطينية من غزة، عمرها 42 عاماً،"
                            " انقلبت حياتها منذ نحو ستة أشهر،"
                            " تروي حكايتها مع مرض السرطان لـ العربي الجديد.",
                          style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Text("في البداية كنت أرى شيئاً صغيراً في ثديي، أهملته، ظناً مني أنه "
                            "كيس دهني. ومع ضغط عملي في التعليم وحاجات الأسرة والأبناء"
                            " لم أزر الطبيب للأسف، فأنا بطبعي قوية ولا أمرض كثيراً."
                            " لكني تفاجأت بأن الكتلة أصبحت أكبر، فأجريت صور أشعة "
                            "وتحاليل دقيقة. نتائج الصور استدعت إجراء المزيد من الفحوص",
                          style: TextStyle(fontSize: 15,),),
                        SizedBox(height: 5,),
                        Text("في الموعد الثاني، رأيت الطبيب يتحدث مع زوجي عند باب العيادة،"
                            " عندها أحسست بأن شيئا خطيرا قد أصابني وشعرت بالدوار."
                            " لم يخبرني زوجي شيئاً، لكن الحزن كان بادياً على وجهه."
                            " عند عودتنا إلى البيت بدأ زوجي بالبكاء،"
                            " وعلمت منه أنني مصابة بسرطان الثدي وفي مرحلته الخبيثة.",
                          style: TextStyle(fontSize: 15,),),
                        SizedBox(height: 5,),
                        Text("أتلقى اليوم العلاج الكيمياوي والعلاج بالأشعة"
                            " داخل إسرائيل، من خلال نظام تحويلات عبر وزارة"
                            " الصحة، لعدم توافر أجهزة ومعدات صحية لاستيعاب"
                            " الأعداد الكبيرة من مرضى السرطان في قطاع غزة."
                            " وعلاجي يخفّض درجة الورم من الأولى إلى الثانية،"
                            " وهناك علاجات أخرى تُصرف من وزارة الصحة في غزة.",
                          style: TextStyle(fontSize: 15,),),
                        SizedBox(height: 5,),
                        Text("جسدياً، تساقط شعري كثيراً وأعاني "
                            "من ضيق نفس وألم في الصدر، أما نفسياً فأنا محطمة لأنني"
                            " أم لأربع بنات، أكبرهن في أولى ثانوي، وولدين صغيرين."
                            " حياتي تغيّرت لأن كل أحلامي مع أبنائي أصبحت وهماً. وقد أكمل"
                            " عاماً أو عامين في العلاج وبعدها أذهب لربي، كما أنني"
                            " حصلت على إجازة من عملي في تدريس المواد الاجتماعية"
                            " في إحدى المدارس الحكومية، لأنني لم أعد قادرة على"
                            " متابعة طالباتي. ولا أريد أن تتغير صورتي أمامهن؛ فكثير"
                            " من الناس ينظرون إليّ نظرة استعطاف، وهذه النظرة مميتة.",
                          style: TextStyle(fontSize: 15,),),
                        SizedBox(height: 5,),
                        Text("تروي خديجة أصعب اللحظات، تقول:",
                          style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                        SizedBox(height: 5,),
                        Text("عندما أتوجه لحجز موعد العلاج في المستشفى،"
                            " أو طلب التحويلة، عندها أشعر كغيري من مرضى"
                            " السرطان بالإذلال، نظراً لظروف الحصار والاحتلال،"
                            " وعدم وجود آلية سلسة لتنسيق أحوال مرضى السرطان."
                            " ولا أجد من يمدني بالقوة في لحظات المرض عموماً،"
                            " إلا زوجي فهو الذي يمنحني القوة فقط.",
                          style: TextStyle(fontSize: 15,),),
                        SizedBox(height: 5,),
                        Text("لا أستطيع التعبير "
                            "عن ألمي أمام أولادي لشدة تعلّقهم بي، وأنا أريد"
                            " أن أمنحهم القوة للحفاظ على مستواهم الدراسي،"
                            " ولا أُشعر العائلة بضعفي. زوجي هو الوحيد الذي"
                            " أعبّر له عن آلامي، لكي أخفف عن نفسي همّ مرضي.",
                          style: TextStyle(fontSize: 15,),),
                        SizedBox(height: 5,),
                        Text("أكثر ما يخيفني أن أموت"
                            " فجأة قبل تدبّر أمور أولادي وبناتي، لأنني حالياً"
                            " أعزز ثقتهم بأنفسهم لكي يكونوا أقوياء أكثر،"
                            " فهم أكثر ما أخاف عليه من الأيام. وأسعى جاهدة"
                            " لتحمل كل آلام المرض، وأتابع العلاج وأتحمّل كل "
                            "الصعوبات لكي أصمد وأعيش أكبر قدر من الوقت معهم.",
                          style: TextStyle(fontSize: 15,),),
                        SizedBox(height: 5,),
                        Text("السرطان هو "
                            "الشيء القاسي الذي قد يحرمني من أبنائي بسرعة،"
                            " لأنني قرأت عنه كثيراً بالطبع، كما أننا في "
                            "قطاع غزة نشاهد الحالات أمامنا، ونرى كيف يموت"
                            " المرضى لعدم توافر سبل العلاج وإغلاق المعابر."
                            " وتنعكس الظروف الصحية الكئيبة على نفسية المرضى"
                            " الذين أصبحت منهم الآن، لكنني أريد أن أصمد.",
                          style: TextStyle(fontSize: 15,),),
                        SizedBox(height: 5,),
                        Text('الأطباء يتعاطون معي بروح جميلة عندما يعلمون أنني أم'
                            ' لستة أبناء وأنني معلمة. يحاولون زرع الثقة في '
                            'نفسي، حتى من قابلتهم في الداخل الفلسطيني ومنهم'
                            ' أجانب من الخارج، كانوا يحدثوني عن نماذج أمهات'
                            ' صمدن أمام المرض. طلبوا مني مرة صور أولادي، '
                            'وأرسلوا لهم رسالة خطية مفادها أن "أمكم قوية'
                            ' وستكون بخير دائماً لأجلكم وكونوا سعداء معها".',
                          style: TextStyle(fontSize: 15,),),
                        SizedBox(height: 5,),
                        Text('أبتعد عن الأهل، لأنني لا أرغب كثيراً في'
                            ' التحدث عن مرضي، وأحاول عدم الاختلاط لهذا السبب.',
                          style: TextStyle(fontSize: 15,),),
                        SizedBox(height: 5,),
                        Text('وأهم عوارض العلاج كانت كثرة التجاعيد في الجلد،'
                            ' وتساقط الشعر، والوهن، خصوصاً عند الاستيقاظ،'
                            ' وضعف الحركة وقلة الشهية، والضيق الشديد في النفس.',
                          style: TextStyle(fontSize: 15,),),
                        SizedBox(height: 5,),
                        Text("وتخلص بالقول:",
                          style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                        SizedBox(height: 5,),
                        Text("قبل المرض لم ينقصني شيء"
                            " رغم كل الظروف الاجتماعية والاقتصادية السيئة،"
                            " طالما أن أولادي وزوجي معي، لكنني الآن أفتقد"
                            " صحتي التي كنت أريد الحفاظ عليها فقط لأجل أبنائي.",
                          style: TextStyle(fontSize: 15,),),
                      ],
                    ),
                    // MyButton(
                    //     color: colorButtonpink!,
                    //     title: "التعرف على المرض",
                    //     onPressed: (){
                    //       Navigator.pushNamed(context, DiseaseScreen.screenRoute);
                    //     }),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }

  Widget onboarding() => Container(
        height: 200,
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index) => list[index],
                itemCount: list.length,
                controller: boardControl,
                physics: BouncingScrollPhysics(),
                onPageChanged: (index) {
                  // if (index == list.length - 1) {
                  //   setState(() {
                  //     isLast = true;
                  //     index = 1;
                  //   });
                  // } else
                  //   setState(() {
                  //     isLast = false;
                  //   });
                },
              ),
            ),

            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardControl,
                  count: list.length,
                  effect: ExpandingDotsEffect(
                      activeDotColor: Colors.blue,
                      dotHeight: 8,
                      dotWidth: 8,
                      expansionFactor: 3,
                      spacing: 5.0),
                ),
                // Spacer(),
                // FloatingActionButton(
                //   onPressed: () {
                //     if (isLast) {
                //
                //       // navigatortopushReplacement(context,LoginScreen());
                //     } else {
                //       boardControl.nextPage(
                //           duration: Duration(milliseconds: 700),
                //           curve: Curves.fastLinearToSlowEaseIn);
                //     }
                //   },
                //   child: Icon(Icons.arrow_forward_ios),
                // )
              ],
            ),
          ],
        ),
      );
}
