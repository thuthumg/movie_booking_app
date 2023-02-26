import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/colors.dart';

class SearchWidgetView extends StatefulWidget {

  final Function(String) onSearch;

  const SearchWidgetView({Key? key, required this.onSearch}) : super(key: key);

  @override
  _SearchWidgetViewState createState() => _SearchWidgetViewState();
}

class _SearchWidgetViewState extends State<SearchWidgetView> {

  TextEditingController _controller = TextEditingController();
 // List<String> _filteredItems = [];
  bool _hasText = false;


  @override
  void initState() {
    super.initState();
    _controller.addListener((){
      _hasText = _controller.text.isNotEmpty;
      widget.onSearch(_controller.text);
    });

   // _filteredItems = widget.items;
  }
  //
  void _onSearchTextChanged(String text) {
    setState(() {
      _hasText = _controller.text.isNotEmpty;
    //   _filteredItems = widget.items
    //       .where((item) => item.toLowerCase().contains(text.toLowerCase()))
    //       .toList();
     });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  void _clearSearchQuery() {
    setState(() {
      _hasText = false;
      _controller.clear();
    });
  }
  // void _onTextChanged() {
  //   setState(() {
  //     _hasText = _controller.text.isNotEmpty;
  //   });
  // }

  // void _clearText() {
  //   setState(() {
  //     _controller.clear();
  //     _hasText = false;
  //     _onSearchTextChanged('');
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return

      TextField(
        controller: _controller,
       // autofocus: true,
        decoration: InputDecoration(
          hintText: 'search the cinema',
          hintStyle:
          TextStyle(color: Color.fromRGBO(136, 136, 136, 1)),

          border: InputBorder.none,
          //  fillColor: Colors.white,
          filled: true,
          suffixIcon: _hasText
              ? IconButton(
            icon: Icon(Icons.clear,color: SECONDARY_COLOR,),
            onPressed: _clearSearchQuery,
          )
              : null,
        ),
        style: TextStyle(color: Colors.white),
        onChanged: _onSearchTextChanged,
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
