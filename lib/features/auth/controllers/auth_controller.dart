import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:test_project/core/constants/app_constant.dart';

class AuthController extends GetxController {
  final Dio _dio = Dio();

  void signIn(String email, String password) async {
    final response = await _dio.post(
      '${AppConstant.apiUrl}auth/login',
      data: {'email': email, 'password': password},
    );
    print('Sign In Response: ${response.statusCode} - ${response.data}');
  }

  void signUp(String firstName, String lastName, String email, int phone, String location, String password) async {
    final response = await _dio.post(
      '${AppConstant.apiUrl}auth/register',
      data: {
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'contact_number': phone,
        'location': location,
        'password': password,
      },
    );
    print('Sign Up Response: ${response.statusCode} - ${response.data}');
  }

  void forgotPassword(String email) async {
    final response = await _dio.post(
      '${AppConstant.apiUrl}auth/forgot-password',
      data: {'email': email},
    );
    print('Forgot Password Response: ${response.statusCode} - ${response.data}');
  }
}