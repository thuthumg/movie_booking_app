import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';

class CitiesLocationPage extends StatelessWidget {
  const CitiesLocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: PRIMARY_COLOR,
        title: const Center(
          child: Text(
            "Pick Region",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: SECONDARY_COLOR,
                fontSize: 16),
          ),
        ),

      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: MARGIN_LARGE,
          right: MARGIN_LARGE),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
               Row(
                 children: [

                   Expanded(
                     flex: 5,
                     child: SizedBox(
                       height: 50,
                       child: TextField(
                         minLines: 1,
                         decoration: InputDecoration(
                             contentPadding:
                             EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                             enabledBorder: OutlineInputBorder(
                               borderSide: BorderSide(width: 1, color: Colors.grey),
                             ),
                             focusedBorder: OutlineInputBorder(
                               borderSide: BorderSide(
                                 width: 1,
                                 color: Colors.orangeAccent,
                               ),
                             ),
                             filled: true,
                             fillColor: Colors.white,
                             hintText: "Name",
                             hintStyle: TextStyle(
                               color: Color.fromRGBO(76, 90, 109, 1.0),
                               fontSize: 14.5,
                             )),
                         style: TextStyle(color: Colors.white),
                       ),
                     ),
                   ),
                   Spacer(),
                   Expanded(
                     flex: 1,
                     child: ElevatedButton(
                       style: ElevatedButton.styleFrom(
                           primary: SECONDARY_COLOR,
                           minimumSize: const Size.fromHeight(50)),
                       child: ImageIcon(AssetImage('assets/images/ic_location_search.png')),
                       onPressed: () {
                         print("Continue");
                       },
                     ),
                   )
                 ],
               ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset('assets/images/cities_photo.png',
                  fit: BoxFit.cover,
                    scale: 30,),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


}

class GradientView extends StatelessWidget {
  const GradientView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, GRAY_COLOR_2])),
    );
  }
}
