import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_booking_app/data/models/movie_booking_app_model.dart';
import 'package:movie_booking_app/data/models/movie_booking_app_model_impl.dart';
import 'package:movie_booking_app/network/api_constants.dart';
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
  MovieBookingAppModel movieBookingAppModel = MovieBookingAppModelImpl();



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

  String? _selectedCountryCode;

   @override
   void initState() {
     _selectedCountryCode = '+95';
     _chooseCountryCode = '+95';
     super.initState();
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
              CountryCodeAndMobileTextFieldView(
                  onClickVerifyBtn:_onClickVerifyBtn,
                  onTapCountryCode:_onTapCountryCode,
                  selectedcountryCode : _selectedCountryCode??"+95"),
              VerifyYourPhoneNoButton(
                  enterMobileNoText: _enterMobileNoText,
                  countryCode: _chooseCountryCode,
                  movieBookingAppModel: movieBookingAppModel),
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
              GoogleButton(
                  enterMobileNoText: _enterMobileNoText,
                  countryCode: _chooseCountryCode,
                  movieBookingAppModel: movieBookingAppModel),
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
          VERIFY_YOUR_PHONE_NUMBER,
          style: TextStyle(
              color: VERIFY_YOUR_PHONE_NUMBER_COLOR,
              fontSize: VERIFY_YOUR_PHONE_NUMBER_TEXT_SIZE,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          WE_WILL_SENT_SIX_DIGIT_SMS_CODE_TEXT,
          style: TextStyle(
              color: WE_WILL_SENT_SIX_DIGIT_SMS_CODE_COLOR,
              fontSize: TEXT_REGULAR_1X,
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
  MovieBookingAppModel? movieBookingAppModel;

  GoogleButton({
    Key? key,
    required this.enterMobileNoText,
    required this.countryCode,
    required this.movieBookingAppModel,
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
          () => _navigateToOTPPage(
              context,
              enterMobileNoText,
              countryCode,
              movieBookingAppModel)),
    );
  }
}

class CountryCodeAndMobileTextFieldView extends StatefulWidget {
  final Function(String) onClickVerifyBtn;
  final Function(String) onTapCountryCode;
  String selectedcountryCode;

  CountryCodeAndMobileTextFieldView(
  {
    Key? key,
    required this.onClickVerifyBtn,
    required this.onTapCountryCode,
    required this.selectedcountryCode
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
              CountryCodeDropdown(onTapCountryCode: onTapCountryCode,selectCountryCode: widget.selectedcountryCode,),
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
  MovieBookingAppModel? movieBookingAppModel;

  VerifyYourPhoneNoButton({
    Key? key,
  required this.enterMobileNoText,
  required this.countryCode,
  required this.movieBookingAppModel}) : super(key: key);

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
          () => _navigateToOTPPage(
              context,
              enterMobileNoText,
              countryCode,
              movieBookingAppModel)),
    );
  }
}

class CountryCodeDropdown extends StatefulWidget {

  Function(String) onTapCountryCode;
  String selectCountryCode;

  CountryCodeDropdown({required this.onTapCountryCode,required this.selectCountryCode});

  @override
  _CountryCodeDropdownState createState() => _CountryCodeDropdownState();
}

class _CountryCodeDropdownState extends State<CountryCodeDropdown> {
 // String _selectedCountryCode = '+95'; //'+1';

  final List<String> _countryCodes = ['+95','+1', '+44', '+33', '+81', '+86'];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: MARGIN_MEDIUM, right: MARGIN_MEDIUM),
      child: DropdownButton<String>(
        value: widget.selectCountryCode,
        dropdownColor: PRIMARY_COLOR,
        icon: const Padding(
          padding: EdgeInsets.only(left: MARGIN_CARD_MEDIUM_3),
          child: Icon(
            Icons.keyboard_arrow_down_sharp,
            color: Colors.white, // <-- SEE HERE
          ),
        ),
        onChanged: (newValue) {
          setState(() {
            widget.selectCountryCode = newValue ?? "";
            widget.onTapCountryCode(widget.selectCountryCode);
          });
        },
        items: _countryCodes.map((countryCode) {
          return DropdownMenuItem<String>(
            value: countryCode,
            child: Text(
              countryCode,
              style: const TextStyle(
                  color: DROPDOWN_MENU_COLOR,
                  fontSize: TEXT_REGULAR_2X,
                  fontWeight: FontWeight.w400),
            ),
          );
        }).toList(),
      ),
    );
  }
}

Future<dynamic>? _navigateToOTPPage(BuildContext context,
    String? enterMobileNoText,
    String? countryCode,
    MovieBookingAppModel? movieBookingAppModel) {

  String validPhoneNo = "${countryCode}${enterMobileNoText}";
  debugPrint("check param = ${validPhoneNo}");

  if(enterMobileNoText == null)
  {
    return Fluttertoast.showToast(
        msg: PLEASE_ENTER_A_VALID_PHONE_NUMBER_MSG,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: TEXT_REGULAR_2X
    );
  }else{

    if(phoneNoVerificationFunc(validPhoneNo))
    {
      //  String validPhoneNo = "${countryCode}${enterMobileNoText}";
      // print("check valid phone no true= ${validPhoneNo}");

      movieBookingAppModel?.getOtp(validPhoneNo).then((value){
        debugPrint("otp data = ${value.toString()}");

        if(API_SUCCESS_CODE == value)
          {
            return Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GetOTPPage(paramPhoneNumber: validPhoneNo),
              ),
            );
          }else{
          return Fluttertoast.showToast(
              msg: "OTP Error",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }

      })
          .catchError((error){
        return Fluttertoast.showToast(
            msg: error.toString() ?? "",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0
        );
       // debugPrint(error.toString());
      });



    }else{
      // String validPhoneNo = "${countryCode}${enterMobileNoText}";
      // print("check valid phone no false= ${validPhoneNo}");
      return Fluttertoast.showToast(
          msg: PLEASE_ENTER_A_VALID_PHONE_NUMBER_MSG,
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