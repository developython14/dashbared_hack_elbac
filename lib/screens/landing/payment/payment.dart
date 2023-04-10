import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';

class payment extends StatefulWidget {
  const payment({Key? key}) : super(key: key);

  @override
  State<payment> createState() => _paymentState();
}

class _paymentState extends State<payment> {
  Future<void> _dialogBuilder_change_rip(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('ccp number'),
          content: Form(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextFormField(
                decoration:
                    InputDecoration(hintText: 'put your new ccp number'),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ],
          )),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('exit'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('confirm '),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _dialogBuilder_change_images(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Images'),
          content: Form(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(onPressed: () {}, child: Text('add new image')),
              ListTile(
                textColor: Colors.red,
                trailing: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://th.bing.com/th/id/OIP.4XB8NF1awQyApnQDDmBmQwHaEo?pid=ImgDet&rs=1')),
                title: Text('remove this'),
                onTap: () {},
              ),
              ListTile(
                textColor: Colors.red,
                trailing: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://th.bing.com/th/id/OIP.4XB8NF1awQyApnQDDmBmQwHaEo?pid=ImgDet&rs=1')),
                title: Text('remove this'),
                onTap: () {},
              )
            ],
          )),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('exit'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('confirm '),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

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
                      backgroundImage: NetworkImage(
                          'https://hakelbac.com/uploads//1663192164422-hakelbac-received_1464983610680964.jpeg')),
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
                      backgroundImage: NetworkImage(
                          'https://hakelbac.com/uploads//1663192146688-hakelbac-received_1092412781474589.jpeg')),
                  title: Text('001486730070'),
                )),
                ElevatedButton(
                    onPressed: () {
                      _dialogBuilder_change_rip(context);
                    },
                    child: Text('change ccp account')),
                ElevatedButton(
                    onPressed: () {
                      _dialogBuilder_change_images(context);
                    },
                    child: Text('change image discreptions')),
                Text(
                  'اتبع الخطوات الموجودة في الصور',
                  style: TextStyle(fontSize: 18),
                ),
                Image.network(
                    'https://hakelbac.com/uploads//1663192164422-hakelbac-received_1464983610680964.jpeg'),
                Image.network(
                    'https://hakelbac.com/uploads//1663192146688-hakelbac-received_1092412781474589.jpeg')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
