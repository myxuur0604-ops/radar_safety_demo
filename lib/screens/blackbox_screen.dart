import 'package:flutter/material.dart';
import '../services/alert_repository.dart';
import '../models/alert_model.dart';

class BlackboxScreen extends StatefulWidget {
  const BlackboxScreen({Key? key}) : super(key: key);

  @override
  State<BlackboxScreen> createState() => _BlackboxScreenState();
}

class _BlackboxScreenState extends State<BlackboxScreen> {
  final AlertRepository _repository = AlertRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hộp đen Hành trình'), 
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_sweep, color: Colors.grey),
            onPressed: () {
              _repository.clearHistory();
            },
          )
        ],
      ),
      body: ValueListenableBuilder<List<AlertEvent>>(
        valueListenable: _repository.alertsNotifier,
        builder: (context, alertsList, child) {
          
          if (alertsList.isEmpty) {
            return const Center(
              child: Text('Chưa có dữ liệu cảnh báo', style: TextStyle(color: Colors.grey)),
            );
          }

          return ListView.builder(
            itemCount: alertsList.length,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemBuilder: (context, index) {
              final event = alertsList[index];
              final isDanger = event.status == "DANGER";
              
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1C1F24),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFF2A2E37)),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isDanger ? const Color(0xFFEF4444).withOpacity(0.1) : const Color(0xFFF97316).withOpacity(0.1), 
                        shape: BoxShape.circle
                      ),
                      child: Icon(
                        isDanger ? Icons.warning_rounded : Icons.info_outline_rounded, 
                        color: isDanger ? const Color(0xFFEF4444) : const Color(0xFFF97316)
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${event.type} #${alertsList.length - index}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          const SizedBox(height: 4),
                          Text(
                            'Cự ly: ${event.distance}m - ${event.speed}km/h\nLúc ${event.timestamp.hour}:${event.timestamp.minute.toString().padLeft(2, '0')}', 
                            style: TextStyle(color: Colors.grey[400], fontSize: 13, height: 1.4)
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      style: IconButton.styleFrom(backgroundColor: const Color(0xFF2A2E37)),
                      icon: const Icon(Icons.image_outlined, size: 20, color: Colors.white),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}