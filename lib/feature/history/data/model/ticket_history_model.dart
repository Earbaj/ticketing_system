class TicketHistory {
  final String id;
  final String busName;
  final String route;
  final String date;
  final String time;
  final String seat;
  final String price;
  final String status; // "Completed", "Pending", "Cancelled", "Upcoming"
  final String departurePoint;
  final String arrivalPoint;
  final String busNumber;
  final String busType;
  final String duration;
  final DateTime? actualDepartureTime;
  final DateTime? actualArrivalTime;
  final double departureLat;
  final double departureLng;
  final double arrivalLat;
  final double arrivalLng;
  final List<String> amenities;
  final bool isRefundable;
  final DateTime? cancellationDeadline;

  TicketHistory({
    required this.id,
    required this.busName,
    required this.route,
    required this.date,
    required this.time,
    required this.seat,
    required this.price,
    required this.status,
    required this.departurePoint,
    required this.arrivalPoint,
    required this.busNumber,
    required this.busType,
    required this.duration,
    this.actualDepartureTime,
    this.actualArrivalTime,
    required this.departureLat,
    required this.departureLng,
    required this.arrivalLat,
    required this.arrivalLng,
    required this.amenities,
    required this.isRefundable,
    this.cancellationDeadline,
  });

  bool get canCancel {
    if (status == "Cancelled" || status == "Completed") return false;
    if (cancellationDeadline == null) return true;
    return DateTime.now().isBefore(cancellationDeadline!);
  }

  double get refundAmount {
    if (!isRefundable) return 0.0;
    final priceValue = double.tryParse(price.replaceAll('৳', '')) ?? 0;

    if (status == "Pending") {
      return priceValue * 0.9; // 90% refund for pending tickets
    } else if (status == "Upcoming") {
      final hoursUntilDeparture = cancellationDeadline?.difference(DateTime.now()).inHours ?? 0;
      if (hoursUntilDeparture > 24) {
        return priceValue * 0.8; // 80% refund if cancelled 24+ hours before
      } else {
        return priceValue * 0.5; // 50% refund if cancelled within 24 hours
      }
    }
    return 0.0;
  }
}