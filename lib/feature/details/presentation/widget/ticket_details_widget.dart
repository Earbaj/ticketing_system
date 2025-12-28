

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Widget header(BuildContext context, String title) {
  return Container(
    height: 70,
    padding: const EdgeInsets.symmetric(horizontal: 15),
    decoration: const BoxDecoration(
        color: Color(0xFFffe696e)
    ),
    child: Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        const SizedBox(width: 60),
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}

Widget busImage() {
  return Padding(
    padding: const EdgeInsets.all(25),
    child: Container(
      height: 200,
      width: 360,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Color(0xFFffe696e)),
      ),
      child: Image.asset("assets/images/bus_image.png", fit: BoxFit.cover),
    ),
  );
}

Widget infoCard({
  required String title,
  required List<Widget> children,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
          color: Color(0xFFffe696e)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),
          const Divider(),
          ...children,
        ],
      ),
    ),
  );
}

Widget infoRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Colors.white)),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
                color: Colors.white
            ),
          ),
        ),
      ],
    ),
  );
}

Widget mapSection() {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black26),
      ),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(23.8103, 90.4125), // Dhaka default
              zoom: 12,
            ),
            markers: {
              const Marker(
                markerId: MarkerId("start"),
                position: LatLng(23.8103, 90.4125),
                infoWindow: InfoWindow(title: "Start Point"),
              ),
              const Marker(
                markerId: MarkerId("end"),
                position: LatLng(23.7500, 90.3900),
                infoWindow: InfoWindow(title: "Destination"),
              ),
            },
          ),
        ),
      ),
    ),
  );
}
