
import 'package:flutter/material.dart';
import 'package:realroadie1/data_model/user_model.dart';

import '../services/api-services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  final DioClient _client = DioClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        title: const Text("User Details:"),
      ),
      body: Center(
        child: FutureBuilder<Model?>(
          future: _client.getModel(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              Model? modelinfo=snapshot.data;

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(modelinfo!.data.avatar),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      '${modelinfo.data.firstName} ${modelinfo.data.lastName}',
                      style: const TextStyle(fontSize: 16,color: Colors.white),
                    ),
                    Text(
                      modelinfo.data.email,
                      style: const TextStyle(fontSize: 16, color:Colors.white),
                    ),
                      Text(
                        modelinfo.support.url,
                        style: const TextStyle(fontSize: 16, color:Colors.white),
                      ),
                      Text(
                        modelinfo.support.text,
                        style: const TextStyle(fontSize: 16, color:Colors.white),
                      ),
                    ],
                  );
            }
            return const CircularProgressIndicator(); // Add a loading indicator when data is not available
          },
        ),
      ),
    );
  }

}
