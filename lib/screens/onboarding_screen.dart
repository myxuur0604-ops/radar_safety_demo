import 'package:flutter/material.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Khai báo kiểu dữ liệu List> chuẩn xác
  final _onboardingData = [
    {
      "title": "Thấu thị Điểm mù 24GHz",
      "description": "Sóng Radar HLK-LD2450 quét góc 120° xuyên đêm tối, mưa mù để bảo vệ bạn.",
      "icon": "radar"
    },
    {
      "title": "Hợp nhất Radar & AI",
      "description": "Kết hợp khoảng cách mmWave và nhận diện hình ảnh từ Raspberry Pi 5 chính xác.",
      "icon": "camera"
    },
    {
      "title": "Hộp đen Tự động 24/7",
      "description": "Tự động chụp ảnh khoảnh khắc nguy hiểm và lưu trữ đám mây an toàn.",
      "icon": "cloud"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121417),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) => setState(() => _currentPage = index),
                itemCount: _onboardingData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF1C1F24),
                        borderRadius: BorderRadius.circular(32),
                        border: Border.all(color: const Color(0xFF2A2E37)),
                      ),
                      child: Center(
                        child: Icon(
                          _getIcon(_onboardingData[index]["icon"]!),
                          size: 100,
                          color: const Color(0xFFF97316),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  children: [
                    Text(
                      _onboardingData[_currentPage]["title"]!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _onboardingData[_currentPage]["description"]!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 14, color: Colors.grey, height: 1.5),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _onboardingData.length,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          height: 8,
                          width: _currentPage == index ? 24 : 8,
                          decoration: BoxDecoration(
                            color: _currentPage == index ? const Color(0xFFF97316) : const Color(0xFF2A2E37),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF97316),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        ),
                        onPressed: () {
                          if (_currentPage == _onboardingData.length - 1) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const LoginScreen()),
                            );
                          } else {
                            _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                          }
                        },
                        child: Text(
                          _currentPage == _onboardingData.length - 1 ? 'Bắt đầu ngay' : 'Tiếp tục',
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIcon(String name) {
    switch (name) {
      case 'radar': return Icons.radar;
      case 'camera': return Icons.camera_alt_outlined;
      case 'cloud': return Icons.cloud_done_outlined;
      default: return Icons.info;
    }
  }
}