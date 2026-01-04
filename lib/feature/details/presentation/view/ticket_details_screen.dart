import 'package:flutter/material.dart';
import 'package:ticket_system/feature/dashboard/presentation/view/dashboard_screen.dart';
import 'package:ticket_system/feature/details/presentation/view/buy_ticket_screen.dart';

import '../../../../core/constant/app_color.dart';
import '../../data/model/ticket_details.dart';
import '../widget/ticket_details_widget.dart';

class TicketDetailsScreen extends StatelessWidget {
  final TicketDetails ticket;

  const TicketDetailsScreen({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text("${ticket.busName}",style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// BUS IMAGE
              busImage(),
              /// BUS INFO
              infoCard(
                title: "Bus / Operator Info",
                children: [
                  infoRow("Bus Name", ticket.busName),
                  infoRow("Bus Type", ticket.busType),
                  infoRow("Bus Number", ticket.busNumber),
                ],
              ),
              /// JOURNEY DETAILS
              infoCard(
                title: "Journey Details",
                children: [
                  infoRow("Departure Time", ticket.departureTime),
                  infoRow("Arrival Time", ticket.arrivalTime),
                  infoRow("Duration", ticket.duration),
                  infoRow("Boarding Point", ticket.boardingPoint),
                  infoRow("Dropping Point", ticket.droppingPoint),
                  infoRow("Ticket Price", ticket.ticketPrice),
                ],
              ),
              /// MAP
              mapSection(),
              const SizedBox(height: 10),
              /// Button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=> BuyTicketScreen(ticket: ticket)));
                    },
                    child: Container(
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Next",style: TextStyle(fontSize: 20,color: Colors.white),),
                          Icon(Icons.arrow_circle_right_outlined,color: Colors.white,)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

