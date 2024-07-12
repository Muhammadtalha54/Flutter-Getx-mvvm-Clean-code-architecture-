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
          //this is get api function
          await http.get(Uri.parse(Url)).timeout(Duration(seconds: 20));

      responsejson = Returnresponse(response);
    }

    //Socket execption means that internet is unavailable
    on SocketException {
      //these exceptions are defined already in a seperate file
      throw InternetExceptions("No internet available");
    } on TimeoutException {
       RequestTimeout("Timed out");
    }

    return responsejson;
  }

  dynamic Returnresponse(http.Response response) {
    print(response.body.toString());
    switch (response.statusCode) {
      case 200:
        //the response will be decoded and then assigned to the variable
        dynamic responsejson = jsonDecode(response.body);
        return responsejson;
      case 400:
        //the response will be decoded and then assigned to the variable
        dynamic responsejson = jsonDecode(response.body);
        return responsejson;
      default:
        throw FetchdataExceptions('Error occued while fetching data' +
            response.statusCode.toString());
    }
  }

  @override
  //this is post api function
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
          .post(Uri.parse(Url), body: data)
          .timeout(Duration(seconds: 20));

      responsejson = Returnresponse(response);
    }

    //Socket execption means that internet is unavailable
    on SocketException {
      throw InternetExceptions('');
    } on RequestTimeout {
      throw RequestTimeout('');
    }
    if (kDebugMode) {
      print(responsejson);
    }
    return responsejson;
  }
}











// In app development, APIs (Application Programming Interfaces) often provide several methods (also called HTTP methods or HTTP verbs) that allow clients to interact with a server. The most commonly used methods are:

// 1. GET
// Purpose: Retrieve data from the server.
// Example Use Case: Fetching a list of users or retrieving the details of a specific item.
// Idempotent: Yes (Multiple identical requests should have the same effect as a single request).
// Safe: Yes (No side effects on the server).
// 2. POST
// Purpose: Send data to the server to create a new resource.
// Example Use Case: Creating a new user or submitting a form.
// Idempotent: No (Multiple identical requests will create multiple resources).
// Safe: No (Data on the server is modified).
// 3. PUT
// Purpose: Send data to the server to update an existing resource or create it if it does not exist.
// Example Use Case: Updating user information or creating a user if the user does not exist.
// Idempotent: Yes (Multiple identical requests should have the same effect as a single request).
// Safe: No (Data on the server is modified).
// 4. PATCH
// Purpose: Apply partial modifications to a resource.
// Example Use Case: Updating a user's email address without affecting other data.
// Idempotent: Yes (Multiple identical requests should have the same effect as a single request).
// Safe: No (Data on the server is modified).
// 5. DELETE
// Purpose: Remove a resource from the server.
// Example Use Case: Deleting a user account.
// Idempotent: Yes (Multiple identical requests should have the same effect as a single request).
// Safe: No (Data on the server is modified).
// 6. OPTIONS
// Purpose: Describe the communication options for the target resource.
// Example Use Case: Used by browsers for CORS (Cross-Origin Resource Sharing) preflight requests.
// Idempotent: Yes.
// Safe: Yes.
// 7. HEAD
// Purpose: Similar to GET but without the response body. Used to fetch the headers.
// Example Use Case: Checking if a resource exists or fetching metadata information (like content type and length).
// Idempotent: Yes.
// Safe: Yes