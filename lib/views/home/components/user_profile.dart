import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return profileCard();
  }
}

Widget profileCard() {
  return Material(
    elevation: 1,
    borderRadius: BorderRadius.circular(8.0),
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.deepOrange),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                  ),
                ],
                borderRadius: BorderRadius.circular(60),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.asset(
                    'assets/images/manicon.png',
                    fit: BoxFit.cover),
              ),
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('HR Manager Emp',
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 5,
                ),
                Text('Admin & HR',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                        fontWeight: FontWeight.w400)),
              ],
            ),
          ],
        ),
        Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text( 'Employee ID : 1234567890', style: GoogleFonts.lato())),
        Padding(
            padding: const EdgeInsets.only(left: 10, top: 5,bottom: 10),
            child: Text('Email :hr_emp@gmail.com', style: GoogleFonts.lato())),
      ],
    ),
  );
}
