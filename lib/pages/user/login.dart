import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:beere/pages/user/forget.dart';
import 'package:beere/pages/user/register.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../network_utils/auth_service.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isPasswordVisible = true;
  bool _isLoading = false;

  final _login = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late ScaffoldState scaffoldState;
  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      action: SnackBarAction(label: 'Close', onPressed: () {}),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: HexColor("#ffffff"),
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
                  margin: EdgeInsets.only(
                    top: 100,
                    left: 15,
                  ),
                  child: Text(
                    'Account Login',
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
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                  child: Container(
                    // decoration: BoxDecoration(
                    //      border: Border(bottom: BorderSide(width: 2.0, color: HexColor("#000000"),)),
                    //     ),
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'create an account',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: HexColor("#667080"),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Form(
                  key: _login,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        //contentPadding: EdgeInsets.symmetric(vertical: 20),
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
                          "Password",
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
                              )),
                          obscureText: _isPasswordVisible,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ForgetPass()));
                        },
                        child: Container(
                          // decoration: BoxDecoration(
                          //      border: Border(bottom: BorderSide(width: 2.0, color: HexColor("#000000"),)),
                          //     ),
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(left: 120),
                          child: Text(
                            'Forgot Password',
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
                              _isLoading ? 'Logging in' : 'Login',
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
                              _isLoading ? null : login();
                            }
                            // () {
                            //   Navigator.push(context,
                            //       MaterialPageRoute(builder: (context) => SignUp()));
                            // },
                            ),
                      ),
                      SizedBox(height: 40),
                      Text(
                        'or login with',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 12, color: HexColor("#333336")),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 25,
                            width: 25,
                            child: Image.asset(
                              "assets/google.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          IconButton(
                              icon: FaIcon(
                                FontAwesomeIcons.facebook,
                                size: 25,
                                color: HexColor("#395185"),
                              ),
                              onPressed: null),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() async {
    setState(() {
      _isLoading = true;
    });
    var data = {
      'email': emailController.text,
      'password': passwordController.text
    };

    // var res = await CallApi().postData(data, 'login');
    // var body = json.decode(res.body);
    // if (body['success']) {
    //   SharedPreferences localStorage = await SharedPreferences.getInstance();
    //   localStorage.setString('token', body['token']);
    //   localStorage.setString('user', json.encode(body['user']));
    //   print('login is successful');
    // } else {
    //   _showMsg(body['message']);
    // }

    // setState(() {
    //   _isLoading = false;
    // });
    // print(body);
  }
}
