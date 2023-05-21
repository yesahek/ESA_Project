// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final bool backArrow;
  final String title;
  const MyAppBar({
    Key? key,
    required this.backArrow,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      //padding: const EdgeInsets.only(left: 4.0, right: 8.0, top: 5, bottom: 8),
      padding: const EdgeInsets.all(3),
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                backArrow
                    ? IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                        ),
                      )
                    : Container(
                        child: Column(
                          children: [
                            Text(
                              'Hi Isaac,',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Student',
                            ),
                          ],
                        ),
                      ),
              ],
            ),
            if (backArrow)
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            Container(
              decoration: BoxDecoration(
                color: Colors.blue[600],
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12),
              child: const Icon(
                Icons.notifications,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
