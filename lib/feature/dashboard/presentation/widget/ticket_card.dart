import 'package:flutter/material.dart';

import '../../../../core/constant/app_color.dart';

class TicketCard extends StatelessWidget {
  final String busName;
  const TicketCard({super.key, required this.busName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColor.primaryColor
        // gradient: const LinearGradient(
        //   colors: [
        //     // Color(0xFF1E1E2C),
        //     // Color(0xFF2A2A3C),
        //     Color(0xFFffe696e),
        //     Color(0xFFffe696e)
        //   ],
        //   begin: Alignment.topLeft,
        //   end: Alignment.bottomRight,
        // ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Top Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$busName",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Fastest',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          /// Time Row
          Row(
            children: [
              _timeColumn('10:15 PM', '20 Jan'),
              SizedBox(width: 10,),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: List.generate(
                        15,
                            (index) => Expanded(
                          child: index == 0 || index == 15-1 ?Container(
                            height: 10,
                            width: 10,
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)
                            ),
                            child: Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                  color: Colors.black45,
                                  borderRadius: BorderRadius.circular(30)
                              ),
                            ),
                          ):Container(
                            height: 2,
                            margin: const EdgeInsets.symmetric(horizontal: 2),
                            color: index == 7
                                ? Colors.black
                                : Colors.black26,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Icon(
                      Icons.bus_alert,
                      color: Colors.black,
                      size: 18,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10,),
              _timeColumn('11:20 PM', '20 Jan', alignEnd: true),
            ],
          ),

          const SizedBox(height: 16),
          const Divider(color: Colors.white54),

          /// Bottom Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Ticket price',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                '\$540',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _timeColumn(String time, String date,
      {bool alignEnd = false}) {
    return Column(
      crossAxisAlignment:
      alignEnd ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(
          time,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          date,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
