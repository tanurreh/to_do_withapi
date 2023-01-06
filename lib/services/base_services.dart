import 'dart:convert';

import 'package:http/http.dart' as http;

class BaseClient {
  String baseUrl = 'https://63ac0b12cf281dba8c3158bb.mockapi.io/testuser/api/';
  var client = http.Client(); //setting up client

  //GET
  Future<dynamic> get(String api) async {
    var url = Uri.parse(baseUrl + api);
    var response = await client.get(url);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      // throw exception
    }
  }
  ///Post
  Future<dynamic> post(String api, dynamic object) async {
    var url = Uri.parse(baseUrl + api);
    var _payload = json.encode(object);
              var _headers = {
      'Authorization': 'Bearer sfie328370428387=',
      'Content-Type': 'application/json',
      'api_key': 'ief873fj38uf38uf83u839898989',
    };

    var response = await client.post(url, body: _payload, headers: _headers);
    if (response.statusCode == 201) {
      return response.body;
    } else {
      // throw exception
    }
  }
  ///Put
  Future<dynamic> put(String api, dynamic object) async {
    var url = Uri.parse(baseUrl + api);
    var _payload = json.encode(object);
              var _headers = {
      'Authorization': 'Bearer sfie328370428387=',
      'Content-Type': 'application/json',
      'api_key': 'ief873fj38uf38uf83u839898989',
    };

    var response = await client.put(url, body: _payload, headers: _headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      // throw exception
    }
  }

  ///Delete
  Future<dynamic> delete(String api) async {
    var url = Uri.parse(baseUrl + api);
              var _headers = {
      'Authorization': 'Bearer sfie328370428387=',
      'api_key': 'ief873fj38uf38uf83u839898989',
    };

    var response = await client.delete(url,headers: _headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      // throw exception
    }
  }
}
