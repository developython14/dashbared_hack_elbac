import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';

class change_photo extends StatelessWidget {
  const change_photo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    File? cv;
    final hei = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xff3A4750), title: Text('تغيير الصور')),
        body: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: hei * 0.4, bottom: hei * 0.05),
                child: GestureDetector(
                  onTap: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles();

                    if (result != null) {
                    } else {
                      // User canceled the picker
                    }
                  },
                  child: Image.asset('assets/signup3.png'),
                ),
              ),
              ElevatedButton(onPressed: () {}, child: Text('تأكيد التعديل'))
            ],
          ),
        ));
  }
}
