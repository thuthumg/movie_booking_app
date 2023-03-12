import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_booking_app/pages/get_otp_page.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/resources/strings.dart';
import 'package:movie_booking_app/widgets/custom_button_view.dart';
import 'package:movie_booking_app/widgets/phone_number_text_field_view.dart';

class LoginPage extends StatefulWidget {


  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _enterMobileNoText  = '';
  String _chooseCountryCode  = '';
  void _onClickVerifyBtn(String text){
    setState(() {
      _enterMobileNoText = text;


    });
  }
  void _onTapCountryCode(String text){
    setState(() {
      _chooseCountryCode = text;


    });
  }


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
                height: VERIFITED_YOUR_PH_NO_AND_COUNTRY_CODE_SPACE,
              ),
              CountryCodeAndMobileTextFieldView(onClickVerifyBtn:_onClickVerifyBtn,
                  onTapCountryCode:_onTapCountryCode),
              VerifyYourPhoneNoButton(enterMobileNoText: _enterMobileNoText,countryCode: _chooseCountryCode,),
              const SizedBox(
                height: MARGIN_MEDIUM_1,
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
              GoogleButton(enterMobileNoText: _enterMobileNoText,countryCode: _chooseCountryCode,),
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

  String? enterMobileNoText;
  String? countryCode;

  GoogleButton({
    Key? key,
    required this.enterMobileNoText,
    required this.countryCode
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(31),
      child: CustomButtonView(
          buttonContainerBgColor: Colors.white,
          buttonContainerHeight: LOGIN_PAGE_BUTTON_HEIGHT,
          buttonContainerRadius: BORDER_RADIUS,
          iconPadding: MARGIN_MEDIUM,
          iconWidthHeight: 35,
          textColor: Colors.black,
          textDesc: CONTINUE_WITH_GOOGLE,
          textFontSize: TEXT_REGULAR_2X,
          iconPath: 'assets/images/ic_google.png',
          isShowIcon: true,
          () => _navigateToOTPPage(context,enterMobileNoText,countryCode)),
    );
  }
}

class CountryCodeAndMobileTextFieldView extends StatefulWidget {
  final Function(String) onClickVerifyBtn;
  final Function(String) onTapCountryCode;
  CountryCodeAndMobileTextFieldView(
  {
    Key? key,
    required this.onClickVerifyBtn,
    required this.onTapCountryCode
}
      ): super(key: key);

  @override
  State<CountryCodeAndMobileTextFieldView> createState() => _CountryCodeAndMobileTextFieldViewState(
      this.onClickVerifyBtn,
  this.onTapCountryCode);
}

class _CountryCodeAndMobileTextFieldViewState extends State<CountryCodeAndMobileTextFieldView> {

 final Function(String) onClickVerifyBtn;
 final Function(String) onTapCountryCode;

 _CountryCodeAndMobileTextFieldViewState(this.onClickVerifyBtn,this.onTapCountryCode);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 33, right: 33),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(COUNTRY_CODE_TEXT,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: COUNTRY_CODE_AND_MOBILE_NUMBER_TEXT_COLOR,
                    fontSize: TEXT_REGULAR,
                    fontWeight: FontWeight.w400)),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CountryCodeDropdown(onTapCountryCode: onTapCountryCode),
              Expanded(
                flex: 1,
                child:
                  PhoneNumberTextField(onClickVerifyBtn:onClickVerifyBtn),
                // Column(
                //   children: [
                //     TextField(
                //       keyboardType: TextInputType.phone,
                //       style: TextStyle(color: Colors.white),
                //       decoration: InputDecoration(
                //         //labelText: MOBILE_NUMBER_TEXT,
                //         enabledBorder: UnderlineInputBorder(
                //           borderSide: BorderSide(color: Colors.white, width: 1.0),
                //         ),
                //         focusedBorder: UnderlineInputBorder(
                //           borderSide: BorderSide(color: Colors.white, width: 1.0),
                //         ),
                //         hintText: MOBILE_NUMBER_TEXT,
                //         hintStyle:
                //         TextStyle(color: COUNTRY_CODE_AND_MOBILE_NUMBER_TEXT_COLOR),
                //        ),
                //       ),
                // Visibility(
                //   visible: this.showErrorMsg ?? false,
                //   child:
                //   Text(
                //     'Please enter a valid phone number',
                //     style: const TextStyle(
                //         color: Color.fromRGBO(255, 255, 255, 1),
                //         fontSize: 16,
                //         fontWeight: FontWeight.w400),
                //   ),),
                //   ],
                // ),


                //
                // TextField(
                //   keyboardType: TextInputType.numberWithOptions(decimal: true),
                //   decoration: InputDecoration(
                //       enabledBorder: UnderlineInputBorder(
                //         borderSide: BorderSide(color: Colors.white, width: 1.0),
                //       ),
                //       focusedBorder: UnderlineInputBorder(
                //         borderSide: BorderSide(color: Colors.white, width: 1.0),
                //       ),
                //       hintText: MOBILE_NUMBER_TEXT,
                //       hintStyle:
                //           TextStyle(color: COUNTRY_CODE_AND_MOBILE_NUMBER_TEXT_COLOR)),
                //   style: TextStyle(color: Colors.white),
                // ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class VerifyYourPhoneNoButton extends StatelessWidget {

  String? enterMobileNoText;
  String? countryCode;

  VerifyYourPhoneNoButton({
    Key? key,
  required this.enterMobileNoText,
  required this.countryCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(31),
      child: CustomButtonView(
          buttonContainerBgColor: SECONDARY_COLOR,
          buttonContainerHeight: LOGIN_PAGE_BUTTON_HEIGHT,
          buttonContainerRadius: BORDER_RADIUS,
          iconPadding: 0,
          iconWidthHeight: 0,
          textColor: Colors.black,
          textDesc: VERIFY_YOUR_PHONE_NO_TEXT,
          textFontSize: TEXT_REGULAR_2X,
          iconPath: '',
          isShowIcon: false,
          () => _navigateToOTPPage(context,enterMobileNoText,countryCode)),
    );
  }
}



Future<dynamic> _navigateToOTPPage(BuildContext context, String? enterMobileNoText, String? countryCode) {
  String validPhoneNo = "${countryCode}${enterMobileNoText}";
 debugPrint("check param = ${validPhoneNo}");

 if(enterMobileNoText == null)
   {
      return Fluttertoast.showToast(
          msg: "Please enter a valid phone number",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0
      );
   }else{

   if(phoneNoVerificationFunc(validPhoneNo))
     {
     //  String validPhoneNo = "${countryCode}${enterMobileNoText}";
      // print("check valid phone no true= ${validPhoneNo}");

       return Navigator.push(
         context,
         MaterialPageRoute(
           builder: (context) => GetOTPPage(),
         ),
       );
     }else{
    // String validPhoneNo = "${countryCode}${enterMobileNoText}";
    // print("check valid phone no false= ${validPhoneNo}");
     return Fluttertoast.showToast(
         msg: "Please enter a valid phone number",
         toastLength: Toast.LENGTH_SHORT,
         gravity: ToastGravity.CENTER,
         backgroundColor: Colors.grey,
         textColor: Colors.white,
         fontSize: 16.0
     );
   }


   //callAPi

 }



}

class CountryCodeDropdown extends StatefulWidget {

  Function(String) onTapCountryCode;

  CountryCodeDropdown({required this.onTapCountryCode});

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
            widget.onTapCountryCode(_selectedCountryCode);
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
bool phoneNoVerificationFunc(String phoneNo) {
  final RegExp _phoneNumberRegExp = RegExp(r'^\+959\d{8,9}$');
  return _phoneNumberRegExp.hasMatch(phoneNo);


}
// bool checkPlusNineFiveNineFunc(String phoneNo){
//
//   var subStringData = phoneNo.substring(0, 4);
//   if (subStringData == "+959") {
//     return true;
//   } else {
//     return false;
//   }
// }