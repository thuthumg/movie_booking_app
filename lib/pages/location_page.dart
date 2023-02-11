import 'package:flutter/material.dart';
import 'package:movie_booking_app/pages/main_page.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/viewitems/city_view.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: PRIMARY_COLOR,
        title: const Center(
          child: Text(
            "Pick Region",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(0, 255, 106, 1),
                fontSize: 16,
                shadows: [
                  Shadow(
                    offset: Offset(0, 0), //position of shadow
                    blurRadius: 40, //blur intensity of shadow
                    color: Color.fromRGBO(
                        0, 255, 106, 1), //color of shadow with opacity
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
           // mainAxisSize: MainAxisSize.min,
            children: [
              const SearchSection(),
              const SizedBox(
                height: MARGIN_CARD_MEDIUM_2,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  'assets/images/cities_photo.png',
                  scale: 3,
                ),
              ),
              const CitiesTitleView(),
              const SizedBox(
                height: 20,
              ),
              CitiesListView(() => _navigateToHomeScreen(context))
            ],
          ),
        ),
      ),
    );
  }
}

class CitiesTitleView extends StatelessWidget {
  const CitiesTitleView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: const Color.fromRGBO(59, 59, 59, 1),
      height: 40,
      child: const Padding(
        padding: EdgeInsets.only(left: MARGIN_LARGE, right: MARGIN_LARGE),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Cities",
            style: TextStyle(
                fontSize: TEXT_REGULAR_2X,
                color: Colors.white,
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}

Future<dynamic> _navigateToHomeScreen(BuildContext context) {
  return Navigator.push(
      context, MaterialPageRoute(builder: (context) => MainPage()));
}

class SearchSection extends StatelessWidget {
  const SearchSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Padding(
              padding: const EdgeInsets.only(
                  left: MARGIN_LARGE, right: MARGIN_LARGE, top: MARGIN_LARGE),
              child: Container(
                height: 50,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromRGBO(102, 102, 102, 0.8),
                      Color.fromRGBO(85, 85, 85, 0.4),
                      Color.fromRGBO(85, 85, 85, 0.4)
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(MARGIN_MEDIUM),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: MARGIN_SMALL),
                        width: 30,
                        height: 30,
                        child: Icon(Icons.search,color: SECONDARY_COLOR,),
                      ),
                      const Text(
                        'Search your location',
                        style: TextStyle(
                          color: SEARCH_HINT_COLOR,
                          fontSize: TEXT_REGULAR_2X,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ),
        Expanded(
          flex: 1,
          child: Container(
            margin: const EdgeInsets.only(
                 right: MARGIN_LARGE, top: MARGIN_LARGE),
            child: Image.asset(
              'assets/images/ic_location_search.png',
              height: 50,
              width: 50,
            ),
          ),
        )
      ],
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
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
              onTapCity();
            },
            child: CityView(citiesPopulate.elementAt(index)),
          );
        },
      ),
    );
  }
}
