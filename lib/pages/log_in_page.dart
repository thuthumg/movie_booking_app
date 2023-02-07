import 'package:flutter/material.dart';
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
              SizedBox(
                height: MediaQuery.of(context).size.height/3,
                child: Image.asset('assets/images/logo.png'),
              ),
              const Text("Verify Your Phone Number",
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 22,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500)),
              SizedBox(
                height: 10,
              ),
              const Text(
                  "We will sent 6-digit sms code \n to verify your phone number",
                  style: TextStyle(
                      color: Color.fromRGBO(136, 136, 136, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w400)),
              SizedBox(
                height: 80,
              ),
              const CountryCodeSection(),
              const VerifyYourPhoneNoButton(),
              SizedBox(
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

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(31),
        child:
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            minimumSize: const Size.fromHeight(49)
          ),
            onPressed: () {},
            icon: const ImageIcon(AssetImage('assets/images/ic_google.png'),
            color: Colors.black,),
            label: const Text(
              "Continue With Google",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ))
        // ElevatedButton(
        //
        //   style: ElevatedButton.styleFrom(
        //       primary: Colors.white, minimumSize: const Size.fromHeight(49)),
        //   child: const Padding(
        //     padding: EdgeInsets.only(top: 15, bottom: 15),
        //     child: Text(
        //
        //       "Continue With Google",
        //       style: TextStyle(
        //         color: Colors.black,
        //         fontSize: 16,
        //         fontWeight: FontWeight.w400,
        //       ),
        //     ),
        //   ),
        //   onPressed: () {
        //     print("Verify Your Phone Number");
        //   },
        // ),
        );
  }
}

class CountryCodeSection extends StatelessWidget {
  const CountryCodeSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 33, right: 33),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("Country Code",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Color.fromRGBO(136, 136, 136, 1),
                      fontSize: 12,
                      fontWeight: FontWeight.w400)),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CountryCodeDropdown(),

              const Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Mobile number",
                        hintStyle:
                            TextStyle(color: Color.fromRGBO(136, 136, 136, 1))),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
              // TextField(
              //   decoration: InputDecoration(
              //       filled: true,
              //       fillColor: Color.fromRGBO(255, 255, 255, 1.0),
              //       hintText: "Mobile number",
              //       hintStyle:
              //       TextStyle(color: Color.fromRGBO(136, 136, 136, 1))),
              //   style: TextStyle(color: Colors.white),
              // )
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
          print("Verify Your Phone Number");
        },
      ),
    );
  }
}

class CountryCodeDropdown extends StatefulWidget {
  @override
  _CountryCodeDropdownState createState() => _CountryCodeDropdownState();
}

class _CountryCodeDropdownState extends State<CountryCodeDropdown> {
  String _selectedCountryCode = '+1';

  List<String> _countryCodes = ['+1', '+44', '+33', '+81', '+86', '+95'];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _selectedCountryCode,
      dropdownColor: PRIMARY_COLOR,
      icon: Icon(
        Icons.keyboard_arrow_down_sharp,
        color: Colors.white, // <-- SEE HERE
      ),
      onChanged: (newValue) {
        setState(() {
          _selectedCountryCode = newValue ?? "";
        });
      },
      items: _countryCodes.map((countryCode) {
        return DropdownMenuItem<String>(
          value: countryCode,
          child: Text(countryCode,
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.w400)),
        );
      }).toList(),
    );
  }
}
// class CountryCodeDropDown extends StatelessWidget {
//   const CountryCodeDropDown({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton(items: items, onChanged: onChanged);
//   }
// }
