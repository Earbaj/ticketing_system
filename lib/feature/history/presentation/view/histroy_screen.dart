import 'package:flutter/material.dart';
import 'package:ticket_system/feature/history/presentation/view/ticket_details_screen.dart';
import '../../data/model/ticket_history_model.dart';
import '../widget/ticket_history_card.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final List<TicketHistory> allTickets = [
    TicketHistory(
      id: "1",
      busName: "Green Line",
      route: "Dhaka → Chittagong",
      date: "25 Jan 2025",
      time: "10:30 PM",
      seat: "A1, A2",
      price: "৳1700",
      status: "Completed",
      departurePoint: "Gabtoli Counter, Dhaka",
      arrivalPoint: "Bahaddarhat, Chittagong",
      busNumber: "GL-2034",
      busType: "AC Business Class",
      duration: "7h 30m",
      departureLat: 23.8103,
      departureLng: 90.4125,
      arrivalLat: 22.3569,
      arrivalLng: 91.7832,
      amenities: ["AC", "WiFi", "Snacks", "Water", "Charging Port"],
      isRefundable: true,
      cancellationDeadline: DateTime(2025, 1, 24, 18, 30), // 24 Jan 6:30 PM
    ),
    TicketHistory(
      id: "2",
      busName: "Shohagh Paribahan",
      route: "Dhaka → Sylhet",
      date: "20 Jan 2025",
      time: "9:00 PM",
      seat: "B3",
      price: "৳850",
      status: "Completed",
      departurePoint: "Sayedabad, Dhaka",
      arrivalPoint: "Kumarpara, Sylhet",
      busNumber: "SP-4567",
      busType: "AC",
      duration: "5h 45m",
      departureLat: 23.7294,
      departureLng: 90.4114,
      arrivalLat: 24.8910,
      arrivalLng: 91.8712,
      amenities: ["AC", "Water"],
      isRefundable: true,
      cancellationDeadline: DateTime(2025, 1, 19, 21, 0),
    ),
    TicketHistory(
      id: "3",
      busName: "Hanif Enterprise",
      route: "Dhaka → Rajshahi",
      date: "15 Jan 2025",
      time: "8:00 PM",
      seat: "C1",
      price: "৳750",
      status: "Cancelled",
      departurePoint: "Gabtoli, Dhaka",
      arrivalPoint: "Sapura, Rajshahi",
      busNumber: "HE-7890",
      busType: "Non-AC",
      duration: "6h 15m",
      departureLat: 23.8103,
      departureLng: 90.4125,
      arrivalLat: 24.3745,
      arrivalLng: 88.6042,
      amenities: ["Water"],
      isRefundable: true,
      cancellationDeadline: DateTime(2025, 1, 14, 20, 0),
    ),
    TicketHistory(
      id: "4",
      busName: "ENA Transport",
      route: "Dhaka → Cox's Bazar",
      date: "30 Jan 2025",
      time: "11:00 PM",
      seat: "D4, D5",
      price: "৳1200",
      status: "Pending",
      departurePoint: "Fakirapool, Dhaka",
      arrivalPoint: "Kolatali, Cox's Bazar",
      busNumber: "ENA-1234",
      busType: "AC Sleeper",
      duration: "10h 30m",
      departureLat: 23.7278,
      departureLng: 90.4106,
      arrivalLat: 21.4272,
      arrivalLng: 92.0058,
      amenities: ["AC", "WiFi", "Blanket", "Snacks", "Water", "Charging Port"],
      isRefundable: true,
      cancellationDeadline: DateTime(2025, 1, 29, 23, 0),
    ),
    TicketHistory(
      id: "5",
      busName: "Soudia Coach",
      route: "Dhaka → Khulna",
      date: "28 Jan 2025",
      time: "7:30 AM",
      seat: "E7",
      price: "৳650",
      status: "Upcoming",
      departurePoint: "Gulistan, Dhaka",
      arrivalPoint: "Sonadanga, Khulna",
      busNumber: "SC-5678",
      busType: "AC",
      duration: "5h 15m",
      departureLat: 23.7231,
      departureLng: 90.4086,
      arrivalLat: 22.8456,
      arrivalLng: 89.5403,
      amenities: ["AC", "Water"],
      isRefundable: true,
      cancellationDeadline: DateTime(2025, 1, 27, 19, 30),
    ),
  ];

  List<TicketHistory> filteredTickets = [];
  String _searchQuery = "";
  String _selectedFilter = "All"; // "All", "Completed", "Pending", "Cancelled", "Upcoming"

  @override
  void initState() {
    super.initState();
    filteredTickets = allTickets;
  }

  void _filterTickets() {
    setState(() {
      filteredTickets = allTickets.where((ticket) {
        final matchesSearch = ticket.busName.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            ticket.route.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            ticket.date.toLowerCase().contains(_searchQuery.toLowerCase());

        final matchesFilter = _selectedFilter == "All" || ticket.status == _selectedFilter;

        return matchesSearch && matchesFilter;
      }).toList();
    });
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case "Completed":
        return Colors.green;
      case "Pending":
        return Colors.orange;
      case "Cancelled":
        return Colors.red;
      case "Upcoming":
        return Colors.blue;
      case "All":
        return Color(0xFFffe696e);
      default:
        return Colors.grey;
    }
  }

  void _performCancellation(String ticketId) {
    setState(() {
      final index = allTickets.indexWhere((t) => t.id == ticketId);
      if (index != -1) {
        allTickets[index] = TicketHistory(
          id: allTickets[index].id,
          busName: allTickets[index].busName,
          route: allTickets[index].route,
          date: allTickets[index].date,
          time: allTickets[index].time,
          seat: allTickets[index].seat,
          price: allTickets[index].price,
          status: "Cancelled",
          departurePoint: allTickets[index].departurePoint,
          arrivalPoint: allTickets[index].arrivalPoint,
          busNumber: allTickets[index].busNumber,
          busType: allTickets[index].busType,
          duration: allTickets[index].duration,
          departureLat: allTickets[index].departureLat,
          departureLng: allTickets[index].departureLng,
          arrivalLat: allTickets[index].arrivalLat,
          arrivalLng: allTickets[index].arrivalLng,
          amenities: allTickets[index].amenities,
          isRefundable: allTickets[index].isRefundable,
          cancellationDeadline: allTickets[index].cancellationDeadline,
        );
        _filterTickets();
      }
    });

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Ticket cancelled successfully!"),
        backgroundColor: Colors.green,
      ),
    );

    // In real app, call API here
    // await ApiService.cancelTicket(ticketId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Color(0xFFffe696e),
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Ticket History",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              onChanged: (value) {
                _searchQuery = value;
                _filterTickets();
              },
              decoration: InputDecoration(
                hintText: "Search tickets...",
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              ),
            ),
          ),

          // Filter Chip Bar
          Container(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildStatusChip("All"),
                SizedBox(width: 8),
                _buildStatusChip("Completed"),
                SizedBox(width: 8),
                _buildStatusChip("Pending"),
                SizedBox(width: 8),
                _buildStatusChip("Upcoming"),
                SizedBox(width: 8),
                _buildStatusChip("Cancelled"),
              ],
            ),
          ),

          // Ticket Count
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${filteredTickets.length} tickets found",
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                if (_selectedFilter != "All")
                  TextButton(
                    onPressed: () {
                      setState(() => _selectedFilter = "All");
                      _filterTickets();
                    },
                    child: Text("Clear filter"),
                  ),
              ],
            ),
          ),

          // Tickets List
          Expanded(
            child: filteredTickets.isEmpty
                ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.receipt_long, size: 64, color: Colors.grey.shade400),
                  SizedBox(height: 16),
                  Text(
                    "No tickets found",
                    style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
                  ),
                  Text(
                    "Try adjusting your search or filter",
                    style: TextStyle(color: Colors.grey.shade500),
                  ),
                ],
              ),
            )
                : RefreshIndicator(
              onRefresh: () async {
                // Call API to refresh data
                await Future.delayed(Duration(seconds: 1));
                setState(() {});
              },
              child: ListView.builder(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 100),
                itemCount: filteredTickets.length,
                itemBuilder: (context, index) {
                  final ticket = filteredTickets[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HistoryTicketDetailsScreen(
                            ticket: ticket,
                            onCancelled: () {
                              _performCancellation(ticket.id);
                            },
                          ),
                        ),
                      );
                    },
                    child: TicketHistoryCard(
                      ticket: ticket,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    final isSelected = _selectedFilter == status;
    final count = allTickets.where((t) => status == "All" || t.status == status).length;

    return ChoiceChip(
      label: Text("$status ($count)"),
      selected: isSelected,
      onSelected: (selected) {
        setState(() => _selectedFilter = status);
        _filterTickets();
      },
      selectedColor: _getStatusColor(status),
      backgroundColor: Colors.grey.shade200,
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : Colors.black87,
        fontWeight: FontWeight.w500,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}