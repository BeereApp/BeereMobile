import 'package:beere/pages/user/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var url =
        "https://pixabay.com/photos/mountain-landscape-steps-stones-2031539/";
    return Scaffold(
      backgroundColor: HexColor("#ffffff"),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bgimage.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.only(top: 120),
              child: Text(
                'Select Category',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: HexColor("#37A3C8"),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Please select if you are a vendor, manufacturer or a user',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: HexColor("#000000")),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 80),
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 250,
                height: 52,
                child: ElevatedButton(
                  child: Text(
                    'USER',
                    style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                  ),
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(HexColor("#BAC0CA")),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 250,
                height: 52,
                child: ElevatedButton(
                  child: Text(
                    'VENDOR',
                    style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                  ),
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(HexColor("#BAC0CA")),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Category()));
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 250,
                height: 52,
                child: ElevatedButton(
                  child: Text(
                    'MANUFACTURER',
                    style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                  ),
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(HexColor("#BAC0CA")),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Category()));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
