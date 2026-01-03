import 'package:flutter/material.dart';

import '../../../history/presentation/view/histroy_screen.dart';
import '../../../notifications/presentation/view/notifications_screen.dart';
import '../../../profile/presentation/view/profile_screen.dart';
import 'dashboard_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  late List<Widget> _screens;

  bool _showFloatingNav = true;
  late ScrollController _scrollController;
  double _previousScroll = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_handleScroll);
    _screens = [
      DashboardScreen(scrollController: _scrollController,),
      HistroyScreen(),
      NotificationsScreen(),
      ProfileScreen(),
    ];
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _handleScroll() {
    final currentScroll = _scrollController.position.pixels;
    final threshold = 30.0;
    if (currentScroll > _previousScroll && currentScroll > threshold) {
      if (_showFloatingNav) setState(() => _showFloatingNav = false);
    } else if (currentScroll < _previousScroll || currentScroll <= threshold) {
      if (!_showFloatingNav) setState(() => _showFloatingNav = true);
    }
    _previousScroll = currentScroll;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// 🔹 Screen content
          IndexedStack(
            index: _currentIndex,
            children: _screens,
          ),

          /// 🔹 Floating Bottom Nav
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 300),
              opacity: _showFloatingNav ? 1.0 : 0.0,
              child: Material(
                borderRadius: BorderRadius.circular(30),
                elevation: 6,
                color: Colors.white,
                child: Container(
                  height: 60,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: _buildFloatingNavBar(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onNavTap(int index) {
    setState(() => _currentIndex = index);
    // Navigation example
    // Widget targetScreen;
    // switch (index) {
    //   case 0:
    //     targetScreen = DashboardScreen();
    //     break;
    //   case 1:
    //     targetScreen = HistroyScreen();
    //     break;
    //   case 2:
    //     targetScreen = NotificationsScreen();
    //     break;
    //   case 3:
    //     targetScreen = ProfileScreen();
    //     break;
    //   default:
    //     targetScreen = DashboardScreen();
    // }
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => targetScreen));
  }


  Widget _buildFloatingNavBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildNavItem(Icons.home_outlined, Icons.home_rounded, 'Home', _currentIndex == 0, () => _onNavTap(0)),
        _buildNavItem(Icons.confirmation_number_outlined, Icons.confirmation_number_rounded, 'Tickets', _currentIndex == 1, () => _onNavTap(1)),
        _buildNavItem(Icons.notifications_outlined, Icons.notifications_rounded, 'Alerts', _currentIndex == 2, () => _onNavTap(2)),
        _buildNavItem(Icons.person_outline, Icons.person_rounded, 'Profile', _currentIndex == 3, () => _onNavTap(3)),
      ],
    );
  }

  Widget _buildNavItem(IconData icon, IconData activeIcon, String label, bool isActive, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(isActive ? activeIcon : icon, color: isActive ? Color(0xFFffe696e) : Colors.grey.shade600, size: 22),
          SizedBox(height: 2),
          Text(label, style: TextStyle(color: isActive ? Color(0xFFffe696e) : Colors.grey.shade600, fontSize: 10, fontWeight: isActive ? FontWeight.w600 : FontWeight.normal)),
        ],
      ),
    );
  }



}
