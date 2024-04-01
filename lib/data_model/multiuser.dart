import 'dart:convert';
import 'package:dio/dio.dart';

class MultiModel {
  late String page;
  late String per_page;
  late String total;
  late String total_pages;
  late List<Data> data;
  late Support support;

  MultiModel({
    required this.page,
    required this.per_page,
    required this.total,
    required this.total_pages,
    required this.data,
    required this.support,
  });

  factory MultiModel.fromJson(Map<String, dynamic> json) {
    return MultiModel(
      page: json['page'].toString(),
      per_page: json['per_page'].toString(),
      total: json['total'].toString(),
      total_pages: json['total_pages'].toString(),
      data: List<Data>.from(json['data'].map((x) => Data.fromJson(x))),
      support: Support.fromJson(json['support']),
    );
  }
}

class Data {
  late int id;
  late String email;
  late String first_name;
  late String last_name;
  late String avatar;

  Data({
    required this.id,
    required this.email,
    required this.first_name,
    required this.last_name,
    required this.avatar,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      email: json['email'],
      first_name: json['first_name'],
      last_name: json['last_name'],
      avatar: json['avatar'],
    );
  }
}

class Support {
  late String url;
  late String text;

  Support({
    required this.url,
    required this.text,
  });

  factory Support.fromJson(Map<String, dynamic> json) {
    return Support(
      url: json['url'],
      text: json['text'],
    );
  }
}

