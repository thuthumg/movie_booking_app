import 'package:flutter/material.dart';
import 'package:movie_booking_app/pages/cinema_page.dart';
import 'package:movie_booking_app/pages/movie_page.dart';
import 'package:movie_booking_app/pages/profile_page.dart';
import 'package:movie_booking_app/pages/movie_search_page.dart';
import 'package:movie_booking_app/pages/ticket_list_page.dart';
import 'package:movie_booking_app/pages/ticket_page.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _selectedScreenIndex = 0;
  bool appBarVisible = true;
  final List _screens = [
    {"screen": MoviePage(), "title": "Movies"},
    {"screen": CinemaPage(), "title": "Cinema"},
    {"screen": const TicketListPage(), "title": "Ticket"},
    {"screen": const ProfilePage(), "title": "Profile"}
  ];

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
  Widget _getPage(String pageName) {
    switch (pageName) {
      case '/tab0':
        return MainPage();
      case '/tab1':
        return CinemaPage();
      case '/tab2':
        return TicketListPage();
      case '/tab3':
        return ProfilePage();
      default:
        return MainPage();
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: PRIMARY_COLOR,

        body:
        _screens[_selectedScreenIndex]["screen"],
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


