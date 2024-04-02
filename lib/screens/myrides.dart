import 'package:flutter/material.dart';

class MyRides extends StatefulWidget {
  const MyRides({Key? key}) : super(key: key);

  @override
  _MyRidesState createState() => _MyRidesState();
}

class _MyRidesState extends State<MyRides> {
  var arrNames = ["Lavkush", 'arun', 'Ajay', 'Vikash'];

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

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.white,
                )
              ],
            );
          },
          itemCount: arrNames.length,

          // separatorBuilder: (context, index) {
          //   return Divider(height: 10,);
          // },
        ),
      ),
    );
  }
}
