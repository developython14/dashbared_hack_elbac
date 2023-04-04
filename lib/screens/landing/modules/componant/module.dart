import 'package:flutter/material.dart';

class module_componant extends StatelessWidget {
  const module_componant({
    Key? key,
    this.title = 'sala',
    this.abre = 'rem',
    this.path = 'rem',
    required this.hei,
  }) : super(key: key);

  final double hei;
  final String title;
  final String abre;
  final String path;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, path);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 80,
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            Container(
              height: 80,
              width: hei * 0.075,
              child: Center(
                child: CircleAvatar(backgroundImage: NetworkImage(abre)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
