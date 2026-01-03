// import 'package:flutter/material.dart';
//
import '../../../auth/presentation/view/login_screen.dart';
import '../../../details/data/model/ticket_details.dart';
import '../../../details/presentation/view/ticket_details_screen.dart';
import '../../../history/presentation/view/histroy_screen.dart';
import '../../../notifications/presentation/view/notifications_screen.dart';
import '../../../profile/presentation/view/profile_screen.dart';
import '../widget/ticket_card.dart';
//
// class DashboardScreen extends StatefulWidget {
//   const DashboardScreen({super.key});
//
//   @override
//   State<DashboardScreen> createState() => _DashboardScreenState();
// }
//
// class _DashboardScreenState extends State<DashboardScreen>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//
//   final List<String> busNames = [
//     'ALL Travels',
//     'BS Travels',
//     'SS NR Travels',
//     'TS SR Travels',
//     'GF Travels',
//     'FD Travels',
//     'DD Travels',
//     'AA Travels',
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: busNames.length, vsync: this);
//     _tabController.addListener(() {
//       setState(() {}); // rebuild on tab change
//     });
//   }
//
//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//           child: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.only(left: 15, right: 15),
//             height: 70,
//             width: double.infinity,
//             decoration: BoxDecoration(color: Color(0xFFffe696e)),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => ProfileScreen()));
//                       },
//                       child: CircleAvatar(
//                         radius: 25,
//                         // Sets the size of the avatar
//                         backgroundColor: Colors.white,
//                         // Color displayed if no image is present
//                         child: Text(
//                           'ES',
//                           style: TextStyle(fontSize: 20.0, color: Colors.black45),
//                         ), // Child widget, e.g., user initials
//                       ),
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Text(
//                       'Earbaj Md Saria',
//                       style: TextStyle(
//                           fontSize: 20.0,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//                 GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => LoginScreen()));
//                     },
//                     child: Icon(
//                       Icons.logout,
//                       color: Colors.white,
//                     )),
//               ],
//             ),
//           ),
//           DefaultTabController(
//               length: 8, // Number of tabs
//               child: TabBar(
//                 controller: _tabController,
//                 isScrollable: true,
//                 // This enables horizontal scrolling
//                 tabAlignment: TabAlignment.start,
//                 // Aligns tabs to the left
//                 indicatorColor: Colors.black26,
//                 labelColor: Colors.black,
//                 unselectedLabelColor: Colors.black26,
//                 tabs: busNames.map((name) => Tab(text: name)).toList(),
//               )),
//           Expanded(
//             child: ListView.builder(
//               padding: EdgeInsets.all(16),
//               itemCount: 10,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: EdgeInsets.only(bottom: 12),
//                   child: GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) =>
//                                     TicketDetailsScreen(
//                                       ticket: TicketDetails(
//                                         busName: busNames[_tabController.index],
//                                         busType: "AC",
//                                         busNumber: "${busNames[_tabController.index].substring(0,2)}-2034",
//                                         departureTime: "10:30 PM",
//                                         arrivalTime: "6:00 AM",
//                                         duration: "7h 30m",
//                                         departureDate: "25 Jan 2025",
//                                         boardingPoint: "Gabtoli Counter",
//                                         droppingPoint: "Chittagong Counter",
//                                         ticketPrice: "৳-850"
//                                       ),
//                                     )
//                             )
//                         );
//                       },
//                       child: TicketCard(
//                         busName: busNames[_tabController.index],
//                       )),
//                 );
//               },
//             ),
//           ),
//         ],
//       )),
//     );
//   }
// }


import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  final ScrollController scrollController;
  const DashboardScreen({
    Key? key,
    required this.scrollController,
  }) : super(key: key);
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> busNames = ['Bus 1', 'Bus 2', 'Bus 3', 'Bus 4', 'Bus 5', 'Bus 6', 'Bus 7', 'Bus 8'];
  //late ScrollController _scrollController;
  bool _showFloatingNav = true;
  double _previousScroll = 0.0;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: busNames.length, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging == false) {
        setState(() {}); // rebuild jokhon tab change hoi
      }
    });
    //_scrollController = ScrollController();
    //_scrollController.addListener(_handleScroll);
  }

  // void _handleScroll() {
  //   final currentScroll = _scrollController.position.pixels;
  //   final threshold = 30.0;
  //   if (currentScroll > _previousScroll && currentScroll > threshold) {
  //     if (_showFloatingNav) setState(() => _showFloatingNav = false);
  //   } else if (currentScroll < _previousScroll || currentScroll <= threshold) {
  //     if (!_showFloatingNav) setState(() => _showFloatingNav = true);
  //   }
  //   _previousScroll = currentScroll;
  // }

  // void _onNavTap(int index) {
  //   setState(() => _currentIndex = index);
  //   // Navigation example
  //   Widget targetScreen;
  //   switch (index) {
  //     case 0:
  //       targetScreen = DashboardScreen();
  //       break;
  //     case 1:
  //       targetScreen = HistroyScreen();
  //       break;
  //     case 2:
  //       targetScreen = NotificationsScreen();
  //       break;
  //     case 3:
  //       targetScreen = ProfileScreen();
  //       break;
  //     default:
  //       targetScreen = DashboardScreen();
  //   }
  //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => targetScreen));
  // }

  @override
  void dispose() {
    // _scrollController.removeListener(_handleScroll);
    // _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          // Full screen list + header
          SafeArea(
            child: Column(
              children: [
                //_buildHeader(),
                TabBar(
                  tabAlignment: TabAlignment.start,
                  controller: _tabController,
                  isScrollable: true,
                  indicatorColor: Colors.black26,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black26,
                  tabs: busNames.map((e) => Tab(text: e)).toList(),
                ),
                Expanded(
                  child: ListView.builder(
                    controller: widget.scrollController,
                    padding: EdgeInsets.only(left: 16, right: 16, bottom: 100), // space for floating nav
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          TicketDetailsScreen(
                                            ticket: TicketDetails(
                                                busName: busNames[_tabController.index],
                                                busType: "AC",
                                                busNumber: "${busNames[_tabController.index].substring(0,2)}-2034",
                                                departureTime: "10:30 PM",
                                                arrivalTime: "6:00 AM",
                                                duration: "7h 30m",
                                                departureDate: "25 Jan 2025",
                                                boardingPoint: "Gabtoli Counter",
                                                droppingPoint: "Chittagong Counter",
                                                ticketPrice: "৳-850"
                                            ),
                                          )
                                  )
                              );
                            },
                            child: TicketCard(busName: busNames[_tabController.index])),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // Floating Navigation Bar (always on top of list)
          // Positioned(
          //   bottom: 16,
          //   left: 16,
          //   right: 16,
          //   child: AnimatedOpacity(
          //     duration: Duration(milliseconds: 300),
          //     opacity: _showFloatingNav ? 1.0 : 0.0,
          //     child: Material(
          //       borderRadius: BorderRadius.circular(30),
          //       elevation: 6,
          //       color: Colors.white,
          //       child: Container(
          //         height: 60,
          //         padding: EdgeInsets.symmetric(horizontal: 12),
          //         child: _buildFloatingNavBar(),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 70,
      padding: EdgeInsets.symmetric(horizontal: 15),
      color: Color(0xFFffe696e),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileScreen())),
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                  child: Text('ES', style: TextStyle(fontSize: 20, color: Colors.black45)),
                ),
              ),
              SizedBox(width: 10),
              Text('Earbaj Md Saria', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen())),
            child: Icon(Icons.logout, color: Colors.white),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xFFffe696e),
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.1),
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      toolbarHeight: 70, // Match your original height
      flexibleSpace: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => ProfileScreen())
                    ),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: Text(
                          'ES',
                          style: TextStyle(fontSize: 20, color: Colors.black45)
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Earbaj Md Saria',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => LoginScreen())
                ),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.2),
                  ),
                  child: Icon(Icons.logout, color: Colors.white, size: 24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buildFloatingNavBar() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceAround,
  //     children: [
  //       _buildNavItem(Icons.home_outlined, Icons.home_rounded, 'Home', _currentIndex == 0, () => _onNavTap(0)),
  //       _buildNavItem(Icons.confirmation_number_outlined, Icons.confirmation_number_rounded, 'Tickets', _currentIndex == 1, () => _onNavTap(1)),
  //       _buildNavItem(Icons.notifications_outlined, Icons.notifications_rounded, 'Alerts', _currentIndex == 2, () => _onNavTap(2)),
  //       _buildNavItem(Icons.person_outline, Icons.person_rounded, 'Profile', _currentIndex == 3, () => _onNavTap(3)),
  //     ],
  //   );
  // }

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

