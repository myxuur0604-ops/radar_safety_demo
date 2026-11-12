import 'package:flutter/material.dart';
import 'login_screen.dart'; // Import để dùng lại CustomAuthField

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscurePassword = true;
  String _selectedLicense = 'B2';
  final List<String> _licenses = ['A1', 'B1', 'B2', 'C'];
  
  int _passwordStrength = 0; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121417),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Tạo hồ sơ lái xe', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
              const SizedBox(height: 8),
              const Text('Thiết lập tài khoản để quản lý phương tiện và đồng bộ lịch sử cảnh báo', style: TextStyle(color: Colors.grey, fontSize: 14)),
              const SizedBox(height: 32),
              
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF1C1F24),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: const Color(0xFF2A2E37)),
                ),
                child: Column(
                  children: [
                    const CustomAuthField(hintText: 'Họ và tên (VD: Hà Xuân Chiến)', icon: Icons.badge_outlined),
                    const SizedBox(height: 16),
                    const CustomAuthField(hintText: 'Email (VD: haxchien0810@gmail.com)', icon: Icons.email_outlined),
                    const SizedBox(height: 16),
                    const CustomAuthField(hintText: 'Số điện thoại', icon: Icons.phone_android_outlined),
                    const SizedBox(height: 16),
                    
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF121417),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFF2A2E37)),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          dropdownColor: const Color(0xFF1C1F24),
                          value: _selectedLicense,
                          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                          style: const TextStyle(color: Colors.white),
                          onChanged: (String? newValue) {
                            setState(() => _selectedLicense = newValue!);
                          },
                          items: _licenses.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text('Bằng lái hạng: $value'),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    TextField(
                      obscureText: _obscurePassword,
                      style: const TextStyle(color: Colors.white),
                      onChanged: (value) {
                        setState(() {
                          _passwordStrength = value.length > 8 ? 4 : (value.length > 5 ? 3 : (value.length > 2 ? 2 : (value.length > 0 ? 1 : 0)));
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Mật khẩu',
                        hintStyle: const TextStyle(color: Color(0xFF6B7280)),
                        prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFF6B7280), size: 20),
                        suffixIcon: IconButton(
                          icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility, color: const Color(0xFF6B7280), size: 20),
                          onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                        ),
                        filled: true,
                        fillColor: const Color(0xFF121417),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFF2A2E37))),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFF97316))),
                      ),
                    ),
                    const SizedBox(height: 12),
                    
                    // Thanh đo độ mạnh mật khẩu 4 vạch
                    Row(
                      children: List.generate(4, (index) => Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 4),
                          height: 4,
                          decoration: BoxDecoration(
                            color: _passwordStrength > index 
                                ? (_passwordStrength <= 2 ? const Color(0xFFEF4444) : (_passwordStrength == 3 ? const Color(0xFFF59E0B) : const Color(0xFF10B981)))
                                : const Color(0xFF2A2E37),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      )),
                    ),
                    
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF97316),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        ),
                        onPressed: () {},
                        child: const Text('ĐĂNG KÝ', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}