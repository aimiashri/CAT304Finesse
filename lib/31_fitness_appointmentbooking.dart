import 'package:final_finesse/10_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '32_appointmentdone.dart';

class FitnessAppointmentBooking extends StatefulWidget {
  @override
  _FitnessAppointmentBookingState createState() =>
      _FitnessAppointmentBookingState();
}

class _FitnessAppointmentBookingState extends State<FitnessAppointmentBooking> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _dateController = TextEditingController();
  final _notesController = TextEditingController();
  String _selectedTime = '9:00 AM';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            InkWell(
                onTap: () {
                  Get.to(() => HomeScreen());
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: Colors.black,
                )),
            Text('Fitness Appointment Booking'),
          ],
        ),
      ),
      body: Container(
        color: Colors.white, // Set background color to white
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _mobileController,
                decoration: InputDecoration(labelText: 'Mobile Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your mobile number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(labelText: 'Date'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the date';
                  }
                  return null;
                },
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _dateController.text =
                          DateFormat('ddMMyyyy').format(pickedDate);
                    });
                  }
                },
              ),
              DropdownButtonFormField<String>(
                value: _selectedTime,
                decoration: InputDecoration(labelText: 'Select Time'),
                items: [
                  '9:00 AM',
                  '10:00 AM',
                  '11:00 AM',
                  '12:00 PM',
                  '1:00 PM',
                  '2:00 PM',
                  '3:00 PM',
                  '4:00 PM',
                  '5:00 PM'
                ]
                    .map((time) => DropdownMenuItem<String>(
                          value: time,
                          child: Text(time),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedTime = value!;
                  });
                },
              ),
              TextFormField(
                controller: _notesController,
                decoration:
                    InputDecoration(labelText: 'Additional Notes (Optional)'),
                maxLines: 3,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _showConfirmationDialog();
                  }
                },
                child: Text('Confirm'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Please Confirm Your Appointment'),
          content: Text(
              'Name: ${_nameController.text}\nEmail: ${_emailController.text}\nMobile: ${_mobileController.text}\nDate: ${_dateController.text}\nTime: $_selectedTime\nNotes: ${_notesController.text}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Navigate to AppointmentDone page
                Navigator.of(context).pop();
                Get.to(() => AppointmentDone());
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
