import 'package:flutter/material.dart';
import 'package:ticket_system/feature/dashboard/presentation/view/dashboard_screen.dart';

import '../../data/model/seat_model.dart';
import '../../data/model/ticket_details.dart';
import '../widget/date_selector.dart';
import '../widget/seate_grid.dart';
import '../widget/summary_card.dart';
import '../widget/ticket_details_widget.dart';

class BuyTicketScreen extends StatefulWidget {
  final TicketDetails ticket;

  const BuyTicketScreen({super.key, required this.ticket});

  @override
  State<BuyTicketScreen> createState() => _BuyTicketScreenState();
}

class _BuyTicketScreenState extends State<BuyTicketScreen> {

  final double seatPrice = 800;
  final double serviceFee = 50;
  final double discount = 0;

  late List<Seat> seats;
  final Set<String> selectedSeats = {};
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now(); // ✅ initialize first
    seats = _generateSeats();      // ✅ now safe
  }

  List<Seat> _generateSeats() {
    final seatList = <Seat>[];
    const rows = ['A', 'B', 'C', 'D', 'E', 'F', 'G'];

    // ❗ Past & beyond 5 days → all unavailable
    if (isPastDate(selectedDate) || !isWithinNextFiveDays(selectedDate)) {
      return rows.expand((row) {
        return List.generate(4, (i) {
          return Seat(
            seatNumber: '$row${i + 1}',
            isAvailable: false,
          );
        });
      }).toList();
    }

    // Today → +5 days (random availability)
    for (var row in rows) {
      for (int i = 0; i < 4; i++) {
        final isAvailable = (row.codeUnitAt(0) + i) % 3 != 0;

        seatList.add(
          Seat(
            seatNumber: '$row${i + 1}',
            isAvailable: isAvailable,
          ),
        );
      }
    }

    return seatList;
  }

  double get totalPrice =>
      (selectedSeats.length * seatPrice) + serviceFee - discount;


  bool isPastDate(DateTime date) {
    final today = DateTime.now();
    return date.isBefore(DateTime(today.year, today.month, today.day));
  }

  bool isWithinNextFiveDays(DateTime date) {
    final today = DateTime.now();
    final diff = date.difference(
      DateTime(today.year, today.month, today.day),
    ).inDays;

    return diff >= 0 && diff <= 5;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              header(context, widget.ticket.busName),

              const SizedBox(height: 16),

              /// DATE FILTER
              DateSelector(
                selectedDate: selectedDate,
                onDateSelected: (date) {
                  setState(() {
                    selectedDate = date;
                    selectedSeats.clear();
                    seats = _generateSeats();
                  });
                },
              ),
              const SizedBox(height: 10),

              /// SEAT MAP
              SeatGrid(
                seats: seats,
                selectedSeats: selectedSeats,
                onSeatTap: (seat) {
                  setState(() {
                    selectedSeats.contains(seat)
                        ? selectedSeats.remove(seat)
                        : selectedSeats.add(seat);
                  });
                },
              ),

              /// SUMMARY
              SummaryCard(
                selectedSeats: selectedSeats,
                seatPrice: seatPrice,
                serviceFee: serviceFee,
                discount: discount,
              ),

              /// BUY BUTTON
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: GestureDetector(
                  onTap: selectedSeats.isEmpty ? null : () {},
                  child: Container(
                    height: 50,
                    width: 220,
                    decoration: BoxDecoration(
                      color: selectedSeats.isEmpty
                          ? Colors.grey
                          : const Color(0xFFffe696e),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Text(
                        "Proceed to Pay",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}


