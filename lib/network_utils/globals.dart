import 'package:flutter/material.dart';

const String baseURL = 'https://beereapp.edusmart.ng/api/auth';
const Map<String, String> headers = {"Content-Type": "application/json"};
errorSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.green,
    content: Text(text),
    duration: const Duration(seconds: 1),
     ),
    );
}
