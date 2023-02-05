import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/colors.dart';

class GetOTPPage extends StatelessWidget {
  const GetOTPPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        leading: Icon(
          Icons.chevron_left,
          size: 32,
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Image.asset('assets/images/logo.png'),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "We've sent OTP Code",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold)),
              const Text(
                  "Please enter 6-digit OTP code \n that sent to your phone number.",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10)
            ),
            SizedBox(height: 30,),
            const Text(
                "Enter OTP Code",
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
