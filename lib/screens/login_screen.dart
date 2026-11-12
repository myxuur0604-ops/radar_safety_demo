import 'package:flutter/material.dart';
import 'register_screen.dart';
import '../main.dart'; // Nối sang MainNavigationScreen

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121417),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Icon(Icons.shield_moon_rounded, size: 48, color: Color(0xFFF97316)),
              const SizedBox(height: 24),
              const Text('Chào mừng trở lại,', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
              const SizedBox(height: 8),
              const Text('Đăng nhập để đồng bộ hệ thống Radar Safety', style: TextStyle(color: Colors.grey, fontSize: 14)),
              const SizedBox(height: 40),
              
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF1C1F24),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: const Color(0xFF2A2E37)),
                ),
                child: Column(
                  children: [
                    CustomAuthField(
                      hintText: 'Email hoặc Số điện thoại',
                      icon: Icons.person_outline,
                    ),
                    const SizedBox(height: 16),
                    CustomAuthField(
                      hintText: 'Mật khẩu',
                      icon: Icons.lock_outline,
                      isPassword: true,
                      obscureText: _obscurePassword,
                      onTogglePassword: () => setState(() => _obscurePassword = !_obscurePassword),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 24,
                              height: 24,
                              child: Checkbox(
                                value: _rememberMe,
                                activeColor: const Color(0xFFF97316),
                                side: const BorderSide(color: Colors.grey),
                                onChanged: (val) => setState(() => _rememberMe = val!),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text('Ghi nhớ', style: TextStyle(color: Colors.grey, fontSize: 13)),
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Quên mật khẩu?', style: TextStyle(color: Color(0xFFF97316), fontSize: 13)),
                        )
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 52,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFF97316),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => const MainNavigationScreen()),
                                );
                              },
                              child: const Text('ĐĂNG NHẬP', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1)),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          height: 52,
                          width: 52,
                          decoration: BoxDecoration(
                            color: const Color(0xFF2A2E37),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.fingerprint, color: Colors.white),
                            onPressed: () {},
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 32),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Tài xế mới? ', style: TextStyle(color: Colors.grey)),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RegisterScreen()),
                      );
                    },
                    child: const Text('Tạo tài khoản', style: TextStyle(color: Color(0xFFF97316), fontWeight: FontWeight.bold)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Widget CustomAuthField được dùng chung cho cả Login và Register
class CustomAuthField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool isPassword;
  final bool obscureText;
  final VoidCallback? onTogglePassword;

  const CustomAuthField({
    Key? key,
    required this.hintText,
    required this.icon,
    this.isPassword = false,
    this.obscureText = false,
    this.onTogglePassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xFF6B7280)),
        prefixIcon: Icon(icon, color: const Color(0xFF6B7280), size: 20),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility, color: const Color(0xFF6B7280), size: 20),
                onPressed: onTogglePassword,
              )
            : null,
        filled: true,
        fillColor: const Color(0xFF121417),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF2A2E37)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFF97316)),
        ),
      ),
    );
  }
}