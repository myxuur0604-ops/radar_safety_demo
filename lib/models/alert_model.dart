class AlertEvent {
  final String id;
  final DateTime timestamp;
  final double distance;
  final double speed;
  final String type;
  final String status;

  AlertEvent({
    required this.id,
    required this.timestamp,
    required this.distance,
    required this.speed,
    required this.type,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'timestamp': timestamp.toIso8601String(),
      'distance': distance,
      'speed': speed,
      'type': type,
      'status': status,
    };
  }
}