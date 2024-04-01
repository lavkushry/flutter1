import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class OtpLogin extends StatelessWidget {
  const OtpLogin({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Real Rodies Login Screen',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Verification Code'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController emailController=TextEditingController();
  // DioClient dio=DioClient();

  Dio dio1=Dio();

  Future sendEmail(String email) async {
    try{
      var resonse = await dio1.post('https://dev-api.realroadies.com/email/login/start?email=$email');

      if (resonse.statusCode == 200) {
        print("success");

      }
    }on DioError catch (e) {
      if (e.response?.statusCode == 200) {
        print("Nothing Happens");
      }
    }
  }

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
                    style:GoogleFonts.poppins(
                        color:Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600
                    ),
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
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Enter OTP*',
                      hintText: 'Enter OTP',
                      border: OutlineInputBorder(),
                      hintStyle: TextStyle(fontSize: 15.0, color: Colors.white),
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
                      // String email = emailController.text;
                      await sendEmail(emailController.text).then((value) { print('$value');});
                    },




                    child: Text('GET OTP',
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

