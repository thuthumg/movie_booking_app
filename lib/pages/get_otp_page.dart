import 'package:flutter/material.dart';
import 'package:movie_booking_app/pages/location_page.dart';
import 'package:movie_booking_app/pages/main_page.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
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
          leading: const Icon(
            Icons.chevron_left,
            size: MARGIN_XLARGE,
          )),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              LogoImageView(),
              SubTitleTextView(),
              SizedBox(
                height: MARGIN_XXLARGE,
              ),
              OTPTextView(),
              SizedBox(
                height: MARGIN_XXLARGE,
              ),
              ResendCodeTextView(),
              SizedBox(
                height: MARGIN_XXLARGE,
              ),
              ConfirmOTPBtnView()
            ],
          ),
        ),
      ),
    );
  }
}

class ConfirmOTPBtnView extends StatelessWidget {
  const ConfirmOTPBtnView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: MARGIN_LARGE, right: MARGIN_LARGE),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: SECONDARY_COLOR, minimumSize: const Size.fromHeight(49)),
        child: const Padding(
          padding: EdgeInsets.only(top: 15, bottom: 15),
          child: Text(
            "Confirm OTP",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        onPressed: () {
          _navigateToLocationPage(context);
        },
      ),
    );
  }
}

class ResendCodeTextView extends StatelessWidget {
  const ResendCodeTextView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        text: "Don't receive OTP?",
        style: TextStyle(
            color: Color.fromRGBO(136, 136, 136, 1),
            fontSize: 14,
            fontWeight: FontWeight.w400),
        children: <TextSpan>[
          TextSpan(
            text: "  Resend Code",
            style: TextStyle(
                color: SECONDARY_COLOR,
                fontSize: 14,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}

class OTPTextView extends StatelessWidget {
  const OTPTextView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 33),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Enter OTP Code",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Color.fromRGBO(136, 136, 136, 1),
                        fontSize: 12,
                        fontWeight: FontWeight.w400)),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: MARGIN_MEDIUM,
        ),
        const PinCodeTextSection(),
      ],
    );
  }
}

class SubTitleTextView extends StatelessWidget {
  const SubTitleTextView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          "We've sent OTP Code",
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontSize: 22,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Please enter 6-digit OTP code \nthat sent to your phone number.",
          style: TextStyle(
              color: Color.fromRGBO(136, 136, 136, 1),
              fontSize: 14,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}

class LogoImageView extends StatelessWidget {
  const LogoImageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: Image.asset('assets/images/logo.png'),
    );
  }
}

class PinCodeTextSection extends StatelessWidget {
  const PinCodeTextSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 50,
      textStyle: const TextStyle(
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
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    return Pinput(
      length: 6,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      validator: (s) {
        return s == '222222' ? null : 'Pin is incorrect';
      },
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onCompleted: (pin) => print(pin),
    );
  }
}

Future<dynamic> _navigateToLocationPage(BuildContext context) {
  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => LocationPage(),
    ),
  );
}
