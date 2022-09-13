import 'dart:convert';

import 'package:beere/pages/product.dart';
import 'package:beere/pages/product_week_body.dart';
import 'package:beere/widgets/product_list.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/services.dart';
//import 'package:english_words/english_words.dart';

import 'package:speech_to_text/speech_to_text.dart' as stt;
import '../../models/item.dart';
import '../../widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';

class myProduct {
  String name;
  myProduct(this.name);
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //List<Products> products = allProducts;
  // final List<String> products = ["laptop", "phones", "groceries", "blender"];
  late stt.SpeechToText speech;
  bool _isListening = false;
  String textSpeech = "Press the button and start speaking";
  double confidence = 1.0;

  // void initState() {
  //   super.initState();
  //   speech = stt.SpeechToText();
  // }

  // void onListen() async {
  //   if (!_isListening) {
  //     bool available = await speech.initialize(
  //         onStatus: ((status) => print('onStatus: $status')),
  //         onError: ((status) => print('onError $status')));

  //     if (available) {
  //       setState(() {
  //         _isListening = true;
  //         speech.listen(
  //             onResult: ((result) => setState(() {
  //                   textSpeech = result.recognizedWords;
  //                 })));
  //       });
  //     } else {
  //       setState(() {
  //         _isListening = false;
  //         speech.stop();
  //       });
  //     }
  //   }
  // }

  final List<myProduct> products = [];

  var selected = 0;
  List<Widget> buildCategories() {
    return Item.generateProducts()
        .map((e) => Container(
              padding: EdgeInsets.only(left: 15, bottom: 10),
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(2),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(HexColor("#37A3C8")),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    e.name,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: HexColor("#37A3C8"),
                      ),
                    ),
                  ),
                ),
                // Row(
                //   children: [
                //     Text(e.title),
                //     // ClipRRect(
                //     //   borderRadius: BorderRadius.circular(15),
                //     //   child: Text(e.title),
                //     // )
                //   ],
                // ),
              ),
            ))
        .toList();
  }

  bool isLoading = false;
  late List<String> autoCompleteData;
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
      body:  isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
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
                      child:
                // Autocomplete(
                //   optionsBuilder: (textEditingValue) {
                //     if (textEditingValue.text.isEmpty) {
                //       return Iterable<String>.empty();
                //     } else {
                //       return autoCompleteData
                //           .where((word) => word
                //               .toLowerCase()
                //               .contains(textEditingValue.text.toLowerCase()))
                //           .toList();
                //     }
                //   },
                // ),
                      TextField(
                        decoration: InputDecoration(
                          prefixIcon:
                              Icon(Icons.search, color: HexColor("#C4C4C4")),
                          suffixIcon: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AvatarGlow(
                                endRadius: 20,
                                animate: false,
                                glowColor: HexColor("#667080"),
                                duration: Duration(milliseconds: 2000),
                                repeatPauseDuration:
                                    Duration(milliseconds: 100),
                                repeat: true,
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset(
                                    "assets/mic.png",
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 10),
                                height: 30,
                                width: 30,
                                child: Image.asset(
                                  "assets/sliders.png",
                                ),
                              ),
                            ],
                          ),
                          hintText: "Search products, vendors, brands...",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                              // color: HexColor("#667080"),
                            ),
                          ),
                        ),
                        // onChanged: searchProduct,
                      ),
                    ),
                  ),

                  // buildVoiceInput(
                  //   onPressed: _speechRecognitionAvailable && !_isListening
                  //       ? () => start()
                  //       : () => stop(),
                  //   label: _isListening ? 'Listening...' : '',
                  // ),
                  // Expanded(
                  //   child: ListView.builder(
                  //       itemCount: products.length,
                  //       itemBuilder: ((context, index) {
                  //         final product = products[index];
                  //         return ListTile(
                  //           title: Text(product.title),
                  //         );
                  //       })),
                  // )
                  // ProductList(
                  //     selected: selected,
                  //     callback: (int index) {
                  //       setState(() {
                  //         selected = index;
                  //       });
                  //     }),
                  SizedBox(
                    height: 30,
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: buildCategories()),
                  ),
                  //ProductWeek()
                ],
              ),
            ),
    );

    // Widget buildVoiceInput({String label, VoidCallback onPressed}) {
    //   return Padding(
    //     padding: EdgeInsets.all(12),
    //     child: Row(
    //       children: [
    //         TextButton(
    //           onPressed: () {},
    //           child: Text(
    //             label,
    //             style: TextStyle(
    //               color: Colors.white,
    //             ),
    //           ),
    //         ),
    //         IconButton(
    //           icon: Icon(Icons.mic),
    //           onPressed: onPressed,
    //         )
    //       ],
    //     ),
    //   );
    // }

    // void searchProduct(String query) {
    //   final suggestions = products.where((product) {
    //     final productTitle = product.title.toLowerCase();
    //     final input = query.toLowerCase();

    //     return productTitle.contains(input);
    //   }).toList();
    //   setState(() {
    //     products = suggestions;
    //   });
    // }
  }
}
