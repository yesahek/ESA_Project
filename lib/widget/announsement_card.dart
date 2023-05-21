import 'package:e_sup_app/utils/colors.dart';
import 'package:flutter/material.dart';

class AnnounsementCard extends StatelessWidget {
  const AnnounsementCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 50),
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: appColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Text(
            'Announsement',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Text(
            'Content',
            style: TextStyle(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
