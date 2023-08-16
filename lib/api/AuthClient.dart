import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:quick_recipe/model/User.dart';
import 'package:quick_recipe/util/Constants.dart';
import '../model/SignUpResponse.dart';
import 'package:http/http.dart' as http;

class AuthClient {

  SignUpResponse parseSignUpResponse(String response) {
    return SignUpResponse.fromJson(jsonDecode(response));
  }

  Future<SignUpResponse> signUpUser(User user) async {
    final response = await http.get(Uri.parse(Constants.recipeEndpoint + Constants.signUpEndpoint));

    if (kDebugMode) {
      print(response.toString());
    }

    if (response.statusCode != 200) {
      throw Error();
    }

    return parseSignUpResponse(response.body);
  }
}