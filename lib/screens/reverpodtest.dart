import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realroadie1/provider/future.dart';
import 'package:realroadie1/services/api-services.dart';

import '../data_model/pst_create.dart';


class RiverpodHome extends ConsumerWidget {
  const RiverpodHome({super.key});

  @override
  Widget build(BuildContext context,ref) {
    DioClient dio=DioClient();
    TextEditingController name=TextEditingController();
    TextEditingController job=TextEditingController();


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: Container(
          child: Column(
            children: [
              TextFormField(
                controller: name,
                decoration: InputDecoration(
                  labelText: 'Name*',
                  border: OutlineInputBorder(),

                  hintStyle: TextStyle(fontSize: 15.0, color: Colors.white60),
                  labelStyle: GoogleFonts.poppins(
                      color:Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                style: TextStyle(color: Colors.black),

                keyboardType: TextInputType.phone,

              ),
              TextFormField(
                controller: job,
                decoration: InputDecoration(
                  labelText: 'Job*',
                  hintText: 'What do people call you?',
                  border: OutlineInputBorder(),

                  hintStyle: TextStyle(fontSize: 15.0, color: Colors.white60),
                  labelStyle: GoogleFonts.poppins(
                      color:Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                style: TextStyle(color: Colors.black),

                keyboardType: TextInputType.phone,

              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellowAccent,// Add color to the button
                    minimumSize: Size(343, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                ),

                onPressed: () async {
                  await dio.getPostcreate(name: name.text, job: job.text);
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen(email: emailController.text,)));
                },
                child: Text('GET Object',
                  style: GoogleFonts.poppins(
                    color:Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),),
              )
            ],
          ),
      )
    );
  }
}
