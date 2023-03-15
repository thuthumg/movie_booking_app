import 'package:flutter/material.dart';
import 'package:movie_booking_app/data/models/movie_booking_app_model.dart';
import 'package:movie_booking_app/data/models/movie_booking_app_model_impl.dart';
import 'package:movie_booking_app/data/vos/city_vo.dart';
import 'package:movie_booking_app/network/api_constants.dart';
import 'package:movie_booking_app/pages/cinema_page.dart';
import 'package:movie_booking_app/pages/movie_page.dart';
import 'package:movie_booking_app/pages/profile_page.dart';
import 'package:movie_booking_app/pages/movie_search_page.dart';
import 'package:movie_booking_app/pages/ticket_list_page.dart';
import 'package:movie_booking_app/pages/ticket_page.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';


class MainPage extends StatefulWidget {
  final CityVO cityVO;

  MainPage({Key? key,required this.cityVO}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  MovieBookingAppModel movieBookingAppModel = MovieBookingAppModelImpl();
  String profileImageLink = "";
  @override
  void initState() {
    movieBookingAppModel.getUserDataFromDatabase(paramTokenStr).then((userDataVO) {
      profileImageLink = userDataVO?.profileImage.toString()??"";
      print("string profile link ${profileImageLink}");
    }).catchError((error) {
      debugPrint(error.toString());
    });
    super.initState();
  }


  int _selectedScreenIndex = 0;
  bool appBarVisible = true;

 /* final List _screens = [
    {"screen": MoviePage(cityVO: CityVO(1,"Yangon")), "title": "Movies"},
    {"screen": CinemaPage(), "title": "Cinema"},
    {"screen": const TicketListPage(), "title": "Ticket"},
    {"screen": ProfilePage(profileImageLink), "title": "Profile"}
  ];*/

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  int _currentIndex = 0;
  void _selectScreen(int index){
    // switch (index) {
    //   case 0:
    //     _screens.currentState.pushNamed('/tab1');
    //     break;
    //   case 1:
    //     navigatorKey.currentState.pushNamed('/tab2');
    //     break;
    //   case 2:
    //     navigatorKey.currentState.pushNamed('/tab3');
    //     break;
    // }

    setState(() {
      _selectedScreenIndex = index;

      if(index == 0)
      {
        appBarVisible = true;
      }else{
        appBarVisible = false;
      }
      // navigatorKey.currentState.pushNamed('/tab$index');
    });
  }
  Widget _getPage(int pageName) {
    switch (pageName) {
      case 0:
        return MoviePage(cityVO: widget.cityVO,);
      case 1:
        return CinemaPage();
      case 2:
        return TicketListPage();
      case 3:
        return ProfilePage(profileImageLink: profileImageLink,);
      default:
        return MoviePage(cityVO: widget.cityVO,);
    /*
    switch (pageName) {
      case '/tab0':
        return MainPage(cityVO: widget.cityVO,);
      case '/tab1':
        return CinemaPage();
      case '/tab2':
        return TicketListPage();
      case '/tab3':
        return ProfilePage();
      default:
        return MainPage(cityVO: widget.cityVO,);*/
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: PRIMARY_COLOR,

        body:
        _getPage(_selectedScreenIndex),
       // _screens[_selectedScreenIndex]["screen"],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: PRIMARY_COLOR,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedScreenIndex,
          onTap: _selectScreen,
          iconSize: 24.0,
          selectedItemColor: SECONDARY_COLOR,
          unselectedItemColor: GRAY_COLOR,
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset("assets/icons/ic_unselected_movie.png",scale: 2,),
              activeIcon: Image.asset("assets/icons/ic_selected_movie.png",scale: 2,),
              label: 'Movies',
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/icons/ic_unselected_cinemas.png",scale: 2,),
              activeIcon: Image.asset("assets/icons/ic_selected_cinemas.png",scale: 2,),
              label: 'Cinemas',
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/icons/ic_unselected_ticket.png",scale: 2,),
              activeIcon: Image.asset("assets/icons/ic_selected_ticket.png",scale: 2,),
              label: 'Ticket',
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/icons/ic_unselected_profile.png",scale: 2,),
              activeIcon: Image.asset("assets/icons/ic_selected_profile.png",scale: 2,),
              label: 'Profile',
            ),

          ],
        )


    );
  }
}


