import 'package:flutter/material.dart';

import '../../data/model/notifications_model.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFffe696e),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Notifications',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          // Header Stats
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color(0xFFffe696e).withOpacity(0.1),
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade200),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem(
                  count: '12',
                  label: 'Unread',
                  color: Color(0xFFffe696e),
                ),
                _buildStatItem(
                  count: '48',
                  label: 'All',
                  color: Colors.grey.shade600,
                ),
                _buildStatItem(
                  count: '5',
                  label: 'Important',
                  color: Colors.red.shade400,
                ),
              ],
            ),
          ),

          // Filter Chips
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterChip(label: 'All', isSelected: true),
                  SizedBox(width: 8),
                  _buildFilterChip(label: 'Unread', isSelected: false),
                  SizedBox(width: 8),
                  _buildFilterChip(label: 'Bookings', isSelected: false),
                  SizedBox(width: 8),
                  _buildFilterChip(label: 'Promotions', isSelected: false),
                  SizedBox(width: 8),
                  _buildFilterChip(label: 'System', isSelected: false),
                ],
              ),
            ),
          ),

          // Notifications List
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: index == notifications.length-1 ? 65:0.0),
                  child: NotificationCard(notification: notifications[index]),
                );
              },
            ),
          ),
        ],
      ),

    );
  }

  Widget _buildStatItem({required String count, required String label, required Color color}) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildFilterChip({required String label, required bool isSelected}) {
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (bool value) {
        // Handle filter selection
      },
      selectedColor: Color(0xFFffe696e),
      backgroundColor: Colors.grey.shade100,
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : Colors.black87,
      ),
      checkmarkColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}



// Dummy Notifications Data
List<NotificationModel> notifications = [
  NotificationModel(
    id: '1',
    title: 'Booking Confirmed!',
    message: 'Your bus ticket for Dhaka to Chittagong has been confirmed. Seat No: B-12',
    time: '2 minutes ago',
    type: 'booking',
    isRead: false,
    icon: Icons.confirmation_number,
    iconColor: Colors.green,
  ),
  NotificationModel(
    id: '2',
    title: 'Special Offer!',
    message: 'Get 20% off on your next bus booking. Limited time offer.',
    time: '1 hour ago',
    type: 'promotion',
    isRead: true,
    icon: Icons.local_offer,
    iconColor: Colors.orange,
  ),
  NotificationModel(
    id: '3',
    title: 'System Maintenance',
    message: 'Our app will undergo maintenance from 2 AM to 4 AM.',
    time: '3 hours ago',
    type: 'system',
    isRead: true,
    icon: Icons.settings,
    iconColor: Colors.blue,
  ),
  NotificationModel(
    id: '4',
    title: 'Payment Successful',
    message: 'Your payment of ৳850 has been processed successfully.',
    time: '5 hours ago',
    type: 'booking',
    isRead: false,
    icon: Icons.payment,
    iconColor: Colors.green,
  ),
  NotificationModel(
    id: '5',
    title: 'Bus Delay Alert',
    message: 'Bus "Green Line" is delayed by 30 minutes due to traffic.',
    time: 'Yesterday',
    type: 'alert',
    isRead: true,
    icon: Icons.warning,
    iconColor: Colors.red,
  ),
  NotificationModel(
    id: '6',
    title: 'New Feature Added',
    message: 'Check out our new seat selection feature!',
    time: 'Yesterday',
    type: 'system',
    isRead: true,
    icon: Icons.new_releases,
    iconColor: Colors.purple,
  ),
  NotificationModel(
    id: '7',
    title: 'Trip Reminder',
    message: 'Your bus to Sylhet departs tomorrow at 8:00 AM.',
    time: '2 days ago',
    type: 'booking',
    isRead: false,
    icon: Icons.notifications_active,
    iconColor: Color(0xFFffe696e),
  ),
  NotificationModel(
    id: '8',
    title: 'Refer & Earn',
    message: 'Refer a friend and get ৳100 credit on their first booking.',
    time: '3 days ago',
    type: 'promotion',
    isRead: true,
    icon: Icons.group_add,
    iconColor: Colors.teal,
  ),
  NotificationModel(
    id: '9',
    title: 'Booking Cancelled',
    message: 'Your booking for Dhaka to Rajshahi has been cancelled. Refund initiated.',
    time: '4 days ago',
    type: 'booking',
    isRead: true,
    icon: Icons.cancel,
    iconColor: Colors.red,
  ),
  NotificationModel(
    id: '10',
    title: 'App Update Available',
    message: 'Update to version 2.1.0 for better performance and new features.',
    time: '5 days ago',
    type: 'system',
    isRead: true,
    icon: Icons.system_update,
    iconColor: Colors.blue,
  ),
];

// Notification Card Widget
class NotificationCard extends StatelessWidget {
  final NotificationModel notification;

  const NotificationCard({Key? key, required this.notification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: notification.isRead
              ? null
              : Border.all(color: Color(0xFFffe696e).withOpacity(0.3), width: 1.5),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon Container
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: notification.iconColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  notification.icon,
                  color: notification.iconColor,
                  size: 24,
                ),
              ),

              SizedBox(width: 12),

              // Notification Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            notification.title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (!notification.isRead)
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: Color(0xFFffe696e),
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),

                    SizedBox(height: 4),

                    Text(
                      notification.message,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                        height: 1.3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    SizedBox(height: 8),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: _getTypeColor(notification.type).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            notification.type.toUpperCase(),
                            style: TextStyle(
                              fontSize: 10,
                              color: _getTypeColor(notification.type),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        Text(
                          notification.time,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // More Options
              PopupMenuButton<String>(
                icon: Icon(Icons.more_vert, color: Colors.grey.shade400, size: 20),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'mark',
                    child: Row(
                      children: [
                        Icon(Icons.mark_email_read, size: 18, color: Colors.grey.shade700),
                        SizedBox(width: 8),
                        Text(notification.isRead ? 'Mark as Unread' : 'Mark as Read'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'delete',
                    child: Row(
                      children: [
                        Icon(Icons.delete_outline, size: 18, color: Colors.red),
                        SizedBox(width: 8),
                        Text('Delete', style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                ],
                onSelected: (value) {
                  if (value == 'mark') {
                    // Handle mark as read/unread
                  } else if (value == 'delete') {
                    // Handle delete
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getTypeColor(String type) {
    switch (type) {
      case 'booking':
        return Colors.green;
      case 'promotion':
        return Colors.orange;
      case 'system':
        return Colors.blue;
      case 'alert':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}