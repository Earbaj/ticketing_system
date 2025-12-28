class TicketDetails {
  final String busName;
  final String busType;
  final String busNumber;

  final String departureTime;
  final String arrivalTime;
  final String duration;
  final String departureDate;

  final String boardingPoint;
  final String droppingPoint;

  final String ticketPrice;

  TicketDetails({
    required this.busName,
    required this.busType,
    required this.busNumber,
    required this.departureTime,
    required this.arrivalTime,
    required this.duration,
    required this.departureDate,
    required this.boardingPoint,
    required this.droppingPoint,
    required this.ticketPrice,
  });
}
