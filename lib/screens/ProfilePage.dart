// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;


import 'multi_model_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}



class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back,color: Colors.white,),
        ),
        centerTitle: true,
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/Images/Ph1.jpeg'),
                    ),
                    Column(
                      children: [
                        Text('10',
                          style: Theme.of(context).textTheme.headline6
                        ),
                        Text('Rides',
                          style: Theme.of(context).textTheme.subtitle1
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text('10k',
                          style: Theme.of(context).textTheme.headline6
                        ),
                        Text('Distances(km)',
                          style: Theme.of(context).textTheme.subtitle1
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    Column(
                      children: [
                        Text('Aaradhya',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text('Aaradhya',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => MMpage()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          minimumSize: const Size(343, 44),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Become a Member',
                          style: Theme.of(context).textTheme.headline6
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  child: Column(
                    children: [
                      Text("My Bikes",
                        style: Theme.of(context).textTheme.headline5!.copyWith(fontWeight:FontWeight.bold)
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 140,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                    itemBuilder: (context, count) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          width: 222,
                          height: 130,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Stack(
                            children: [
                              // Image.asset('assets/images/image.jpg', fit: BoxFit.cover),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          TabBar(
            controller: _tabController,
            indicatorColor: Colors.amberAccent,
            indicatorWeight: 3,
            tabs: const [
              Tab(text: "Post",
              ),
              Tab(text: "Club"),
              Tab(text: "Discount"),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Content for the "Post" tab
                // You can add your existing code here
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 110.0,
                          height: 110.0,
                          child: Card(
                            child: Image.asset('assets/Images/image.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 110.0,
                          height: 110.0,
                          child: Card(
                            child: Image.asset('assets/Images/image.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 110.0,
                          height: 110.0,
                          child: Card(
                            child: Image.asset('assets/Images/image.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // Content for the "Club" tab
                // Add your cards for the Club tab here
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 110.0,
                          height: 110.0,
                          child: Card(
                            color: Colors.green,
                            child: Image.asset('assets/Images/image.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 110.0,
                          height: 110.0,
                          child: Card(
                            color: Colors.green,
                            child: Image.asset('assets/Images/image.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 110.0,
                          height: 110.0,
                          child: Card(
                            color: Colors.green,
                            child: Image.asset('assets/Images/image.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // Content for the "Discount" tab
                // You can add your existing code here
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 110.0,
                          height: 110.0,
                          child: Card(
                            color: Colors.green,
                            child: Image.asset('assets/Images/image.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 110.0,
                          height: 110.0,
                          child: Card(
                            color: Colors.green,
                            child: Image.asset('assets/Images/image.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 110.0,
                          height: 110.0,
                          child: Card(
                            color: Colors.green,
                            child: Image.asset('assets/Images/image.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
