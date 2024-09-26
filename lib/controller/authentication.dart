import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:forum_app/constants/constants.dart';

class AuthenticationController extends GetxController {
  final isLoading = false.obs;
  Future<String> register({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    dynamic response;
    try {
      isLoading.value = true;
      var data = {
        'name': name,
        'username': username,
        'email': email,
        'password': password,
      };
      response = await http.post(
        Uri.parse('${url}register'),
        headers: {'Accept': 'application/json'},
        body: data,
      );
      isLoading.value = false;
      return jsonDecode(response.body)['message'];
    } catch (e) {
      isLoading.value = false;
      return jsonDecode(response.body);
    }
  }

  Future<String> login({
    required String username,
    required String password,
  }) async {
    dynamic response;
    try {
      isLoading.value = true;
      var data = {
        'username': username,
        'password': password,
      };
      response = await http.post(
        Uri.parse('${url}login'),
        headers: {'Accept': 'application/json'},
        body: data,
      );
      isLoading.value = false;
      return jsonDecode(response.body)['message'];
    } catch (e) {
      isLoading.value = false;
      return jsonDecode(response.body);
    }
  }
}
