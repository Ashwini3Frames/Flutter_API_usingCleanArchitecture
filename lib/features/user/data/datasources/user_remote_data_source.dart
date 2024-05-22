// lib/features/user/data/datasources/user_remote_data_source.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_api/features/user/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> getUser(int id);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;

  UserRemoteDataSourceImpl({required this.client});

  @override
  Future<UserModel> getUser(int id) async {
    final response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/users/$id'));

    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }
}
