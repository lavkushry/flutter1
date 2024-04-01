import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realroadie1/services/api-services.dart';
import '../data_model/multiuser.dart';
import '../provider/future.dart';

class MMpage extends ConsumerWidget {
  const MMpage({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DioClient _dioClient = DioClient();
    final userData = ref.watch(userMulDataProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: userData.when(
        data: (multiModel) {
          return ListView.builder(
            itemCount: multiModel?.data.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              final user = multiModel?.data[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user?.avatar ?? ''),
                ),
                title: Text('${user?.first_name} ${user?.last_name}'),
                subtitle: Text(user?.email ?? ''),
              );
            },
          );
        },
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }
}
