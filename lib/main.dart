import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realroadie1/screens/multi_model_page.dart';
import 'package:realroadie1/screens/reverpodtest.dart';
import 'package:realroadie1/services/api-services.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Real Rodies Login Screen',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        useMaterial3: true,
      ),
      home: const MMpage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => MyHomePageState();
}
class MyHomePageState extends State<MyHomePage> {
  DioClient dio= DioClient();
  TextEditingController emailController=TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.,
            children: [
              SizedBox(width:0,height: 70,),
              Text('Get Started',
                style:GoogleFonts.poppins(
                    color:Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(width:0,height: 25,),
              Text('What\'s Your Phone Number?',
              style: GoogleFonts.poppins(
                  color:Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500
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
                    labelText: 'Phone Number*',
                    hintText: 'What do people call you?',
                    border: OutlineInputBorder(),

                  hintStyle: TextStyle(fontSize: 15.0, color: Colors.white60),
                    labelStyle: GoogleFonts.poppins(
                      color:Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
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
                    // await dio.sendEmail(emailController.text);
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => RiverpodHome()));
                  },
                  child: Text('GET OTP',
                  style: GoogleFonts.poppins(
                      color:Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                  ),),
              )
            ],
          ),
        )
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

