import 'package:flutter/material.dart';

import '../../data/model/ticket_history_model.dart';

class TicketHistoryCard extends StatelessWidget {
  final TicketHistory ticket;

  const TicketHistoryCard({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    final isCancelled = ticket.status == "Cancelled";

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFffe696e),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔹 Bus name & status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ticket.busName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  ticket.status,
                  style: TextStyle(
                    fontSize: 12,
                    color: isCancelled ? Colors.red : Colors.green,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),

          const SizedBox(height: 6),
          Text(ticket.route, style: TextStyle(color: Colors.white)),

          const Divider(height: 20),

          /// 🔹 Details
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _info("Date", ticket.date),
              _info("Time", ticket.time),
              _info("Seat", ticket.seat),
            ],
          ),

          const SizedBox(height: 12),

          /// 🔹 Price
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              ticket.price,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _info(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 12, color: Colors.white)),
        const SizedBox(height: 2),
        Text(value, style: const TextStyle(fontWeight: FontWeight.w600,color: Colors.white)),
      ],
    );
  }
}
