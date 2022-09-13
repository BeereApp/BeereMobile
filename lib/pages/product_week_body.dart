import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductWeek extends StatefulWidget {
  const ProductWeek({Key? key}) : super(key: key);

  @override
  State<ProductWeek> createState() => _ProductWeekState();
}

class _ProductWeekState extends State<ProductWeek> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 150,
      child: PageView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return buildPageItem(index);
          }),
    );
  }

  Widget buildPageItem(int index) {
    return Container(
      height: 220,
      margin: EdgeInsets.only(
        left: 5,
        right: 5,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: HexColor("#FFFFFF"),
          image: DecorationImage(image: AssetImage("assets/5a.png"))),
    );
  }
}
