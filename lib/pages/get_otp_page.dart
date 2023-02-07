import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';

//import 'package:pin_code_fields/pin_code_fields.dart';
//import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pinput/pinput.dart';

class GetOTPPage extends StatelessWidget {
  const GetOTPPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      appBar: AppBar(


        backgroundColor: PRIMARY_COLOR,
        leading: Icon(Icons.chevron_left,
        size: MARGIN_XLARGE,)

      ),

      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                child: Image.asset('assets/images/logo.png'),
              ),
              const Text("We've sent OTP Code",
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 22,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500)),
              SizedBox(
                height: 10,
              ),
              const Text(
                  "Please enter 6-digit OTP code \nthat sent to your phone number.",
                  style: TextStyle(
                      color: Color.fromRGBO(136, 136, 136, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w400)),
              SizedBox(
                height: MARGIN_XXLARGE,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 33, right: 33),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Enter OTP Code",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Color.fromRGBO(136, 136, 136, 1),
                                fontSize: 12,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MARGIN_MEDIUM,
              ),
              PinCodeTextSection(),
              SizedBox(
                height: MARGIN_XXLARGE,
              ),
              RichText(
                text: const TextSpan(
                    text: "Don't receive OTP?",
                    style: TextStyle(
                       color: Color.fromRGBO(136, 136, 136, 1), fontSize: 14,
                    fontWeight: FontWeight.w400),
                    children: <TextSpan>[
                      TextSpan(
                        text: "  Resend Code",
                        style: TextStyle(
                            color: SECONDARY_COLOR, fontSize: 14,
                            fontWeight: FontWeight.w400))
                    ])
              ),
              // const Text("Don't receive OTP?Resend Code.",
              //     style: TextStyle(
              //         color: Color.fromRGBO(136, 136, 136, 1),
              //         fontSize: 14,
              //         fontWeight: FontWeight.w400)),
              SizedBox(
                height: MARGIN_XXLARGE,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: MARGIN_LARGE, right: MARGIN_LARGE),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: SECONDARY_COLOR,
                      minimumSize: const Size.fromHeight(49)),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    child: Text(
                      "Comfirm OTP",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  onPressed: () {
                    print("Verify Your Phone Number");
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class OTPSection extends StatefulWidget {
//   @override
//   State<OTPSection> createState() => _OTPSectionState();
// }

// class _OTPSectionState extends State<OTPSection> {
//   // 4 text editing controllers that associate with the 4 input fields
//   final TextEditingController _fieldOne = TextEditingController();
//
//   final TextEditingController _fieldTwo = TextEditingController();
//
//   final TextEditingController _fieldThree = TextEditingController();
//
//   final TextEditingController _fieldFour = TextEditingController();
//
//   // This is the entered code
//   String? _otp;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('KindaCode'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Text('Phone Number Verification'),
//           const SizedBox(
//             height: 30,
//           ),
//           // Implement 4 input fields
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               OtpInput(_fieldOne, true), // auto focus
//               OtpInput(_fieldTwo, false),
//               OtpInput(_fieldThree, false),
//               OtpInput(_fieldFour, false)
//             ],
//           ),
//           const SizedBox(
//             height: 30,
//           ),
//           ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   _otp = _fieldOne.text +
//                       _fieldTwo.text +
//                       _fieldThree.text +
//                       _fieldFour.text;
//                 });
//               },
//               child: const Text('Submit')),
//           const SizedBox(
//             height: 30,
//           ),
//           // Display the entered OTP code
//           Text(
//             _otp ?? 'Please enter OTP',
//             style: const TextStyle(fontSize: 30),
//           )
//         ],
//       ),
//     );
//   }
// }

class PinCodeTextSection extends StatelessWidget {
  const PinCodeTextSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 50,
      textStyle: TextStyle(
          fontSize: 14,
          color: Color.fromRGBO(74, 74, 75, 1),
          fontWeight: FontWeight.w500),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(6),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.white),
      borderRadius: BorderRadius.circular(6),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    return Pinput(
      length: 6,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      validator: (s) {
        return s == '2222' ? null : 'Pin is incorrect';
      },
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onCompleted: (pin) => print(pin),
    );
  }

}
