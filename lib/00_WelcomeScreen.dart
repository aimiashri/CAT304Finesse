import 'package:flutter/material.dart';
import 'package:final_finesse/02_signUpScreen.dart';
import '01_loginScreen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xFF896CFE),
          Color(0xFFE2F163),
        ])),
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.only(top: 50, left: 50, right: 60, bottom: 5),
            child: Image(image: AssetImage("assets/img/logo_finesse.png")),
          ),
          const SizedBox(
            height: 100,
          ),
          const Text(
            'Start your Workout Journey Now',
            style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black),
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const loginScreen()));
            },
            child: Container(
              height: 53,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.black),
              ),
              child: const Center(
                child: Text(
                  'SIGN IN',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignupScreen()));
            },
            child: Container(
              height: 53,
              width: 200,
              decoration: BoxDecoration(
                color: Color(0xFFB3A0FF),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.black),
              ),
              child: const Center(
                child: Text(
                  'SIGN UP',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
          ),
          const Spacer(),
          //  const Text('Login with Social Media',style: TextStyle(
          //      fontSize: 17,
          //      color: Colors.white
          //  ),),//
          // const SizedBox(height: 12,),
          //  const Image(image: AssetImage('assets/social.png'))
        ]),
      ),
    );
  }
}
