import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_booking_app/data/models/movie_booking_app_model.dart';
import 'package:movie_booking_app/data/models/movie_booking_app_model_impl.dart';
import 'package:movie_booking_app/network/api_constants.dart';
import 'package:movie_booking_app/pages/location_page.dart';
import 'package:movie_booking_app/pages/main_page.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/resources/strings.dart';
import 'package:movie_booking_app/widgets/custom_button_view.dart';

//import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pinput/pinput.dart';

class GetOTPPage extends StatefulWidget {
  final String paramPhoneNumber;

  const GetOTPPage({Key? key,required this.paramPhoneNumber}) : super(key: key);

  @override
  State<GetOTPPage> createState() => _GetOTPPageState();
}

class _GetOTPPageState extends State<GetOTPPage> {

  String pinText = "";

  MovieBookingAppModel movieBookingAppModel = MovieBookingAppModelImpl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        leading: BackButtonView(
          () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const LogoImageView(),
              const SubTitleTextView(),
              const SizedBox(
                height: MARGIN_XXLARGE,
              ),
              OTPTextView(pinCodeText: (String pinText){
                this.pinText = pinText;
              },),
              const SizedBox(
                height: MARGIN_XLARGE,
              ),
              const ResendCodeTextView(),
              ConfirmOTPBtnView(movieBookingAppModel: movieBookingAppModel,
                  pinText: this.pinText,phoneNum: widget.paramPhoneNumber)
            ],
          ),
        ),
      ),
    );
  }
}

class BackButtonView extends StatelessWidget {
  final Function onTapBack;

  const BackButtonView(this.onTapBack);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapBack();
      },
      child: const Icon(
        Icons.chevron_left,
        size: MARGIN_XLARGE,
      ),
    );
  }
}

class ConfirmOTPBtnView extends StatelessWidget {
  MovieBookingAppModel? movieBookingAppModel;
  String pinText;
  String phoneNum;
  ConfirmOTPBtnView({
    required this.movieBookingAppModel,
    required this.pinText,
    required this.phoneNum
  });

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
          textDesc: "Confirm OTP",
          textFontSize: TEXT_REGULAR_2X,
          iconPath: '',
          isShowIcon: false,
          () => _navigateToLocationPage(context,movieBookingAppModel,pinText,phoneNum)),
    );

    //   Padding(
    //   padding: const EdgeInsets.only(left: MARGIN_LARGE, right: MARGIN_LARGE),
    //   child: ElevatedButton(
    //     style: ElevatedButton.styleFrom(
    //         primary: SECONDARY_COLOR, minimumSize: const Size.fromHeight(49)),
    //     child: const Padding(
    //       padding: EdgeInsets.only(top: 15, bottom: 15),
    //       child: Text(
    //         "Confirm OTP",
    //         style: TextStyle(
    //           color: Colors.black,
    //           fontSize: 16,
    //           fontWeight: FontWeight.w400,
    //         ),
    //       ),
    //     ),
    //     onPressed: () {
    //       _navigateToLocationPage(context);
    //     },
    //   ),
    // );
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

  Function(String) pinCodeText;

  OTPTextView({
    Key? key,
    required this.pinCodeText
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
                child: Text(ENTER_OTP_CODE,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: ENTER_OTP_CODE_TEXT_COLOR,
                        fontSize: TEXT_REGULAR,
                        fontWeight: FontWeight.w400)),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: MARGIN_MEDIUM,
        ),
        PinCodeTextSection(pinCodeText: (String pinText){
          this.pinCodeText(pinText);
        }),
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

  Function(String) pinCodeText;

  PinCodeTextSection({
    Key? key,
    required this.pinCodeText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 50,
      textStyle: const TextStyle(
          fontSize: TEXT_REGULAR_1X,
          color: PIN_THEME_TEXT_COLOR,
          fontWeight: FontWeight.w500),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: PIN_THEME_BORDER_COLOR),
        borderRadius: BorderRadius.circular(PIN_THEME_BORDER_RADIUS),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.white),
      borderRadius: BorderRadius.circular(PIN_THEME_BORDER_RADIUS),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: SUMBITED_PIN_THEME_COLOR,
      ),
    );
    return Pinput(
      length: 6,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      // validator: (s) {
      //   return s == '222222' ? null : 'Pin is incorrect';
      // },
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onCompleted: (pin){
        print(pin);
        this.pinCodeText(pin);
      } ,
    );
  }
}

Future<dynamic>? _navigateToLocationPage(BuildContext context,
    MovieBookingAppModel? movieBookingAppModel,
    String pinText,String phoneNum) {
  //call confirm otp api
  if (pinText.isEmpty) {
    return Fluttertoast.showToast(
        msg: "Please fill the pin code.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0
    );
  } else {
    movieBookingAppModel?.getSignInWithPhone(phoneNum, pinText).then((value) {
      debugPrint("token data = ${value?.userToken}");
      String tokenStr = value?.userToken?? "";

      if(tokenStr.isNotEmpty)
        {
         // removeAllPreviousRoutes(context);
          return

            Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LocationPage(),
            ),
          );
        }else{
        return Fluttertoast.showToast(
            msg:"Wrong OTP",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: TEXT_REGULAR_2X
        );
      }


      //
      // if(value == value)
      // {
      //   return Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => GetOTPPage(paramPhoneNumber: validPhoneNo),
      //     ),
      //   );
      // }else{
      //   return Fluttertoast.showToast(
      //       msg:"Pin is incorrect",
      //       toastLength: Toast.LENGTH_SHORT,
      //       gravity: ToastGravity.CENTER,
      //       backgroundColor: Colors.grey,
      //       textColor: Colors.white,
      //       fontSize: 16.0
      //   );
      // }

    })
        .catchError((error) {
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
  }



}
void removeAllPreviousRoutes(BuildContext context) {
  while (Navigator.of(context).canPop()) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => LocationPage()));
  }
}
