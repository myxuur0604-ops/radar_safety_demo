import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class CockpitScreen extends StatefulWidget {
  const CockpitScreen({Key? key}) : super(key: key);
  @override
  State<CockpitScreen> createState() => _CockpitScreenState();
}

class _CockpitScreenState extends State<CockpitScreen> {
  late ValueNotifier<double> distanceNotifier;
  late ValueNotifier<double> speedNotifier;
  Timer? _mockStreamTimer;

  @override
  void initState() {
    super.initState();
    distanceNotifier = ValueNotifier(8.0);
    speedNotifier = ValueNotifier(45.0);

    // Giả lập dữ liệu Radar bắn về 10 lần/giây
    _mockStreamTimer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      double currentDist = distanceNotifier.value;
      double newDist = currentDist - 0.08; 
      if (newDist <= 0.8) newDist = 10.0; 
      
      distanceNotifier.value = double.parse(newDist.toStringAsFixed(1));
      speedNotifier.value = double.parse((10.0 + Random().nextDouble() * 5).toStringAsFixed(1));
    });
  }

  @override
  void dispose() {
    _mockStreamTimer?.cancel();
    distanceNotifier.dispose();
    speedNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFF10B981).withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFF10B981).withOpacity(0.3)),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.wifi_tethering, color: Color(0xFF10B981), size: 16),
              SizedBox(width: 8),
              Text('ĐÃ KẾT NỐI PI 5 (10Hz)', style: TextStyle(fontSize: 12, color: Color(0xFF10B981), fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ValueListenableBuilder<double>(
                valueListenable: distanceNotifier,
                builder: (context, distance, child) {
                  bool isDanger = distance <= 3.0;
                  Color stateColor = isDanger ? const Color(0xFFEF4444) : const Color(0xFFF97316);
                  return Column(
                    children: [
                      Text('${distance}m', style: TextStyle(fontSize: 72, height: 1.1, fontWeight: FontWeight.w900, color: stateColor, letterSpacing: -2)),
                      ValueListenableBuilder<double>(
                        valueListenable: speedNotifier,
                        builder: (context, speed, child) {
                          return Text(
                            isDanger ? 'NGUY CƠ VA CHẠM • ${speed}km/h' : 'CHÚ Ý VẬT CẢN • ${speed}km/h', 
                            style: TextStyle(color: stateColor, fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 1)
                          );
                        }
                      ),
                    ],
                  );
                }
              ),
              const SizedBox(height: 24),
              
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1C1F24),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: const Color(0xFF2A2E37), width: 1.5),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 20, offset: const Offset(0, 10))
                    ]
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const Icon(Icons.videocam_off_rounded, size: 64, color: Color(0xFF2A2E37)),
                      Positioned(
                        bottom: 24,
                        child: Text(
                          'Khu vực chèn thư viện Video Stream\n(Đường dẫn: /stream.mjpg)',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey[600], fontSize: 13),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              ValueListenableBuilder<double>(
                valueListenable: distanceNotifier,
                builder: (context, distance, child) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1C1F24),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.orange.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.directions_walk_rounded, color: Colors.orange),
                        ),
                        const SizedBox(width: 16),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Mục tiêu #1', style: TextStyle(color: Colors.grey, fontSize: 13)),
                              Text('Người đi bộ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        Text('${distance}m', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}