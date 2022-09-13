import 'package:beere/pages/user/changepass.dart';
import 'package:beere/pages/user/confirm.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({Key? key}) : super(key: key);

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  final _email = TextEditingController();
  @override
  void dispose() {
    _email.dispose();
    super.dispose();
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
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Center(
                  child: Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top:50),
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: HexColor("#C4C4C4"),
                      child: IconButton(
                       padding: EdgeInsets.only(left: 5),
                        icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 15,),
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
                  'Forget Password',
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
                  'Please enter your email to receive a link\nto create a new password via email',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: HexColor("#000000")),
                  ),
                ),
              ),
              SizedBox(height: 50,),
              Form(
                child: ListTile(
                  title: Text(
                    "Email/ Phone",
                    style: GoogleFonts.inter(
                      height: 2,
                      textStyle:
                          TextStyle(fontSize: 14, color: HexColor("#667080")),
                    ),
                  ),
                  subtitle: TextFormField(
                    controller: _email,
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
                      foregroundColor:
                          MaterialStateProperty.all<Color>(HexColor("#FFFFFF")),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(HexColor("#37A3C8")),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)))),
                  onPressed:
                  () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ChangePassword()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
