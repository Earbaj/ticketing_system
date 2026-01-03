import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constant/app_color.dart';
import '../../data/model/ticket_history_model.dart';

class HistoryTicketDetailsScreen extends StatefulWidget {
  final TicketHistory ticket;
  final VoidCallback? onCancelled;

  const HistoryTicketDetailsScreen({
    Key? key,
    required this.ticket,
    this.onCancelled,
  }) : super(key: key);

  @override
  State<HistoryTicketDetailsScreen> createState() => _HistoryTicketDetailsScreenState();
}

class _HistoryTicketDetailsScreenState extends State<HistoryTicketDetailsScreen> {
  late GoogleMapController _mapController;
  final Set<Marker> _markers = {};
  final Set<Polyline> _polylines = {};

  @override
  void initState() {
    super.initState();
    _initializeMap();
  }

  void _initializeMap() {
    final departureMarker = Marker(
      markerId: MarkerId('departure'),
      position: LatLng(widget.ticket.departureLat, widget.ticket.departureLng),
      infoWindow: InfoWindow(
        title: 'Departure: ${widget.ticket.departurePoint}',
        snippet: '${widget.ticket.date} ${widget.ticket.time}',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    );

    final arrivalMarker = Marker(
      markerId: MarkerId('arrival'),
      position: LatLng(widget.ticket.arrivalLat, widget.ticket.arrivalLng),
      infoWindow: InfoWindow(
        title: 'Arrival: ${widget.ticket.arrivalPoint}',
        snippet: widget.ticket.duration,
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );

    _markers.addAll([departureMarker, arrivalMarker]);

    // Add polyline between points
    _polylines.add(Polyline(
      polylineId: PolylineId('route'),
      color: Color(0xFFffe696e),
      width: 4,
      points: [
        LatLng(widget.ticket.departureLat, widget.ticket.departureLng),
        LatLng(widget.ticket.arrivalLat, widget.ticket.arrivalLng),
      ],
    ));
  }

  Future<void> _openGoogleMapsDirections() async {
    final url = Uri.parse(
      'https://www.google.com/maps/dir/?api=1'
          '&origin=${widget.ticket.departureLat},${widget.ticket.departureLng}'
          '&destination=${widget.ticket.arrivalLat},${widget.ticket.arrivalLng}'
          '&travelmode=driving',
    );

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not open Google Maps')),
      );
    }
  }

  void _cancelTicket() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Cancel Ticket"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Are you sure you want to cancel this ticket?"),
            SizedBox(height: 10),
            Text("Ticket: ${widget.ticket.busName}"),
            Text("Route: ${widget.ticket.route}"),
            Text("Date: ${widget.ticket.date} ${widget.ticket.time}"),
            SizedBox(height: 10),
            Text(
              "Refund Amount: ৳${widget.ticket.refundAmount.toStringAsFixed(2)}",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Refund will be processed within 3-5 business days",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("No, Keep Ticket"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              widget.onCancelled?.call();
              Navigator.pop(context); // Go back to history screen
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: Text("Yes, Cancel Ticket"),
          ),
        ],
      ),
    );
  }

  void _downloadTicket() {
    // Implement ticket download logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Ticket downloaded successfully!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: (){Navigator.pop(context);},
        ),
        title: Text("Ticket Details",style: TextStyle(color: Colors.white,),),
        backgroundColor: AppColor.primaryColor,
        actions: [
            IconButton(
              icon: Icon(Icons.cancel_outlined,color: Colors.white,),
              onPressed: _cancelTicket,
              tooltip: "Cancel Ticket",
            ),
          IconButton(
            icon: Icon(Icons.download,color: Colors.white,),
            onPressed: _downloadTicket,
            tooltip: "Download Ticket",
          ),
        ],
      ),
      body: ListView(
        children: [
          // Ticket Summary Card
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.ticket.busName,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: _getStatusColor(widget.ticket.status).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: _getStatusColor(widget.ticket.status),
                        ),
                      ),
                      child: Text(
                        widget.ticket.status,
                        style: TextStyle(
                          color: _getStatusColor(widget.ticket.status),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  widget.ticket.route,
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                ),
                Divider(height: 24),
                _buildDetailRow("Bus Number", widget.ticket.busNumber),
                _buildDetailRow("Bus Type", widget.ticket.busType),
                _buildDetailRow("Departure", "${widget.ticket.date} ${widget.ticket.time}"),
                _buildDetailRow("Duration", widget.ticket.duration),
                _buildDetailRow("Seat Number", widget.ticket.seat),
                _buildDetailRow("Price", widget.ticket.price),
              ],
            ),
          ),

          // Route Map
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                height: 300,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                      (widget.ticket.departureLat + widget.ticket.arrivalLat) / 2,
                      (widget.ticket.departureLng + widget.ticket.arrivalLng) / 2,
                    ),
                    zoom: 7,
                  ),
                  markers: _markers,
                  polylines: _polylines,
                  onMapCreated: (controller) {
                    _mapController = controller;
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ElevatedButton.icon(
              onPressed: _openGoogleMapsDirections,
              icon: Icon(Icons.directions),
              label: Text("Open in Google Maps"),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 48),
              ),
            ),
          ),

          // Amenities
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Amenities",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: widget.ticket.amenities.map((amenity) {
                    return Chip(
                      label: Text(amenity),
                      backgroundColor: Color(0xFFffe696e).withOpacity(0.1),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),

          // Pickup & Drop Points
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Boarding & Dropping Points",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                _buildLocationRow(
                  icon: Icons.location_on,
                  color: Colors.green,
                  title: "Departure Point",
                  subtitle: widget.ticket.departurePoint,
                  time: "${widget.ticket.date} ${widget.ticket.time}",
                ),
                SizedBox(height: 16),
                _buildLocationRow(
                  icon: Icons.location_on,
                  color: Colors.red,
                  title: "Arrival Point",
                  subtitle: widget.ticket.arrivalPoint,
                  time: widget.ticket.duration,
                ),
              ],
            ),
          ),

          // Actions for pending/upcoming tickets
          if (widget.ticket.canCancel)
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: _cancelTicket,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      minimumSize: Size(double.infinity, 48),
                    ),
                    child: Text("Cancel Ticket"),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Cancellation deadline: ${widget.ticket.cancellationDeadline?.toString() ?? 'N/A'}",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

          SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey.shade600)),
          Text(value, style: TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildLocationRow({
    required IconData icon,
    required Color color,
    required String title,
    required String subtitle,
    required String time,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.w600)),
              Text(subtitle, style: TextStyle(color: Colors.grey.shade700)),
              SizedBox(height: 4),
              Text(time, style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
            ],
          ),
        ),
      ],
    );
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
      default:
        return Colors.grey;
    }
  }
}