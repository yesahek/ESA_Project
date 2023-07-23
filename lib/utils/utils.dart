import 'package:flutter/material.dart';

// displaying snackbas
showSnackBar(BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
  ));
}
