import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realroadie1/screens/ProfilePage.dart';
import 'package:realroadie1/services/api-services.dart';

import '../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.email});

  final String email;


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  DioClient dioClient =DioClient();
  final otpTextFieldController = TextEditingController();
  final emailTextFieldController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.,
                children: [
                  SizedBox(width:0,height: 70,),
                  Text('Verification Code',
                    style:Theme.of(context).textTheme.subtitle1
                  ),
                  SizedBox(width:0,height: 25,),
                  RichText(text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Code verification sent to",
                        style: GoogleFonts.poppins(
                            color:Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      TextSpan(
                        text: "+919122036484",
                        style: GoogleFonts.poppins(
                            color:Colors.yellowAccent,
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                  ),
                  SizedBox(width:10,height: 10,),
                  Text('Input fields with this (*) symbol are \n marked as Mandatory',
                    textAlign: TextAlign.center,
                    style:GoogleFonts.poppins(
                        color:Colors.white60,
                        fontSize: 12,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                  SizedBox(width:10,height: 10,),
                  TextFormField(
                    controller: otpTextFieldController,
                    decoration: InputDecoration(
                      labelText: 'Enter OTP',
                      hintText: 'Enter OTP',
                      border: OutlineInputBorder(),

                      hintStyle: TextStyle(fontSize: 15.0, color: Colors.white),
                      // labelStyle: GoogleFonts.poppins(
                      //     color:Colors.yellow,
                      //     fontSize: 20,
                      //     fontWeight: FontWeight.w400),
                    ),
                    style: TextStyle(color: Colors.white),

                    keyboardType: TextInputType.phone,

                  ),
                  SizedBox(width:10,height: 10,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellowAccent,// Add color to the button
                        minimumSize: Size(343, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                    ),

                    onPressed: () async {
                      await dioClient.getOtp(email:widget.email ,otp: otpTextFieldController.text);
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfilePage()));
                    },
                    child: Text('Log in',
                      style: GoogleFonts.poppins(
                        color:Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),),
                  ),
                  RichText(text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Didn't receive the verification OTP?",
                        style: GoogleFonts.poppins(
                            color:Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      TextSpan(
                        text: " Resend again",
                        style: GoogleFonts.poppins(
                            color:Colors.yellowAccent,
                            fontSize: 12,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                  ),
                ],
              ),
            ),
          )
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

