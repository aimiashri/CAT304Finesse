import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '34_appointmentdone.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class FitnessAppointmentBooking extends StatefulWidget {
  final String trainerName;

  FitnessAppointmentBooking({required this.trainerName});

  @override
  _FitnessAppointmentBookingState createState() => _FitnessAppointmentBookingState();
}

class _FitnessAppointmentBookingState extends State<FitnessAppointmentBooking> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _dateController = TextEditingController();
  final _notesController = TextEditingController();
  final _trainerNameController = TextEditingController();
  String _selectedTime = '10:00 AM';

  @override
  void initState() {
    super.initState();
    _trainerNameController.text = widget.trainerName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Appointment', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.yellow),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTextField('Name', _nameController, 'Please enter your name'),
                buildTextField('Email', _emailController, 'Please enter your email'),
                buildTextField('Mobile Number', _mobileController, 'Please enter your mobile number'),
                buildDateField('Date', _dateController, 'Please enter the date'),
                SizedBox(height: 16),
                Text('Select Time', style: TextStyle(color: Colors.white, fontSize: 16)),
                Wrap(
                  spacing: 8,
                  children: ['9:00 AM', '10:00 AM', '11:00 AM', '3:00 PM', '4:00 PM', '5:00 PM', '6:00 PM', '7:00 PM', '8:00 PM']
                      .map((time) => ChoiceChip(
                            label: Text(time),
                            selected: _selectedTime == time,
                            onSelected: (selected) {
                              setState(() {
                                _selectedTime = time;
                              });
                            },
                            selectedColor: const Color(0xFF896CFE),
                            backgroundColor: Colors.grey.shade800,
                            labelStyle: TextStyle(color: Colors.white),
                          ))
                      .toList(),
                ),
                SizedBox(height: 16),
                buildNotesField('Additional Notes (optional)', _notesController),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF896CFE),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _showConfirmationDialog();
                      }
                    },
                    child: Text('Confirm', style: TextStyle(fontSize: 18, color: Colors.black)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.fitness_center), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.event_note), label: ''),
        ],
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller, String validationMessage) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.yellow),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return validationMessage;
          }
          return null;
        },
      ),
    );
  }

  Widget buildDateField(String label, TextEditingController controller, String validationMessage) {
    return TextFormField(
      controller: controller,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.yellow),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validationMessage;
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
            controller.text = DateFormat('dd/MM/yyyy').format(pickedDate);
          });
        }
      },
    );
  }

  Widget buildNotesField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      maxLines: 3,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.yellow),
          borderRadius: BorderRadius.circular(10),
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
          titleTextStyle: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          content: Text('Trainer: ${_trainerNameController.text}\nName: ${_nameController.text}\nEmail: ${_emailController.text}\nMobile: ${_mobileController.text}\nDate: ${_dateController.text}\nTime: $_selectedTime\nNotes: ${_notesController.text}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Firebase.initializeApp();
                final databaseReference = FirebaseDatabase.instance.ref();
                databaseReference.child('appointments').child(_nameController.text).set({
                  'trainer': _trainerNameController.text,
                  'name': _nameController.text,
                  'email': _emailController.text,
                  'mobile': _mobileController.text,
                  'date': _dateController.text,
                  'time': _selectedTime,
                  'notes': _notesController.text,
                });

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