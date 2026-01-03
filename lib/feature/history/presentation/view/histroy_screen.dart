import 'package:flutter/material.dart';

import '../../data/model/ticket_history_model.dart';
import '../widget/ticket_history_card.dart';

class HistroyScreen extends StatelessWidget {
  HistroyScreen({super.key});

  final List<TicketHistory> tickets = [
    TicketHistory(
      busName: "BUS 1",
      route: "Dhaka → Chittagong",
      date: "25 Jan 2025",
      time: "10:30 PM",
      seat: "A1, A2",
      price: "৳1700",
      status: "Completed",
    ),
    TicketHistory(
      busName: "BUS 2",
      route: "Dhaka → Sylhet",
      date: "20 Jan 2025",
      time: "9:00 PM",
      seat: "B3",
      price: "৳850",
      status: "Completed",
    ),
    TicketHistory(
      busName: "BUS 3",
      route: "Dhaka → Rajshahi",
      date: "15 Jan 2025",
      time: "8:00 PM",
      seat: "C1",
      price: "৳750",
      status: "Cancelled",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Purchased Tickets",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: const Color(0xFFffe696e),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
        itemCount: tickets.length,
        itemBuilder: (context, index) {
          return TicketHistoryCard(ticket: tickets[index]);
        },
      ),
    );
  }
}

