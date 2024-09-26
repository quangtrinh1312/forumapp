import 'dart:convert';

import 'package:forum_app/constants/constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
class PostController extends GetxController{
  final post = [].obs;
  final isLoading = false.obs;
  final box = GetStorage();
  @override
  void onInit(){
    getAllPost();
    super.onInit();
  }
  Future<String> getAllPost() async {
    dynamic response;
    try{
      isLoading.value = true;
      response = await http.get(
        Uri.parse('${url}feeds'),
        headers: {
          'Accept':'application/json',
          'Authorization':'Bearer ${box.read('token')}'
        }
      );
    }catch(e){
      print(e.toString());
    }
    isLoading.value = false;
    print(jsonDecode(response.body));
    return jsonDecode(response.body)['message'];
  }
}