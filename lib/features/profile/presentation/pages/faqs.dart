import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:treat/core/theme/styles.dart';
import 'package:treat/core/widgets/custom_app_bar.dart';
import 'package:treat/core/widgets/custom_icon.dart';


class FAQItem {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});
}

class FaqsScreen extends StatefulWidget {
  const FaqsScreen({super.key});

  @override
  State<FaqsScreen> createState() => _FaqsScreenState();
}

class _FaqsScreenState extends State<FaqsScreen> {
  bool isExpanded = false;
   final List<FAQItem> faqs = [
    FAQItem(
      question: "ما هو Flutter؟",
      answer: "Flutter هو إطار عمل من Google لبناء تطبيقات Android, iOS, والويب من كود واحد.",
    ),
    FAQItem(
      question: "كيف أبدأ في تعلم Flutter؟",
      answer: "ابدأ بتحميل Flutter SDK ثم تعلّم لغة Dart، بعدها اتبع الدورات المجانية على YouTube.",
    ),
    FAQItem(
      question: "هل Flutter مجاني؟",
      answer: "نعم، Flutter مفتوح المصدر ومجاني بالكامل.",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                context.locale.languageCode == 'en'
                    ? SvgPicture.asset(
                      'assets/icons/Back.svg',
                      width: 21.w,
                      height: 19.h,
                    )
                    : RotatedBox(
                      quarterTurns: 2,
                      child: SvgPicture.asset(
                        'assets/icons/Back.svg',
                        width: 21.w,
                        height: 19.h,
                      ),
                    ),
                Spacer(),
                Text('FAQ'.tr(), style: TextStyles.font21PrimarySemiBold),
              ],
            ),
            SizedBox(height: 30.h),
            Expanded(
              child: ListView.builder( 
                itemCount: faqs.length, // عدد الأسئلة
                itemBuilder: (context, index) {
                  return ExpansionTile(
                    title: Text(faqs[index].question,style:TextStyles.font16PrimarySemiBold,), // السؤال
                    children: [ 
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(faqs[index].answer,style:TextStyles.font14PrimaryRegular.copyWith(
                          color: Color(0xff7A7A7A)
                        )), // الإجابة
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
