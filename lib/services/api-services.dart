import 'dart:convert';
import 'package:realroadie1/data_model/multiuser.dart';
import 'package:realroadie1/data_model/pst_create.dart';
import '../data_model/user_model.dart';
import 'package:dio/dio.dart';

class DioClient {
  final Dio dio = Dio(
    // BaseOptions(
    //   baseUrl: "https://dev-api.realroadies.com"
    // )
  );

  Future<Model?> getModel() async {
    Model? user;
    Response? userData;
    try {
      userData = await dio.get("https://reqres.in/api/users/2");
      // print('$userData');
      user = Model.fromJson(userData.data);
    } on DioError catch (e) {
      if (e.response?.statusCode == 200) {
        print(e.response?.statusCode);
      }
    }
    return user;
  }



  Future<MultiModel> getmulModel() async {
    try {
      Response response = await dio.get("https://reqres.in/api/users?page=2");
      if (response.statusCode == 200) {
        return MultiModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data');
    }
  }

  Future sendEmail(String email) async {

    try{
      var resonse = await dio.post("https://dev-api.realroadies.com/email/login/start?email=$email");

      if (resonse.statusCode == 200) {
        print("success");


      }
    }on DioError catch (e) {
      if (e.response?.statusCode == 200) {
        print("Nothing Happens");
      }
  }
 }

  Future getOtp({required String email, required String otp} )async {
    try{
      var resonse = await dio.post("https://dev-api.realroadies.com/mobile/get/access-token?mobile_phone=$email&otp=$otp");
      if (resonse.statusCode == 200) {
        print(resonse.data);
        print("success");

      }
    }on DioError catch (e) {
      if (e.response?.statusCode == 200) {
        print("Nothing Happens");
      }
    }
  }


  Future getPostcreate({required String name, required String job} ) async {
    //PostCreate? recieveUser;
    try {
      Response response = await dio.post("https://reqres.in/api/users");
      // print('$userData');
      if (response.statusCode == 201) {
       // PostCreate.toJson(jsonDecode(response.data));
        print(response.data);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 200) {
        print(e.response?.statusCode);
      }
    }

  }
}
