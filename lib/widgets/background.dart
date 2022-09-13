import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({Key? key, required Padding child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bgimage.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
