import 'package:flutter/material.dart';
import 'package:movie_booking_app/pages/get_otp_page.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const LogoImageView(),
              const SubTitleTextView(),
              const SizedBox(
                height: 80,
              ),
              const CountryCodeAndMobileTextFieldView(),
              const VerifyYourPhoneNoButton(),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: MARGIN_LARGE, right: MARGIN_LARGE),
                child: Container(
                  child: Row(
                    children: const [
                      Expanded(
                        flex: 1,
                        child: Divider(color: Colors.white),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MARGIN_MEDIUM_3, right: MARGIN_MEDIUM_3),
                        child: Text(
                          "or",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Expanded(flex: 1, child: Divider(color: Colors.white)),
                    ],
                  ),
                ),
              ),
              const GoogleButton(),
            ],
          ),
        ),
      ),
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
          "Verify Your Phone Number",
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
          "We will sent 6-digit sms code \n to verify your phone number",
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

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(31),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            primary: Colors.white, minimumSize: const Size.fromHeight(49)),
        onPressed: () {
          _navigateToOTPPage(context);
        },
        icon: const ImageIcon(
          AssetImage('assets/images/ic_google.png'),
          color: Colors.black,
        ),
        label: const Text(
          "Continue With Google",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class CountryCodeAndMobileTextFieldView extends StatelessWidget {
  const CountryCodeAndMobileTextFieldView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 33, right: 33),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text("Country Code",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Color.fromRGBO(136, 136, 136, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.w400)),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CountryCodeDropdown(),
              const Expanded(
                flex: 1,
                child: TextField(
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                      ),
                      hintText: "Mobile number",
                      hintStyle:
                          TextStyle(color: Color.fromRGBO(136, 136, 136, 1))),
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class VerifyYourPhoneNoButton extends StatelessWidget {
  const VerifyYourPhoneNoButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(31),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: SECONDARY_COLOR, minimumSize: const Size.fromHeight(49)),
        child: const Padding(
          padding: EdgeInsets.only(top: 15, bottom: 15),
          child: Text(
            "Verify Your Phone Number",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        onPressed: () {
          _navigateToOTPPage(context);
        },
      ),
    );
  }
}

Future<dynamic> _navigateToOTPPage(BuildContext context) {
  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => GetOTPPage(),
    ),
  );
}

class CountryCodeDropdown extends StatefulWidget {
  @override
  _CountryCodeDropdownState createState() => _CountryCodeDropdownState();
}

class _CountryCodeDropdownState extends State<CountryCodeDropdown> {
  String _selectedCountryCode = '+1';

  final List<String> _countryCodes = ['+1', '+44', '+33', '+81', '+86', '+95'];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0, right: 8.0),
      child: DropdownButton<String>(
        value: _selectedCountryCode,
        dropdownColor: PRIMARY_COLOR,
        icon: const Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Icon(
            Icons.keyboard_arrow_down_sharp,
            color: Colors.white, // <-- SEE HERE
          ),
        ),
        onChanged: (newValue) {
          setState(() {
            _selectedCountryCode = newValue ?? "";
          });
        },
        items: _countryCodes.map((countryCode) {
          return DropdownMenuItem<String>(
            value: countryCode,
            child: Text(
              countryCode,
              style: const TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
          );
        }).toList(),
      ),
    );
  }
}
