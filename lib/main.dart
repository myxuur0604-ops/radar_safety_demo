import 'package:flutter/material.dart';
import 'screens/onboarding_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/cockpit_screen.dart';
import 'screens/blackbox_screen.dart';
import 'screens/pi5_screen.dart';
import 'screens/account_screen.dart';

void main() {
  runApp(const RadarSafetyApp());
}

class RadarSafetyApp extends StatelessWidget {
  const RadarSafetyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Radar Safety Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121417),
        cardColor: const Color(0xFF1C1F24),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF121417),
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFF97316),
          secondary: Color(0xFF10B981),
          error: Color(0xFFEF4444),
        ),
        useMaterial3: true,
      ),
      home: const OnboardingScreen(), 
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({Key? key}) : super(key: key);

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const CockpitScreen(),
    const BlackboxScreen(),
    const Pi5Screen(),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Color(0xFF2A2E37), width: 1)),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xFF121417),
          selectedItemColor: const Color(0xFFF97316),
          unselectedItemColor: const Color(0xFF6B7280),
          selectedFontSize: 12,
          unselectedFontSize: 12,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(icon: Padding(padding: EdgeInsets.only(bottom: 4), child: Icon(Icons.dashboard_rounded)), label: 'Buồng lái'),
            BottomNavigationBarItem(icon: Padding(padding: EdgeInsets.only(bottom: 4), child: Icon(Icons.history_rounded)), label: 'Hộp đen'),
            BottomNavigationBarItem(icon: Padding(padding: EdgeInsets.only(bottom: 4), child: Icon(Icons.memory_rounded)), label: 'Mạch Pi 5'),
            BottomNavigationBarItem(icon: Padding(padding: EdgeInsets.only(bottom: 4), child: Icon(Icons.person_rounded)), label: 'Tài khoản'),
          ],
        ),
      ),
    );
  }
}