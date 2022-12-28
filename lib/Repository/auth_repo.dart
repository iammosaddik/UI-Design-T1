

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/Repository/server_config.dart';

import '../Model/sign_in_model.dart';

class AuthRepo{
  Future<bool> signInWithEmail(String email, String password)async{
    final prefes= await SharedPreferences.getInstance();
    String signInUrl = Config.serverUrl + Config.signInUrl;
    var respons= await http.post(Uri.parse(signInUrl),body: <String, String>{
      'email': email,
      'password': password,
    });
    var data=jsonDecode(respons.body);
    if(respons.statusCode==200){
      var decodedData=SignInModel.fromJson(data);
      await prefes.setString('token', decodedData.data!.token.toString());
      print(prefes.getString('token'));
      return true;
    }else{
      return false;
    }
  }


  Future<bool> signUpWithEmail(String name, String email, String phone, String password)async{
  String signUp= Config.serverUrl+Config.signUpUrl;
  final prefes= await SharedPreferences.getInstance();
  var respons= await http.post(Uri.parse(signUp),body: <String, String>{
  'name': name,
  'email': email,
  'phone': phone,
  'password': password,
  });
  var data=jsonDecode(respons.body);
  if(respons.statusCode==200){
  var decodedData= SignInModel.fromJson(data);
  await prefes.setString('token', decodedData.data!.token.toString());
  print(prefes.getString('token'));
  return true;
  }else{
  throw Exception('User Have Exits');
  }
  }


}

