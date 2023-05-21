import 'package:flutter/material.dart';

import 'textField.dart';

class Search extends StatelessWidget {
  const Search({required this.searchController, required this.textHint});

  final TextEditingController searchController;
  final String textHint;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyTextField(
            controller: searchController,
            hintText: textHint,
            maxLines: 1,
          ),
          const SizedBox(
            width: 05,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.blue[600],
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.all(12),
            child: const Text(
              "Search",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
