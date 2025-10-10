import 'dart:ui';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    Center(child: Text("Tickets")),
    Center(child: Text("Notifications")),
    Center(child: Text("Profile")),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1D1D1F),
      key: _scaffoldKey,
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.black),
              child: Text("Menu",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            ListTile(
                leading: Icon(Icons.home, color: Colors.white),
                title: Text('Home')),
            ListTile(
                leading: Icon(Icons.flight, color: Colors.white),
                title: Text('My Flights')),
            ListTile(
                leading: Icon(Icons.settings, color: Colors.white),
                title: Text('Settings')),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.align_horizontal_left,
            color: Color(0xFF8C8A93),
          ),
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),
        ),
        actions: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Color(0xFF8C8A93),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.image_rounded,
              color: Colors.white,
              size: 35,
            ),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF3D3C3F),
        selectedItemColor: Colors.greenAccent,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.airplane_ticket), label: 'Tickets'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Alerts'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Hello! James",
              style: TextStyle(color: Colors.greenAccent, fontSize: 16)),
          const SizedBox(height: 5),
          const Text("Where are you going?",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Color(0xFF313133),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Search a flight',
                prefixIcon: Icon(
                  Icons.search,
                  color: Color(0xFF45EA69),
                ),
                suffixIcon: Icon(
                  Icons.mic,
                  color: Color(0xFFA5A8B0),
                ),
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: Color(0xFFA5A8B0),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
              ),
            ),
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Upcoming Flights",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              Text("View All", style: TextStyle(color: Color(0xFF8C8A93))),
            ],
          ),
          const SizedBox(height: 15),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[850],
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: const [
                //     Text("NYC", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                //     Icon(FontAwesomeIcons.plane, color: Colors.greenAccent),
                //     Text("SFO", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                //   ],
                // ),
                FlightPathWidget(),
                const SizedBox(height: 1),
                const Text("2hr 30min", style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("DATE & TIME\nFeb 25, 11:30pm",
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                    Text("FLIGHT NUMBER\nAB4553",
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
                // const Divider(height: 25, color: Colors.grey),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: DottedLine(
                    dashColor: Colors.grey,
                    dashLength: 8,
                    lineThickness: 1,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(Icons.airplane_ticket, color: Colors.grey),
                    Text("\$500",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Popular Places",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              Text("View All", style: TextStyle(color: Color(0xFF8C8A93))),
            ],
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 180,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                buildPlaceCard("Paris", "France", "4.8"),
                buildPlaceCard("Abu Dhabi", "Dubai", "4.7"),
                buildPlaceCard("Tokyo", "Japan", "4.9"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPlaceCard(String name, String country, String rating) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            child: Center(
              child: Icon(Icons.image, size: 50, color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                const Icon(Icons.location_on, size: 14, color: Colors.grey),
                const SizedBox(width: 4),
                Text(country,
                    style: const TextStyle(fontSize: 12, color: Colors.grey)),
                const Spacer(),
                const Icon(Icons.star, color: Colors.orange, size: 14),
                Text(rating,
                    style: const TextStyle(color: Colors.white, fontSize: 12)),
              ],
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class FlightPathWidget extends StatelessWidget {
  const FlightPathWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        // ✈️ Dotted curved flight path at top
        Positioned(
          top: -15,
          left: 50,
          right: 50,
          child: SizedBox(
            height: 80,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8.0),
              child: CustomPaint(
                painter: FlightPathPainter(),
              ),
            ),
          ),
        ),

        // 🌆 Text section below curve
        Padding(
          padding: const EdgeInsets.only(top: 30), // move texts below curve
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Start point (NYC)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("NYC",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  Text("New York City",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ],
              ),

              // End point (SFO)
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text("SFO",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  Text("San Francisco",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   children: [
    //     // Start point (NYC)
    //     Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: const [
    //         Text("NYC",
    //             style: TextStyle(
    //                 fontSize: 20,
    //                 fontWeight: FontWeight.bold,
    //                 color: Colors.white)),
    //         Text("New York City",
    //             style: TextStyle(
    //                 fontSize: 14,
    //                 fontWeight: FontWeight.bold,
    //                 color: Colors.white)),
    //       ],
    //     ),
    //
    //     // Curved dotted path with plane
    //     SizedBox(
    //       height: 80,
    //       width: 120,
    //       child: CustomPaint(
    //         painter: FlightPathPainter(),
    //         child: const SizedBox(height: 80),
    //       ),
    //     ),
    //
    //     // End point (SFO)
    //     Column(
    //       crossAxisAlignment: CrossAxisAlignment.end,
    //       children: const [
    //         Text("SFO",
    //             style: TextStyle(
    //                 fontSize: 20,
    //                 fontWeight: FontWeight.bold,
    //                 color: Colors.white)),
    //         Text("San Fransisco",
    //             style: TextStyle(
    //                 fontSize: 14,
    //                 fontWeight: FontWeight.bold,
    //                 color: Colors.white)),
    //       ],
    //     ),
    //   ],
    // );
  }
}

class FlightPathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint dottedLinePaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final Paint greenDotPaint = Paint()
      ..color = Colors.greenAccent
      ..style = PaintingStyle.fill;

    // Create a curved path (arc-like)
    final Path path = Path();
    path.moveTo(0, size.height * 0.7);
    path.quadraticBezierTo(
      size.width / 2,
      -10, // control point (curve peak)
      size.width,
      size.height * 0.7,
    );

    // Draw dotted path
    const double dashWidth = 6;
    const double dashSpace = 4;
    double distance = 0.0;
    for (PathMetric pathMetric in path.computeMetrics()) {
      final double totalLength = pathMetric.length;
      int index = 0;

      while (distance < totalLength) {
        final Tangent? tangent = pathMetric.getTangentForOffset(distance);
        if (tangent == null) break;

        // 🎯 Draw first dot green
        if (index == 0) {
          canvas.drawCircle(tangent.position, 2.5, greenDotPaint);
        }
        // 🎯 Draw last dot green
        else if (distance + dashWidth + dashSpace >= totalLength) {
          canvas.drawCircle(tangent.position, 2.5, greenDotPaint);
        }
        // 🩶 Draw middle dots grey
        else {
          canvas.drawCircle(tangent.position, 1.5, dottedLinePaint);
        }

        distance += dashWidth + dashSpace;
        index++;
      }
    }

    // Draw plane icon in the middle of the curve
    final double midOffset = path.computeMetrics().first.length / 2;
    final Tangent? midTangent =
        path.computeMetrics().first.getTangentForOffset(midOffset);
    if (midTangent != null) {
      final planeIcon = FontAwesomeIcons.plane;
      final textPainter = TextPainter(
        text: TextSpan(
          text: String.fromCharCode(planeIcon.codePoint),
          style: TextStyle(
            fontFamily: planeIcon.fontFamily,
            package: planeIcon.fontPackage,
            fontSize: 20,
            color: Color(0xFFDCDEE3),
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      canvas.save();
      canvas.translate(
          midTangent.position.dx - 10, midTangent.position.dy - 10);
      canvas.rotate(midTangent.angle);
      textPainter.paint(canvas, Offset.zero);
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
