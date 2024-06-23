import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/Data/Responce/App_Exceptions.dart';
import 'package:getx_mvvm/Data/Network/Base_api_services.dart';

import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiAervices {
  @override
  Future<dynamic> getApi(String Url) async {
// This condition   if(kDebugMode) checks that if the app is in debug mode then it will execute
// thebody otherwise not
    if (kDebugMode) {
      print(Url);
    }

// a variable that isuse for storing the responce
    dynamic responsejson;

    try {
      final response =
          await http.get(Uri.parse(Url)).timeout(Duration(seconds: 20));

      responsejson = Returnresponse(response);
    }

    //Socket execption means that internet is unavailable
    on SocketException {
      throw InternetExceptions("No internet available");
    } on TimeoutException {
      throw RequestTimeoutExceptions("Timed out");
    }

    return responsejson;
  }

  dynamic Returnresponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        //the response will be decoded and then assigned to the variable
        dynamic responsejson = jsonDecode(response.body);
        return responsejson;
      case 400:
        //the response will be decoded and then assigned to the variable
        throw RequestTimeoutExceptions("Timed out");
      default:
        throw InternetExceptions();
    }
  }

  @override
  Future PostApi(var data, String Url) async {
    //  This condition   if(kDebugMode) checks that if the app is in debug mode then it will execute
// thebody otherwise not
    if (kDebugMode) {
      print(Url);
    }

// a variable that isuse for storing the responce
    dynamic responsejson;

    try {
      final response = await http
          .post(Uri.parse(Url), body: jsonEncode(data))
          .timeout(Duration(seconds: 20));

      responsejson = Returnresponse(response);
    }

    //Socket execption means that internet is unavailable
    on SocketException {
      throw InternetExceptions("No internet available");
    } on TimeoutException {
      throw RequestTimeoutExceptions("Timed out");
    }

    return responsejson;
  }
}
