import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class faq extends StatelessWidget {
  const faq({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppBar(
              title: Text('الأحكام والشروط'),
              backgroundColor: Color(0xff3A4750),
            ),
            body: Center(
                child: Column(
              children: [
                GFAccordion(
                    title: 'القانون 1',
                    content:
                        'جميع حقوق منصة هاك الباك محفوظة ولا يُسمح لأي مسجل بنشر الوحدات إما فيديوهات أو ملفات لأصدقائه أو في وسائل التواصل الإجتماعي.'),
                GFAccordion(
                    title: 'القانون2',
                    content:
                        'يتعرض كل ناشر للوحدات إما فيديوهات أو ملفات إلى تعطيل حسابه على منصة هاك الباك و حذف جميع الوحدات التي كان مسجل بها من قبل'),
                GFAccordion(
                  title: 'القانون 3',
                  content:
                      'كل مسجل يقوم بنشر الوحدات إما فيديوهات أو ملفات بشكل مخالف يخضع لمتابعة قضائية من قبل الجهات الأمنية.',
                )
              ],
            ))),
      ),
    );
  }
}
