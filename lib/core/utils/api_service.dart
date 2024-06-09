import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = 'https://api.github.com/users/square/repos';
  final Dio _dio;
  ApiService(this._dio);
  Future<List<dynamic>> getRepos() async {
    var response = await _dio.get(_baseUrl);
    return response.data;
  }
}
