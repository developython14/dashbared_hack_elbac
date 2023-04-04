import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';

class payment extends StatelessWidget {
  const payment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'يمكنك الدفع باستخدام Baridi Mob',
                  style: TextStyle(fontSize: 18),
                ),
                Card(
                    child: ListTile(
                  onTap: (() {
                    FlutterClipboard.copy('00799999001486730070').then(
                        (value) =>
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                onVisible: () {},
                                backgroundColor: Colors.white,
                                content: Text(
                                  'تم النسخ بنجاح',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ))));
                  }),
                  leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/three.jpg')),
                  title: Text('00799999001486730070'),
                )),
                Text(
                  'أو عبر البريد ccp',
                  style: TextStyle(fontSize: 18),
                ),
                Card(
                    child: ListTile(
                  onTap: (() {
                    FlutterClipboard.copy('001486730070').then((value) =>
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            onVisible: () {},
                            backgroundColor: Colors.white,
                            content: Text(
                              'تم النسخ بنجاح',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ))));
                  }),
                  leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/barid.png')),
                  title: Text('001486730070'),
                )),
                Text(
                  'اتبع الخطوات الموجودة في الصور',
                  style: TextStyle(fontSize: 18),
                ),
                Image.asset('assets/one.jpg'),
                Image.asset('assets/two.jpg')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
