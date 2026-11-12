import 'dart:async';

class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  bool isLoggedIn = false;

  Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 1500));
    
    if (email.isNotEmpty && password.length >= 6) {
      isLoggedIn = true;
      return true;
    }
    return false;
  }

  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 500));
    isLoggedIn = false;
  }
}