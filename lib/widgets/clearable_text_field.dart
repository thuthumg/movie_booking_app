import 'package:flutter/material.dart';

class ClearableTextField extends StatefulWidget {
  @override
  _ClearableTextFieldState createState() => _ClearableTextFieldState();
}

class _ClearableTextFieldState extends State<ClearableTextField> {
  TextEditingController _controller = TextEditingController();
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _hasText = _controller.text.isNotEmpty;
    });
  }

  void _clearText() {
    setState(() {
      _controller.clear();
      _hasText = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return

      TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: 'search the cinema',
          hintStyle:
          TextStyle(color: Color.fromRGBO(136, 136, 136, 1)),

          border: InputBorder.none,
          //  fillColor: Colors.white,
          filled: true,
          suffixIcon: _hasText
              ? IconButton(
            icon: Icon(Icons.clear),
            onPressed: _clearText,
          )
              : null,
        ),
        style: TextStyle(color: Colors.white),
      );


     /* TextField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: 'Enter text',
        suffixIcon: _hasText
            ? IconButton(
          icon: Icon(Icons.clear),
          onPressed: _clearText,
        )
            : null,
      ),
    );*/
  }
}
