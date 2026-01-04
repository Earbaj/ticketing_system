import 'package:flutter/material.dart';

import '../../../../core/constant/app_color.dart';

class SummaryCard extends StatelessWidget {
  final Set<String> selectedSeats;
  final double seatPrice;
  final double serviceFee;
  final double discount;

  const SummaryCard({
    super.key,
    required this.selectedSeats,
    required this.seatPrice,
    required this.serviceFee,
    required this.discount,
  });

  double get totalPrice =>
      (selectedSeats.length * seatPrice) + serviceFee - discount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _row("Seat Numbers", selectedSeats.join(', ')),
            _row("Seat Type", "AC Seater"),
            _row("Total Seats", selectedSeats.length.toString()),
            const Divider(color: Colors.white70,),
            _row("Price / Seat", "৳$seatPrice"),
            _row("Service Fee", "৳$serviceFee"),
            _row("Discount", "৳$discount"),
            const Divider(color: Colors.white70,),
            _row("Total Payable", "৳$totalPrice", bold: true),
          ],
        ),
      ),
    );
  }

  Widget _row(String title, String value, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.white)),
          Text(
            value.isEmpty ? "-" : value,
            style: TextStyle(
              fontWeight: bold ? FontWeight.bold : FontWeight.w600,color: Colors.white
            ),
          ),
        ],
      ),
    );
  }
}
