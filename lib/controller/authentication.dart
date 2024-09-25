import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:forum_app/constants/constants.dart';

class AuthenticationController extends GetxController {
  final isLoading = false.obs;
  Future<Map<String, dynamic>> register({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      var data = {
        'name': name,
        'username': username,
        'email': email,
        'password': password,
      };
      print('${url}api/register');
      var response = await http.post(
        Uri.parse('${url}api/register'),
        headers: {'Accept': 'application/json'},
        body: data,
      );
      if (response.statusCode == 201) {
        print(jsonDecode(response.body));
        return jsonDecode(response.body);
      } else {
        print(jsonDecode(response.body));
        return jsonDecode(response.body);
      }
    } catch (e) {
      debugPrint(e.toString());
      return {'Error:': e.toString()};
    } finally {
      isLoading.value = false;
    }
  }
}
