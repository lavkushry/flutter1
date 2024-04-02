import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realroadie1/screens/config.dart';
import 'package:realroadie1/screens/enter_otp_login.dart';
import 'package:realroadie1/screens/submit_otp_login.dart';
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
      theme: ThemeData(
        primaryColor: Colors.yellow,
        textTheme:textTheme,
        primaryTextTheme:textTheme ,
        primarySwatch:Colors.cyan,
        scaffoldBackgroundColor: Colors.black,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
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
                style:Theme.of(context).textTheme.headline5
              ),
              SizedBox(width:0,height: 25,),
              Text('What\'s Your Phone Number?',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(width:10,height: 10,),
              Text('Input fields with this (*) symbol are \n marked as Mandatory',
                  textAlign: TextAlign.center,
                  style:Theme.of(context).textTheme.caption
              ),
              SizedBox(width:10,height: 10,),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    labelText: 'Phone Number*',
                    hintText: 'What do people call you?',
                    border: OutlineInputBorder(),

                  hintStyle: TextStyle(fontSize: 15.0, color: Colors.white60),
                    labelStyle: Theme.of(context).textTheme.subtitle1
                    ),
                    style:Theme.of(context).textTheme.headline6,
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
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => OtpLogin()));
                  },
                  child: Text('GET OTP',
                  style: Theme.of(context).textTheme.subtitle1
                  ),
              )
            ],
          ),
        )
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

