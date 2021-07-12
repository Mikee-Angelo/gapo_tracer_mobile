import 'dart:convert';
import 'dart:io';

import 'package:app/model/LoginModel.dart';
import 'package:app/model/ProfileModel.dart';
import 'package:app/model/RegisterModel.dart';
import 'package:app/model/StatusModel.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  var _profileBox = Hive.box('profile');
  String url = GlobalConfiguration().get('url');

  Future<LoginModel> login({
    required String phone,
    required String password,
    required String token,
  }) async {
    return await http.post(Uri.parse(url + 'login'), body: {
      'token': token,
      'phone': phone,
      'password': password,
    }).then(
      (res) {
        return LoginModel.fromJson(json.decode(res.body));
      },
    ).catchError((e) => throw ('Error: $e'));
  }

  Future<RegisterModel> register({
    required String firstName,
    required String lastName,
    required String address,
    required String phone,
    required String password,
    required String age,
    required String gender,
    required String token,
  }) async {
    return await http.post(
      Uri.parse(url + 'register'),
      headers: {HttpHeaders.acceptHeader: 'application/json'},
      body: {
        'first_name': firstName,
        'last_name': lastName,
        'address': address,
        'gender': gender,
        'age': age,
        'phone': phone,
        'password': password,
        'token': token,
      },
    ).then(
      (res) {
        print(res.body);
        return RegisterModel.fromJson(json.decode(res.body));
      },
    ).catchError((e) => throw ('Exception: $e'));
  }

  Future<ProfileModel> me() async {
    String token = _profileBox.get('access_token');
    return await http.post(
      Uri.parse(url + 'auth/me'),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    ).then((res) {
      return ProfileModel.fromJson(json.decode(res.body));
    }).catchError((e) => throw ('Exception: $e'));
  }

  Future<StatusModel> status() async {
    String token = _profileBox.get('access_token');
    return await http.get(
      Uri.parse(url + 'status'),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    ).then((res) {
      print(res.body);
      return StatusModel.fromJson(json.decode(res.body));
    }).catchError((e) => throw ('Exception: $e'));
  }
}
