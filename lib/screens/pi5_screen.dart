import 'package:flutter/material.dart';

class Pi5Screen extends StatefulWidget {
  const Pi5Screen({Key? key}) : super(key: key);
  @override
  State<Pi5Screen> createState() => _Pi5ScreenState();
}

class _Pi5ScreenState extends State<Pi5Screen> {
  double _redThreshold = 1.5;
  double _yellowThreshold = 3.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quản lý Phần cứng'), centerTitle: false),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('CHẨN ĐOÁN THIẾT BỊ', style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1)),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildBentoCard('Nhiệt độ CPU', '55°C', Icons.thermostat, Colors.orange),
              const SizedBox(width: 12),
              _buildBentoCard('Webcam AI', '30 FPS', Icons.camera_alt_outlined, Colors.blue),
            ],
          ),
          const SizedBox(height: 32),
          const Text('CẤU HÌNH NGƯỠNG CẢNH BÁO', style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1)),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF1C1F24),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: const Color(0xFF2A2E37)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Ngưỡng Đỏ (Nguy hiểm)', style: TextStyle(fontWeight: FontWeight.w600)),
                    Text('${_redThreshold.toStringAsFixed(1)}m', style: const TextStyle(color: Color(0xFFEF4444), fontWeight: FontWeight.bold, fontSize: 16)),
                  ],
                ),
                Slider(
                  value: _redThreshold, min: 0.5, max: 4.0, activeColor: const Color(0xFFEF4444),
                  onChanged: (v) => setState(() {
                    _redThreshold = v;
                    if (_yellowThreshold <= _redThreshold + 0.5) _yellowThreshold = _redThreshold + 0.5; 
                  })
                ),
                const Divider(color: Color(0xFF2A2E37), height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Ngưỡng Vàng (Chú ý)', style: TextStyle(fontWeight: FontWeight.w600)),
                    Text('${_yellowThreshold.toStringAsFixed(1)}m', style: const TextStyle(color: Color(0xFFF97316), fontWeight: FontWeight.bold, fontSize: 16)),
                  ],
                ),
                Slider(
                  value: _yellowThreshold, min: 1.0, max: 7.0, activeColor: const Color(0xFFF97316),
                  onChanged: (v) => setState(() {
                    if (v > _redThreshold + 0.5) _yellowThreshold = v;
                  })
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBentoCard(String title, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1C1F24),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFF2A2E37)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(height: 16),
            Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 4),
            Text(title, style: const TextStyle(color: Colors.grey, fontSize: 13)),
          ],
        ),
      ),
    );
  }
}