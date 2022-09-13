import 'package:beere/pages/user/confirm.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _pass1 = TextEditingController();
  final _pass2 = TextEditingController();

  @override
  void dispose() {
    _pass1.dispose();
    _pass2.dispose();
    super.dispose();
  }

  late String _password;
  double _strength = 0;
  String _displayText = 'Please enter a password';
  RegExp numReg = RegExp(r".*[0-9].*");
  RegExp letterReg = RegExp(r".*[A-Za-z].*");

  void _checkPassword(String value) {
    _password = value.trim();

    if (_password.isEmpty) {
      setState(() {
        _strength = 0;
        _displayText = "Please enter your password";
      });
    } else if (_password.length < 6) {
      setState(() {
        _strength = 1 / 4;
        _displayText = "Your password is too short";
      });
    } else if (_password.length < 8) {
      setState(() {
        _strength = 2 / 4;
        _displayText = "Your password is acceptable but not strong";
      });
    } else {
      if (!letterReg.hasMatch(_password) || !numReg.hasMatch(_password)) {
        setState(() {
          _strength = 3 / 4;
          _displayText = "Your password is strong";
        });
      }
    }
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
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 20),
                  margin: EdgeInsets.only(
                    top: 150,
                  ),
                  child: Text(
                    'Change Password',
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
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Input your new desired password in the \nfields below to create a new password',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: HexColor("#000000")),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Form(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          "New Password",
                          style: GoogleFonts.inter(
                            height: 2,
                            textStyle: TextStyle(
                                fontSize: 14, color: HexColor("#667080")),
                          ),
                        ),
                        subtitle: TextFormField(
                          controller: _pass1,
                          onChanged: (value) {
                            _checkPassword(value);
                          },
                          obscureText: true,
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
                        width: 300,
                        child: LinearProgressIndicator(
                          value: _strength,
                          backgroundColor: Colors.grey[300],
                          color: _strength <= 1 / 4
                              ? Colors.red
                              : _strength == 2 / 4
                                  ? Colors.yellow
                                  : _strength == 3 / 4
                                      ? Colors.blue
                                      : Colors.green,
                          //minHeight: 15,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        _displayText,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: HexColor("#667080")),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ListTile(
                        title: Text(
                          "Confirm New Password",
                          style: GoogleFonts.inter(
                            height: 2,
                            textStyle: TextStyle(
                                fontSize: 14, color: HexColor("#667080")),
                          ),
                        ),
                        subtitle: TextFormField(
                          controller: _pass2,
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
                    ],
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
                      'SEND',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(fontSize: 20),
                      ),
                    ),
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                            HexColor("#FFFFFF")),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            HexColor("#37A3C8")),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)))),
                    onPressed:
                    // _strength < 1 / 4 ? null : () {},
                    () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ConfirmReg()));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
