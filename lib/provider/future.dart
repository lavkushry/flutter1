import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data_model/multiuser.dart';
import '../data_model/user_model.dart';
import '../services/api-services.dart';

final userProvider=Provider<DioClient>((ref) => DioClient());


final userMulDataProvider=FutureProvider<MultiModel?>((ref) {
  final test=ref.watch(userProvider);
  return test.getmulModel();
} );


final userDataProvider=FutureProvider<Model?>((ref) {
  final test=ref.watch(userProvider);
  return test.getModel();
} );
