
import '../../../auth/presentation/view/login_screen.dart';
import '../../../details/data/model/ticket_details.dart';
import '../../../details/presentation/view/ticket_details_screen.dart';

import '../../../profile/presentation/view/profile_screen.dart';
import '../widget/ticket_card.dart';

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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: busNames.length, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging == false) {
        setState(() {}); // rebuild jokhon tab change hoi
      }
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
                        padding: EdgeInsets.only(bottom: 12, top: index == 0?10.0:0.0),
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

}

