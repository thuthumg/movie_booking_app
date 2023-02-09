import 'package:flutter/material.dart';
import 'package:movie_booking_app/pages/movie_page.dart';
import 'package:movie_booking_app/pages/main_page.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/viewitems/city_view.dart';

class CitiesLocationPage extends StatelessWidget {
  const CitiesLocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: PRIMARY_COLOR,
        title:  const Center(
          child: Text(
            "Pick Region",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(0,255,106,1),
                fontSize: 16,
                shadows: [
                  Shadow(
                    offset: Offset(0, 0), //position of shadow
                    blurRadius: 40,//blur intensity of shadow
                    color: Color.fromRGBO(0,255,106,1), //color of shadow with opacity
                  ),

                  //add more shadow with different position offset here
                ]),
          ),
        ),

      ),

      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
             const SearchSection(),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Image.asset('assets/images/cities_photo.png',

                  scale: 3,),
              ),

          Container(
            width: MediaQuery.of(context).size.width,
            color: const Color.fromRGBO(59, 59, 59, 1),
            height: 40,
            child: const Padding(
              padding: EdgeInsets.only(left: MARGIN_LARGE,right: MARGIN_LARGE),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Cities",
                style: TextStyle(
                  fontSize: TEXT_REGULAR,
                  color: Colors.white,
                  fontWeight: FontWeight.w400
                ),),
              ),
            ),
          ),
          SizedBox(height: 20,),
          CitiesListView(()=> _navigateToHomeScreen(context))
            ],
          ),
        ),
      ),
    );
  }


}

Future<dynamic> _navigateToHomeScreen(BuildContext context) {

return Navigator.push(context,
MaterialPageRoute(builder: (context)=> MainPage()));
}

class SearchSection extends StatelessWidget {
  const SearchSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:MARGIN_LARGE,right: MARGIN_LARGE,top: MARGIN_LARGE),
      child: Row(
        children: [
         Expanded(
             flex: 5,
             child: SearchBoxGradientView()),
         SizedBox(width: 10,),
          Expanded(
            flex: 1,
            child:
              Image.asset('assets/images/ic_location_search.png',height: 44,width: 44,)
          /*  ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: SECONDARY_COLOR,
                  minimumSize: const Size.fromHeight(50)),
              child: ImageIcon(AssetImage('assets/images/ic_location_search.png')),
              onPressed: () {
                print("Continue");
              },
            ),*/
          )
        ],
      ),
    );
  }
}

class CitiesListView extends StatelessWidget {
  final Function onTapCity;
  List<String> citiesPopulate = [
    "Yangon",
    "Mandalay",
    "Bago",
    "Naypyidaw",
    "Mawlamyine"
  ];

  CitiesListView(this.onTapCity);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: citiesPopulate.length,
          itemBuilder: (
          BuildContext context,int index
          ){
        return CityView(citiesPopulate.elementAt(index),(){
          this.onTapCity();
        });

      }),
    );
  }
}

class SearchBoxGradientView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration:  const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color.fromRGBO(102, 102, 102, 0.8),
                Color.fromRGBO(85, 85, 85, 0.4),
                Color.fromRGBO(85, 85, 85, 0.4)])),
      child:  const TextField(
        minLines: 1,
        decoration: InputDecoration(
            contentPadding:
            EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
           /* enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: const BorderSide(
                width: 1.0,
                color: Colors.black,
              ),
            ),
            focusedBorder: OutlineInputBorder(
             borderRadius:BorderRadius.all(Radius.circular(8)),
              borderSide: const BorderSide(
                width: 1.0,
                color: Colors.black,
              ),
            ),*/
            prefixIcon: Icon(Icons.search,color: SECONDARY_COLOR,),
            hintText: "Search your location",
            hintStyle: TextStyle(
              color: SEARCH_HINT_COLOR,
              fontSize: TEXT_REGULAR,
              fontWeight: FontWeight.w400
            )),
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
