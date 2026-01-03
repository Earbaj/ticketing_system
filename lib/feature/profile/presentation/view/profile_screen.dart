import 'package:flutter/material.dart';

import '../../../../core/constant/app_color.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = "Emily Smith";
  String email = "emily.smith@example.com";
  String phone = "+1 (555) 123-4567";
  String gender = "Female";
  String age = "28";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text("Profile",style: TextStyle(color: Colors.white),),
        backgroundColor: AppColor.primaryColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // App Bar
              // Container(
              //   padding: const EdgeInsets.only(left: 15, right: 15),
              //   height: 70,
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //     color: const Color(0xFFffe696e),
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.black.withOpacity(0.1),
              //         blurRadius: 4,
              //         offset: const Offset(0, 2),
              //       ),
              //     ],
              //   ),
              //   child: Row(
              //     children: [
              //       GestureDetector(
              //         onTap: () {
              //           Navigator.pop(context);
              //         },
              //         child: const Icon(
              //           Icons.arrow_back,
              //           color: Colors.white,
              //           size: 28,
              //         ),
              //       ),
              //       const SizedBox(width: 120),
              //       const Expanded(
              //         child: Text(
              //           'Profile',
              //           style: TextStyle(
              //             fontSize: 22.0,
              //             color: Colors.white,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              // Avatar Section
              Container(
                padding: const EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(
                  color: const Color(0xFFffe696e).withValues(alpha: 0.25),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Main Avatar
                      Container(
                        width: 180,
                        height: 180,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFFffe696e),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.15),
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'ES',
                            style: TextStyle(
                              fontSize: 42.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      // Gallery Icon Button
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: GestureDetector(
                          onTap: () {
                            _showImagePickerOptions();
                          },
                          child: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFFffe696e),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.2),
                                  blurRadius: 6,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            child: const Icon(
                              Icons.camera_alt_rounded,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Personal Information Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Section Header
                    const Text(
                      'Personal Information',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Manage your personal details',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Name Card
                    _buildInfoCard(
                      icon: Icons.person_outline,
                      title: 'Full Name',
                      value: name,
                    ),

                    const SizedBox(height: 12),

                    // Email Card
                    _buildInfoCard(
                      icon: Icons.email_outlined,
                      title: 'Email Address',
                      value: email,
                    ),

                    const SizedBox(height: 12),

                    // Phone Card
                    _buildInfoCard(
                      icon: Icons.phone_outlined,
                      title: 'Phone Number',
                      value: phone,

                    ),

                    const SizedBox(height: 30),

                    // Additional Information Section
                    const Text(
                      'Additional Information',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Gender and Age in Row
                    Row(
                      children: [
                        Expanded(
                          child: _buildDetailCard(
                            icon: Icons.transgender,
                            title: 'Gender',
                            value: gender,
                            color: Colors.purple.withValues(alpha: 0.1),
                            iconColor: Colors.purple,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildDetailCard(
                            icon: Icons.cake_outlined,
                            title: 'Age',
                            value: '$age years',
                            color: Colors.orange.withValues(alpha: 0.1),
                            iconColor: Colors.orange,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    // Edit Profile Button
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color:AppColor.primaryButtonColor,
                        // gradient: LinearGradient(
                        //   colors: [
                        //     AppColor.primaryButtonColor,
                        //     const Color(0xFFffe696e).withValues(alpha: 0.9),
                        //   ],
                        //   begin: Alignment.centerLeft,
                        //   end: Alignment.centerRight,
                        // ),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFffe696e).withValues(alpha: 0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            _showEditProfileDialog();
                          },
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.edit_outlined,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Edit Profile Information',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Additional Options
                    _buildOptionTile(
                      icon: Icons.notifications_outlined,
                      title: 'Notification Settings',
                      onTap: () {},
                    ),
                    _buildOptionTile(
                      icon: Icons.security_outlined,
                      title: 'Privacy & Security',
                      onTap: () {},
                    ),
                    _buildOptionTile(
                      icon: Icons.help_outline,
                      title: 'Help & Support',
                      onTap: () {},
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Info Card Widget
  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFffe696e).withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: const Color(0xFFffe696e),
                size: 22,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              color: Colors.grey,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }

  // Detail Card for Gender & Age
  Widget _buildDetailCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade100, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 20,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.edit_outlined,
                color: iconColor,
                size: 18,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // Option Tile Widget
  Widget _buildOptionTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade200, width: 1),
            ),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.grey[700],
                size: 22,
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: Colors.grey[400],
                size: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Image picker options
  void _showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.camera_alt_rounded, color: Color(0xFFffe696e)),
            title: const Text('Take Photo'),
            onTap: () {
              Navigator.pop(context);
              // Implement camera functionality
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_library_rounded, color: Color(0xFFffe696e)),
            title: const Text('Choose from Gallery'),
            onTap: () {
              Navigator.pop(context);
              // Implement gallery picker
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete_outline, color: Colors.red),
            title: const Text('Remove Photo', style: TextStyle(color: Colors.red)),
            onTap: () {
              Navigator.pop(context);
              // Remove current photo
            },
          ),
        ],
      ),
    );
  }

  // Edit profile dialog
  void _showEditProfileDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Profile'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
                controller: TextEditingController(text: name),
                onChanged: (value) => name = value,
              ),
              const SizedBox(height: 12),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                controller: TextEditingController(text: email),
                onChanged: (value) => email = value,
              ),
              const SizedBox(height: 12),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(),
                ),
                controller: TextEditingController(text: phone),
                onChanged: (value) => phone = value,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {});
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFffe696e),
            ),
            child: const Text('Save Changes'),
          ),
        ],
      ),
    );
  }
}