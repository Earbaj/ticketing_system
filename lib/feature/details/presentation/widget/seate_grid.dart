import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

  // @override
  // Widget build(BuildContext context) {
  //   return GridView.builder(
  //     shrinkWrap: true,
  //     physics: const NeverScrollableScrollPhysics(),
  //     padding: const EdgeInsets.all(16),
  //     itemCount: seats.length,
  //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //       crossAxisCount: 4,
  //       crossAxisSpacing: 12,
  //       mainAxisSpacing: 12,
  //     ),
  //     itemBuilder: (context, index) {
  //       final seat = seats[index];
  //       final isSelected = selectedSeats.contains(seat.seatNumber);
  //
  //       Color color;
  //       if (!seat.isAvailable) {
  //         color = Colors.black12;
  //       } else if (isSelected) {
  //         color = const Color(0xFFffe696e);
  //       } else {
  //         color = Colors.black;
  //       }
  //
  //       return GestureDetector(
  //         onTap: seat.isAvailable ? () => onSeatTap(seat.seatNumber) : null,
  //         child: Container(
  //           alignment: Alignment.center,
  //           decoration: BoxDecoration(
  //             color: color,
  //             borderRadius: BorderRadius.circular(8),
  //           ),
  //           child: Text(
  //             seat.seatNumber,
  //             style: TextStyle(
  //               color: seat.isAvailable ? Colors.white : Colors.black45,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Driver section
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// Entry/exit area (optional)
            SizedBox(width: 2,),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 4),
              padding: const EdgeInsets.all(5),
              height: 40,
              width: 50,
              color: Colors.brown,
              child: const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.exit_to_app,color: Colors.white,size: 30,),
                  ],
                ),
              ),
            ),
            SizedBox(width: 2,),
            ///Driver
            Container(
              height: 40,
              width: 40,
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.all(5),
              color: Colors.blueGrey,
              child: Center(
                child: Icon(
                    TablerIcons.steering_wheel,color: Colors.white,size: 30,
                ),
              ),
            ),
            SizedBox(width: 2,),
          ],
        ),

        // Seats
        Column(
          children: List.generate(seats.length ~/ 4, (rowIndex) {
            final startIndex = rowIndex * 4;
            final rowSeats = seats.sublist(startIndex, startIndex + 4);

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Left 2 seats
                  for (int i = 0; i < 2; i++) seatWidget(rowSeats[i]),

                  // Vertical dashed aisle
                  Container(
                    width: 16,
                    height: 50,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(8, (index) {
                            return Container(
                              width: 2,
                              height: constraints.maxHeight / 16,
                              color: Colors.grey,
                            );
                          }),
                        );
                      },
                    ),
                  ),

                  // Right 2 seats
                  for (int i = 2; i < 4; i++) seatWidget(rowSeats[i]),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget seatWidget(Seat seat) {
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
        margin: const EdgeInsets.all(4),
        width: 50,
        height: 50,
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
  }
}
