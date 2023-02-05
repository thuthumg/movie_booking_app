import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Image.asset('assets/images/logo.png'),
            const SizedBox(
              height: 30,
            ),
            const Text(
                "Verify Your Phone Number",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold)),
            const Text(
                "We will sent 6-digit sms code \n to verify your phone number",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10)
            )

          ],
        ),
      ),
    );
  }
}
