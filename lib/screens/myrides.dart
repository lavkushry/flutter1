import 'package:flutter/material.dart';

class myrides extends StatefulWidget {
  const myrides({super.key});
  @override
  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: () {  },
        ),
        title: Text("My Rides"),
        centerTitle: true,
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListView.builder(
              itemBuilder: ,
              itemCount: 8,)
          ],
        ),

      ),
    );
  }

}
