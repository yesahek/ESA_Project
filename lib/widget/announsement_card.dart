// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:e_sup_app/utils/colors.dart';

class AnnounsementCard extends StatelessWidget {
  final String imageUrl;
  const AnnounsementCard({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        // margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          // color: appColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ));
  }
}
