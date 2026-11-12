import 'package:flutter/material.dart';
import '../models/alert_model.dart';

class AlertRepository {
  static final AlertRepository _instance = AlertRepository._internal();
  factory AlertRepository() => _instance;
  AlertRepository._internal();

  final ValueNotifier<List<AlertEvent>> alertsNotifier = ValueNotifier([
    AlertEvent(
      id: '1', 
      timestamp: DateTime.now().subtract(const Duration(minutes: 5)), 
      distance: 1.2, 
      speed: 18.5, 
      type: 'Phương tiện cơ giới', 
      status: 'DANGER'
    ),
    AlertEvent(
      id: '2', 
      timestamp: DateTime.now().subtract(const Duration(hours: 1)), 
      distance: 3.5, 
      speed: 12.0, 
      type: 'Người đi bộ', 
      status: 'WARNING'
    ),
  ]);

  void addAlert(AlertEvent newEvent) {
    final currentList = List<AlertEvent>.from(alertsNotifier.value);
    currentList.insert(0, newEvent);
    alertsNotifier.value = currentList;
  }

  void clearHistory() {
    alertsNotifier.value = [];
  }
}