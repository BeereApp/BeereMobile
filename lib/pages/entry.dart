import 'package:beere/pages/category.dart';
import 'package:beere/pages/user/home.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';

class Entry extends StatelessWidget {
  const Entry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: HexColor("#37A3C8"),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
             margin: const EdgeInsets.only(top: 350),
            child: Image.asset(
                "assets/beere.png",
                width: 100,
                height: 100,
              ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(bottom: 10),
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 250,
                    height: 52,
                    child: ElevatedButton(
                              child: Text(
                                'Get Started',
                                style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                              ),),
                              style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all<Color>(
                                      HexColor("#37A3C8")),
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      Colors.white),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5))),
                                              ),
                              onPressed:
                              // () {
                              //   Navigator.push(
                              //       context, MaterialPageRoute(builder: (context) => Category()));
                              // },
                              () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Category()));
                  },
                              ),
                  ),
                ),
              )
        ],
      ),


    );
  }
  //  Color HexColor(String hexColor) {
  //   final hexCode = hexColor.replaceAll('#', '');
  //   return Color(int.parse('FF$hexCode', radix: 16));
  // }
}
