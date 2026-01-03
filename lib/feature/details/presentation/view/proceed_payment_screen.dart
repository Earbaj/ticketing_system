import 'package:flutter/material.dart';

import '../../../../core/constant/app_color.dart';
import '../widget/ticket_details_widget.dart';

class ProceedPaymentScreen extends StatefulWidget {
  final String busName;
  final List<String> seats; // Selected seats

  const ProceedPaymentScreen({super.key, required this.busName, required this.seats});

  @override
  State<ProceedPaymentScreen> createState() => _ProceedPaymentScreenState();
}

class _ProceedPaymentScreenState extends State<ProceedPaymentScreen> {
  final _formKey = GlobalKey<FormState>();

  // Passenger info controllers
  final nameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final ageCtrl = TextEditingController();

  String gender = 'Male';
  String paymentMethod = 'Bkash';
  final txnIdCtrl = TextEditingController();
  DateTime? paymentDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text("${widget.busName}",style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// Ticket Card
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Bus Info
                    Text(
                      widget.busName,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Seats: ${widget.seats.join(', ')}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const Divider(height: 24, thickness: 1),

                    /// Passenger Information
                    const Text(
                      'Passenger Information',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          _buildTextField('Full Name', nameCtrl, TextInputType.name),
                          _buildTextField('Phone Number', phoneCtrl, TextInputType.phone),
                          _buildTextField('Email (optional)', emailCtrl, TextInputType.emailAddress),
                          _buildTextField('Age', ageCtrl, TextInputType.number),
                          const SizedBox(height: 8),
                          DropdownButtonFormField<String>(
                            value: gender,
                            decoration: _inputDecoration('Gender'),
                            items: ['Male', 'Female', 'Other']
                                .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                                .toList(),
                            onChanged: (val) {
                              if (val != null) setState(() => gender = val);
                            },
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 24, thickness: 1),

                    /// Payment Information
                    const Text(
                      'Payment Information',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: paymentMethod,
                      decoration: _inputDecoration('Payment Method'),
                      items: ['Bkash', 'Card', 'Cash']
                          .map((m) => DropdownMenuItem(value: m, child: Text(m)))
                          .toList(),
                      onChanged: (val) {
                        if (val != null) setState(() => paymentMethod = val);
                      },
                    ),
                    const SizedBox(height: 8),
                    _buildTextField('Transaction ID', txnIdCtrl, TextInputType.text),
                    const SizedBox(height: 8),
                    InkWell(
                      onTap: () async {
                        DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2100),
                        );
                        if (picked != null) setState(() => paymentDate = picked);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          paymentDate == null
                              ? 'Select Payment Date'
                              : 'Payment Date: ${paymentDate!.toLocal().toString().split(' ')[0]}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: GestureDetector(
                  onTap: _submit,
                  child: Container(
                    height: 50,
                    width: 220,
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Text(
                        "Confirm & Pay",
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

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController ctrl, TextInputType type) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: ctrl,
        keyboardType: type,
        decoration: _inputDecoration(label),
        validator: (val) {
          if ((val == null || val.isEmpty) && !label.toLowerCase().contains('optional')) {
            return '$label is required';
          }
          return null;
        },
      ),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final passengerData = {
        'name': nameCtrl.text,
        'phone': phoneCtrl.text,
        'email': emailCtrl.text,
        'gender': gender,
        'age': ageCtrl.text,
        'paymentMethod': paymentMethod,
        'transactionId': txnIdCtrl.text,
        'paymentDate': paymentDate?.toString(),
        'seats': widget.seats,
        'busName': widget.busName,
      };

      debugPrint('Ticket Info: $passengerData');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ticket Confirmed')),
      );
    }
  }
}
