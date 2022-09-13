import 'package:flutter/material.dart';

import './pages/entry.dart';

String token = '';
String phone = '';
void main() {
  runApp(const MyApp());
}

// void requestPermisssion() async {
//   PermissionStatus permission = await permissionHandler()
//       .checkPermissionStatus(PermissionGroup.microphone);

//   if (permission != PermissionStatus.granted) {
//     await PermissionHandler().requestPermisssions([PermissionGroup.microphone]);
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'Inter',
            textTheme: ThemeData.light().textTheme.copyWith()),
        home: Scaffold(
          body: Entry(),
        ));
  }
}
