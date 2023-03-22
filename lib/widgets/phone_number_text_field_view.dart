import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/resources/strings.dart';

class PhoneNumberTextField extends StatefulWidget {
  final String paramPhoneNumber;
  final Function(String) onClickVerifyBtn;

  const PhoneNumberTextField({Key? key,required this.onClickVerifyBtn,
  required this.paramPhoneNumber}) : super(key: key);

  @override
  _PhoneNumberTextFieldState createState() => _PhoneNumberTextFieldState();
}

class _PhoneNumberTextFieldState extends State<PhoneNumberTextField> {
  final TextEditingController _controller = TextEditingController();
  final RegExp _phoneNumberRegExp = RegExp(r'^\d{10}$');
 // RegExp(r'^\+?\d{0,2}[- ]?\d{3}[- ]?\d{3}[- ]?\d{4}$');

  bool _hasText = false;

  @override
  void initState() {
    _controller.addListener(() {
      _hasText = _controller.text.isNotEmpty;
      widget.onClickVerifyBtn(_controller.text);
    });
    super.initState();
  }

  void _onTextChanged(String text) {
    setState(() {
      _hasText = _controller.text.isNotEmpty;
      //   _filteredItems = widget.items
      //       .where((item) => item.toLowerCase().contains(text.toLowerCase()))
      //       .toList();
    });
  }

  @override
  Widget build(BuildContext context) {

    return TextField(
      keyboardType: TextInputType.phone,
      controller: _controller,
      style: TextStyle(color: Colors.white,fontSize: TEXT_REGULAR_1X),
      decoration: InputDecoration(
        //labelText: MOBILE_NUMBER_TEXT,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
        hintText: MOBILE_NUMBER_TEXT,
          hintStyle:
          TextStyle(color: COUNTRY_CODE_AND_MOBILE_NUMBER_TEXT_COLOR,fontSize: TEXT_REGULAR_1X),
        label:Visibility(
          visible: widget.paramPhoneNumber != null,
          child:  Text(widget.paramPhoneNumber?? ""),
        )

        // errorText: _isValidPhoneNumber(_controller.text)
        //     ? null
        //     : 'Please enter a valid phone number',
      ),
      onChanged: _onTextChanged,

    );
  }

  bool _isValidPhoneNumber(String phoneNumber) {
    return _phoneNumberRegExp.hasMatch(phoneNumber);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
