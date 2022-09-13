import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {

  bool isLoading = false;
   List<String>? autoCompleteData;
  Future fetchAutoCompleteData() async {
    setState(() {
      isLoading = true;
    });
    final String stringData = await rootBundle.loadString("assets/data.json");
    final List<dynamic> json = jsonDecode(stringData);
    final List<String> jsonStringData = json.cast<String>();

    setState(() {
      isLoading = false;
      autoCompleteData = jsonStringData;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchAutoCompleteData;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    margin: EdgeInsets.only(top: 40),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Welcome,",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: HexColor("#667080")),
                              ),
                            ),
                            Text(
                              'Samson',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: HexColor("#667080")),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.only(right: 15),
                              height: 40,
                              width: 40,
                              child: Image.asset(
                                "assets/vector.png",
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                'assets/homepics.jpg',
                                width: 30,
                                height: 30,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Material(
                      elevation: 5,
                      shadowColor: HexColor("#C4C4C4"),
                      borderRadius: BorderRadius.circular(12),
                      child:  Autocomplete(
                  optionsBuilder: (textEditingValue) {
                    if (textEditingValue.text.isEmpty) {
                      return Iterable<String>.empty();
                    } else {
                      return autoCompleteData!
                          .where((word) => word
                              .toLowerCase()
                              .contains(textEditingValue.text.toLowerCase()))
                          ;
                    }
                  },
                ),
                      //  TextField(
                      //   decoration: InputDecoration(
                      //     prefixIcon:
                      //         Icon(Icons.search, color: HexColor("#C4C4C4")),
                      //     suffixIcon: Row(
                      //       mainAxisAlignment: MainAxisAlignment.end,
                      //       mainAxisSize: MainAxisSize.min,
                      //       children: [
                      //          Container(
                      //             height: 20,
                      //             width: 20,
                      //             child: Image.asset(
                      //               "assets/mic.png",
                      //             ),
                      //           ),
                      //         Container(
                      //           padding: EdgeInsets.only(right: 10),
                      //           height: 30,
                      //           width: 30,
                      //           child: Image.asset(
                      //             "assets/sliders.png",
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //     hintText: "Search products, vendors, brands...",
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(20),
                      //       borderSide: BorderSide(
                      //         width: 0,
                      //         style: BorderStyle.none,
                      //         // color: HexColor("#667080"),
                      //       ),
                      //     ),
                      //   ),

                      // ),
                    ),
                  ),
                ],
              ),
            ),
        );
  }
}
