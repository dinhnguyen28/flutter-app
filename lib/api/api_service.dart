import 'package:ex_flutter_app_figma/model/login_model.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

var uri = Uri.parse(
    'http://api-gateway-fis-mbf-spro4-dev.apps.xplat.fis.com.vn/setting/login');

Future<LoginResponseModel> loginRequest(LoginRequestModel requestModel) async {
  final response = await http.post(uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'email': requestModel.email,
        'password': requestModel.password,
        'realm': 'ctsprotestmailgmailcom21092022',
      }));

  if (response.statusCode == 200) {
    return LoginResponseModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Faild to load data');
  }
}
