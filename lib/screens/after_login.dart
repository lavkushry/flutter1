import 'package:flutter/material.dart';



class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading:
          IconButton(
              onPressed: ()=>(),
              icon: Icon(Icons.location_searching
              ,color: Colors.black,)),
          title: Align(
            child: Text('Koramangala india',
              style: TextStyle(color: Colors.black),
                        ),
            alignment: Alignment.topLeft,),
        actions: <Widget>[
          IconButton(onPressed: () => (),
              icon: Icon(Icons.account_circle_outlined,
              color: Colors.black,))
        ],
      ),
      body:
      Container(
        child: Row(
          children: [
            // CircleAvatar(
            //   radius: 60,
            //   backgroundImage: NetworkImage(
            //     'https://picsum.photos/seed/904/600',
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

