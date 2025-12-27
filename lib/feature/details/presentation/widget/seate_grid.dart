import 'package:flutter/material.dart';

import '../../data/model/seat_model.dart';

class SeatGrid extends StatelessWidget {
  final List<Seat> seats;
  final Set<String> selectedSeats;
  final Function(String) onSeatTap;

  const SeatGrid({
    super.key,
    required this.seats,
    required this.selectedSeats,
    required this.onSeatTap,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      itemCount: seats.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (context, index) {
        final seat = seats[index];
        final isSelected = selectedSeats.contains(seat.seatNumber);

        Color color;
        if (!seat.isAvailable) {
          color = Colors.black12;
        } else if (isSelected) {
          color = const Color(0xFFffe696e);
        } else {
          color = Colors.black;
        }

        return GestureDetector(
          onTap: seat.isAvailable ? () => onSeatTap(seat.seatNumber) : null,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              seat.seatNumber,
              style: TextStyle(
                color: seat.isAvailable ? Colors.white : Colors.black45,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
