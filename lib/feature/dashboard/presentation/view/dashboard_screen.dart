import 'package:flutter/material.dart';

import '../../../auth/presentation/view/login_screen.dart';
import '../../../details/data/model/ticket_details.dart';
import '../../../details/presentation/view/ticket_details_screen.dart';
import '../../../profile/presentation/view/profile_screen.dart';
import '../widget/ticket_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> busNames = [
    'ALL Travels',
    'BS Travels',
    'SS NR Travels',
    'TS SR Travels',
    'GF Travels',
    'FD Travels',
    'DD Travels',
    'AA Travels',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: busNames.length, vsync: this);
    _tabController.addListener(() {
      setState(() {}); // rebuild on tab change
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            height: 70,
            width: double.infinity,
            decoration: BoxDecoration(color: Color(0xFFffe696e)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileScreen()));
                      },
                      child: CircleAvatar(
                        radius: 25,
                        // Sets the size of the avatar
                        backgroundColor: Colors.white,
                        // Color displayed if no image is present
                        child: Text(
                          'ES',
                          style: TextStyle(fontSize: 20.0, color: Colors.black45),
                        ), // Child widget, e.g., user initials
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Earbaj Md Saria',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: Icon(
                      Icons.logout,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
          DefaultTabController(
              length: 8, // Number of tabs
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                // This enables horizontal scrolling
                tabAlignment: TabAlignment.start,
                // Aligns tabs to the left
                indicatorColor: Colors.black26,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black26,
                tabs: busNames.map((name) => Tab(text: name)).toList(),
              )),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 12),
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
                      child: TicketCard(
                        busName: busNames[_tabController.index],
                      )),
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
