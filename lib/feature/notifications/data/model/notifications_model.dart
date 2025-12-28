import 'package:flutter/cupertino.dart';

class NotificationModel {
  final String id;
  final String title;
  final String message;
  final String time;
  final String type; // 'booking', 'promotion', 'system', 'alert'
  final bool isRead;
  final IconData icon;
  final Color iconColor;

  NotificationModel({
    required this.id,
    required this.title,
    required this.message,
    required this.time,
    required this.type,
    required this.isRead,
    required this.icon,
    required this.iconColor,
  });
}