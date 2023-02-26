import 'package:flutter/material.dart';
import 'package:movie_booking_app/constants/filter_obj.dart';
import 'package:movie_booking_app/pages/movie_detail_page.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/resources/strings.dart';
import 'package:movie_booking_app/viewitems/filter_dropdown_view.dart';
import 'package:movie_booking_app/viewitems/movie_item_view.dart';
import 'package:movie_booking_app/widgets/search_box_view.dart';
import 'package:movie_booking_app/widgets/search_widget_view.dart';

class MovieSearchPage extends StatefulWidget {
  final String  nowShowingOrComingSoonFlag;


  MovieSearchPage(this.nowShowingOrComingSoonFlag);

  @override
  State<MovieSearchPage> createState() => _MovieSearchPageState();
}

class _MovieSearchPageState extends State<MovieSearchPage> {

  String _searchText = '';

  void _onSearch(String text) {
    setState(() {
      _searchText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool _isNowShowing = this.widget.nowShowingOrComingSoonFlag == 'NowShowing' ? true : false;

    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.chevron_left)),
        title: Row(
          children: [
            SearchBoxView(onSearch: (String paramString){
              setState(() {
                _onSearch(paramString);
              });
            })
          ],
        ),
        actions: const [
          FilterButtonView()
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(MARGIN_MEDIUM),
        color: PRIMARY_COLOR,
        child: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
                  SizedBox(height: 10,),
                  FilterDropdownSectionView(_isNowShowing),
                  SizedBox(height: 20,),

                ])
            ),

            GridMoviesListSection(
                _isNowShowing,
                _searchText,
                    () => {_navigateToMovieDetailPage(context,_isNowShowing)})

          ],
        ),
      ),
    );
  }
}

Future<dynamic> _navigateToMovieDetailPage(BuildContext context,bool _isNowShowing) {
  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => MovieDetailPage(_isNowShowing),
    ),
  );
}
class GridMoviesListSection extends StatelessWidget {
  final bool _isNowShowing;
  final Function onTapItemView;
  final String searchText;

  GridMoviesListSection(this._isNowShowing,this.searchText, this.onTapItemView);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          //mainAxisSpacing: MARGIN_CARD_MEDIUM_2,
          // crossAxisSpacing: 8,
          childAspectRatio: 0.63),
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          return searchText.toString().isNotEmpty?
          MovieItemView(_isNowShowing,
              _isNowShowing? movieObjListForNowShowing[index] :
              movieObjListForComingSoon[index], () {
            this.onTapItemView();
          }) : Container();
        },
        childCount:
        searchText.toString().isNotEmpty?
        _isNowShowing?
        movieObjListForNowShowing.length:
        movieObjListForComingSoon.length
        : 0,
      ),
    );
  }
}

class FilterDropdownSectionView extends StatelessWidget {
  bool _isNowShowing;

  FilterDropdownSectionView(this._isNowShowing);

  @override
  Widget build(BuildContext context) {
    List<FilterObj> filterObjList = [];
    if(_isNowShowing)
      {
        filterObjList = filterObjListForNowShowing;
      }else{
      filterObjList = filterObjListForComingSoon;
    }

    return Container(
      margin: EdgeInsets.only(left: MARGIN_CARD_MEDIUM_2),
      child: Wrap(
        spacing: 4.0, // spacing between adjacent chips
        // runSpacing: 1.0,
        direction: Axis.horizontal,
        children: filterObjList
            .map(
              (filterItem) => FilterDropdownView(filterItem.filterArrayList),
        )
            .toList(),
      ),
    );
  }
}

class FilterButtonView extends StatelessWidget {
  const FilterButtonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      margin: EdgeInsets.only(right: MARGIN_MEDIUM_3),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          "assets/icons/ic_filter.png",
          color: SECONDARY_COLOR,
          // scale: 4,
        ),
      ),
    );
  }
}




