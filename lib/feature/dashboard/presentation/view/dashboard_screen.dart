
import 'package:flutter/material.dart';

import '../widget/ticket_card.dart';

class DashboardScreen extends StatefulWidget  {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>  with SingleTickerProviderStateMixin {

  late TabController _tabController;

  final List<String> busNames = [
    'ALL Travels',
    'SR Travels',
    'Shymoli NR Travels',
    'Shymoli SR Travels',
    'Hanif Travels',
    'Orin Travels',
    'Green Line Travels',
    'Alhamra Travels',
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
                padding: EdgeInsets.only(left: 15,right: 15),
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFffe696e)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 25, // Sets the size of the avatar
                          backgroundColor: Colors.white, // Color displayed if no image is present
                          child: Text(
                            'ES',
                            style: TextStyle(fontSize: 20.0, color: Colors.black45),
                          ), // Child widget, e.g., user initials
                        ),
                        SizedBox(width: 10,),
                        Text(
                          'Earbaj Md Saria',
                          style: TextStyle(fontSize: 20.0, color: Colors.white,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Icon(Icons.logout,color: Colors.white,),
                  ],
                ),
              ),
              DefaultTabController(
                length: 8, // Number of tabs
                child: TabBar(
                  controller: _tabController,
                  isScrollable: true, // This enables horizontal scrolling
                  tabAlignment: TabAlignment.start, // Aligns tabs to the left
                  indicatorColor: Colors.black26,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black26,
                  tabs: busNames.map((name) => Tab(text: name)).toList(),
                )
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 12),
                      child: TicketCard(busName:  busNames[_tabController.index],),
                    );
                  },
                ),
              ),
            ],
          )
      ),
    );
  }
}
