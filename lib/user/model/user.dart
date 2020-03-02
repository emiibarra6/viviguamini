import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

Future<user> fetchPost() async {
  final response = await http.get(
    'https://jsonplaceholder.typicode.com/posts/1',
    headers: {HttpHeaders.authorizationHeader: "Basic your_api_token_here"},
  );
  final responseJson = json.decode(response.body);

  return user.fromJson(responseJson);
}

class user {
  final int userId;
  final int id;
  final String title;
  final String body;

  user({this.userId, this.id, this.title, this.body});

  factory user.fromJson(Map<String, dynamic> json) {
    return user(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}