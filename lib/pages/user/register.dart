import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:beere/pages/user/confirm.dart';
import 'package:beere/pages/user/home.dart';
import 'package:beere/pages/user/homepage.dart';
import 'package:beere/pages/user/login.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
// import 'package:dropdownfield/dropdownfield.dart';
import 'package:http/http.dart' as http;

import '../../network_utils/auth_service.dart';
import '../../network_utils/globals.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _register = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final ageController = SingleValueDropDownController();
  final genderController = SingleValueDropDownController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = true;

  bool _isLoading = false;

  _signup() async {
    var data = {
      'role_id': 1,
      'firstname': firstNameController.text,
      'lastname': lastNameController.text,
      'email': emailController.text,
      'phone': phoneController.text,
      'age': ageController.dropDownValue!.name,
      'gender': genderController.dropDownValue!.name,
      'password': passwordController.text,
      'password_confirmed': confirmPasswordController.text
    };
    var res = await APIService().registerUser(data);
    print("This is the res body $res"); //if its success


    // print(body);
    // var token = body['token'];
    // print(token);
    //print("This is the token $token");
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   firstNameController.dispose();
  //   lastNameController.dispose();
  //   emailController.dispose();
  //   phoneController.dispose();
  //   ageController.dispose();
  //   genderController.dispose();
  //   passwordController.dispose();
  //   confirmPasswordController.dispose();
  // }

  // void createAccount() async {
  //   bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9. !#$%&'*+-/]")
  //       .hasMatch(emailController.toString());
  //   if (emailValid) {
  //     http.Response response = await AuthServices.register(
  //       firstNameController.toString(),
  //       lastNameController.toString(),
  //       emailController.toString(),
  //       ageController.toString(),
  //       phoneController.toString(),
  //       genderController.toString(),
  //       passwordController.toString(),
  //       confirmPasswordController.toString(),
  //     );
  //     Map responseMap = jsonDecode(response.body);
  //     if (response.statusCode == 200) {
  //       Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => HomePage()));
  //     } else {
  //       errorSnackBar(context, responseMap.values.first[0]);
  //     }
  //   } else {
  //     errorSnackBar(context, 'email not valid');
  //   }
  // }
//   final gender = TextEditingController();
// List<String> cities = [
//     'Bangalore',
//     'Chennai',
//     'New York',
//     'Mumbai',
//     'Delhi',
//     'Tokyo',
//   ];

  @override
  Widget build(BuildContext context) {
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
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Center(
                    child: Container(
                        margin: EdgeInsets.only(top: 50),
                        alignment: Alignment.topLeft,
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: HexColor("#C4C4C4"),
                          child: IconButton(
                            padding: EdgeInsets.only(left: 5),
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 15,
                            ),
                            onPressed: null,
                          ),
                        )),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  //padding: EdgeInsets.only(left: 20),
                  margin: EdgeInsets.only(
                    top: 80,
                    left: 15,
                  ),
                  child: Text(
                    'Register',
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
                  height: 20,
                ),
                SizedBox(
                  height: 10,
                ),
                Form(
                  key: _register,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          "First Name",
                          style: GoogleFonts.inter(
                            height: 2,
                            textStyle: TextStyle(
                                fontSize: 14, color: HexColor("#667080")),
                          ),
                        ),
                        subtitle: TextFormField(
                          controller: firstNameController,
                          validator: (String? val) {
                            if (val!.isEmpty) {
                              return "Empty";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: HexColor("#E5E5E5"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ListTile(
                        title: Text(
                          "Last Name",
                          style: GoogleFonts.inter(
                            height: 2,
                            textStyle: TextStyle(
                                fontSize: 14, color: HexColor("#667080")),
                          ),
                        ),
                        subtitle: TextFormField(
                          controller: lastNameController,
                          validator: (String? val) {
                            if (val!.isEmpty) {
                              return "Empty";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: HexColor("#E5E5E5"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ListTile(
                        title: Text(
                          "Email",
                          style: GoogleFonts.inter(
                            height: 2,
                            textStyle: TextStyle(
                                fontSize: 14, color: HexColor("#667080")),
                          ),
                        ),
                        subtitle: TextFormField(
                          controller: emailController,
                          validator: (String? val) {
                            if (val!.isEmpty) {
                              return "Empty";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: HexColor("#E5E5E5"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ListTile(
                        title: Text(
                          "Phone Number",
                          style: GoogleFonts.inter(
                            height: 2,
                            textStyle: TextStyle(
                                fontSize: 14, color: HexColor("#667080")),
                          ),
                        ),
                        subtitle: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: phoneController,
                          validator: (String? val) {
                            if (val!.isEmpty) {
                              return "Empty";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: HexColor("#E5E5E5"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          // Expanded(
                          //   child: ListTile(
                          //     title: Text("Age range:", style: GoogleFonts.inter(
                          //       textStyle: TextStyle(
                          //           fontSize: 14, color: HexColor("#667080")),
                          //     ),
                          //   ),
                          //   subtitle: TextFormField(
                          //       decoration: InputDecoration(
                          //         border: OutlineInputBorder(
                          //           borderRadius: BorderRadius.circular(12),
                          //           borderSide: BorderSide.none,
                          //         ),
                          //         filled: true,
                          //         fillColor: HexColor("#E5E5E5"),
                          //         hintText: "18 - 34",
                          //         suffixIcon: Icon(Icons.arrow_drop_down_sharp)
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // Expanded(
                          //   child: DropdownButtonFormField<String>(
                          //     value: _currentSugars,
                          //     items: sugars.map((sugar) {
                          //       return DropdownMenuItem(
                          //         value: sugar,
                          //         child: Text('$sugar sugars'),
                          //       );
                          //     }).toList(),
                          //     onChanged: (val) =>
                          //         setState(() => _currentSugars = val),
                          //   ),
                          // ),
                          // DropDownField(
                          //   controller: ,
                          // ),

                          Expanded(
                            child: ListTile(
                              title: Text(
                                "Age range:",
                                style: GoogleFonts.inter(
                                  height: 2,
                                  textStyle: TextStyle(
                                      fontSize: 14, color: HexColor("#667080")),
                                ),
                              ),
                              subtitle: DropDownTextField(
                                singleController: ageController,
                                textFieldDecoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  fillColor: HexColor("#E5E5E5"),
                                  hintText: "18 - 34",
                                ),
                                dropDownItemCount: 5,
                                dropDownList: [
                                  DropDownValueModel(
                                      name: "18-34", value: "first"),
                                  DropDownValueModel(
                                      name: "35-50", value: "second"),
                                  DropDownValueModel(
                                      name: "51-69", value: "third"),
                                  DropDownValueModel(
                                      name: "70-87", value: "fourth"),
                                ],
                              ),
                            ),
                          ),

                          Expanded(
                            child: ListTile(
                              title: Text(
                                "Gender:",
                                style: GoogleFonts.inter(
                                  height: 2,
                                  textStyle: TextStyle(
                                      fontSize: 14, color: HexColor("#667080")),
                                ),
                              ),
                              subtitle: DropDownTextField(
                                singleController: genderController,
                                textFieldDecoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  fillColor: HexColor("#E5E5E5"),
                                  hintText: "Select Gender",
                                ),
                                dropDownItemCount: 5,
                                dropDownList: [
                                  DropDownValueModel(
                                      name: "Male", value: "first"),
                                  DropDownValueModel(
                                      name: "Female", value: "second"),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ListTile(
                        title: Text(
                          'Password',
                          style: GoogleFonts.inter(
                            height: 2,
                            textStyle: TextStyle(
                                fontSize: 14, color: HexColor("#667080")),
                          ),
                        ),
                        subtitle: TextFormField(
                          controller: passwordController,
                          validator: (String? val) {
                            if (val!.isEmpty) {
                              return "Empty";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: HexColor("#E5E5E5"),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                              child: Icon(_isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                          ),
                          obscureText: _isPasswordVisible,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ListTile(
                        title: Text(
                          "Confirm Password",
                          style: GoogleFonts.inter(
                            height: 2,
                            textStyle: TextStyle(
                                fontSize: 14, color: HexColor("#667080")),
                          ),
                        ),
                        subtitle: TextFormField(
                          controller: confirmPasswordController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Empty";
                            } else if (val != passwordController.text) {
                              return "Not Match";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: HexColor("#E5E5E5"),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                                child: Icon(_isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              )),
                          obscureText: _isPasswordVisible,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: Container(
                          // decoration: BoxDecoration(
                          //      border: Border(bottom: BorderSide(width: 2.0, color: HexColor("#000000"),)),
                          //     ),
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(left: 90),
                          child: Text(
                            'Already have an account',
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                color: HexColor("#FFC416"),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        height: 52,
                        width: 250,
                        child: ElevatedButton(
                            child: Text(
                              _isLoading ? "Creating...." : 'Register',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(fontSize: 20),
                              ),
                            ),
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        HexColor("#FFFFFF")),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        HexColor("#37A3C8")),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)))),
                            onPressed: () {
                              //createAccount();
                              _signup();
                              //_isLoading ? null : _handleSignUp();
                            }
                            // () {
                            //   Navigator.push(context,
                            //       MaterialPageRoute(builder: (context) => HomePage()));
                            // },
                            ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  
}

//lateef raji male latechsolution13@gmail.com 123@Ajiboy 08175412933