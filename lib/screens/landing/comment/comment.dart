import 'package:flutter/material.dart';

class comments extends StatefulWidget {
  const comments({Key? key}) : super(key: key);

  @override
  State<comments> createState() => _commentsState();
}

class _commentsState extends State<comments> {
  @override
  Widget build(BuildContext context) {
    var toma = [2, 2, 2, 2, 2];
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://media.licdn.com/dms/image/C4E03AQG5Jvo_fUP0Sg/profile-displayphoto-shrink_800_800/0/1629473101419?e=1685577600&v=beta&t=ZxDA-KF5Xy5F2LHLQQEIp9SiKaarbN_KDXdaw9uZCFE')),
                title: Text('Mustapha Belkassem'),
                subtitle: Text(
                    'انه تطبيق رائع وانا من بعد كي شفت ال تسجيل الأعضاء يمكنك أن تضيف هذه اللعبة للألعاب بمختلف أنواعها من بعد ما عمر ب ببركان ينددون بسلوك و اخلاق ولللي اي شيئ راسلني اخي انا ثان شكيت واحد من بعد كي شفت'),
                isThreeLine: true,
              ),
            );
          },
          itemCount: toma.length,
        ),
      ),
    );
  }
}
