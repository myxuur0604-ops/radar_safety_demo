import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hồ sơ Người lái'), centerTitle: false),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF1C1F24),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: const Color(0xFF2A2E37)),
            ),
            child: Row(
              children: [
                CircleAvatar(radius: 35, backgroundColor: Colors.grey[800], child: const Icon(Icons.person, size: 35, color: Colors.white)),
                const SizedBox(width: 20),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hà Xuân Chiến', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text('haxchien0810@gmail.com\nBằng lái Hạng B2', style: TextStyle(color: Colors.grey, fontSize: 13, height: 1.4)),
                    ],
                  ),
                ),
                IconButton(onPressed: (){}, icon: const Icon(Icons.edit_outlined, color: Colors.grey))
              ],
            ),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: const Color(0xFF10B981).withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFF10B981).withOpacity(0.3)),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Điểm Lái Xe An Toàn', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF10B981))),
                Text('94/100', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF10B981))),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _buildActionTile('Quản lý Gara xe (My Garage)', Icons.directions_car_outlined),
          _buildActionTile('Thiết bị đang đăng nhập', Icons.devices_outlined),
          _buildActionTile('Đăng xuất', Icons.logout_rounded, isDestructive: true),
        ],
      ),
    );
  }

  Widget _buildActionTile(String title, IconData icon, {bool isDestructive = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: const BorderSide(color: Color(0xFF2A2E37))),
        tileColor: const Color(0xFF1C1F24),
        leading: Icon(icon, color: isDestructive ? const Color(0xFFEF4444) : Colors.white),
        title: Text(title, style: TextStyle(color: isDestructive ? const Color(0xFFEF4444) : Colors.white, fontWeight: FontWeight.w500)),
        trailing: const Icon(Icons.chevron_right_rounded, color: Colors.grey),
        onTap: () {},
      ),
    );
  }
}