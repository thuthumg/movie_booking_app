import 'package:flutter/material.dart';
import 'package:movie_booking_app/constants/filter_obj.dart';
import 'package:movie_booking_app/pages/movie_detail_page.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/resources/strings.dart';
import 'package:movie_booking_app/viewitems/filter_dropdown_view.dart';
import 'package:movie_booking_app/viewitems/movie_item_view.dart';
import 'package:movie_booking_app/widgets/clearable_text_field.dart';

class MovieSearchPage extends StatelessWidget {
  final String  nowShowingOrComingSoonFlag;


  MovieSearchPage(this.nowShowingOrComingSoonFlag);

  @override
  Widget build(BuildContext context) {
    bool _isNowShowing = this.nowShowingOrComingSoonFlag == 'NowShowing' ? true : false;

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
            SearchBoxView()
          ],
        ),
        actions: [
          FilterButtonView()
        ],
      ),
      body: Container(
        color: PRIMARY_COLOR,
        child: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
                  FilterDropdownSectionView(_isNowShowing),
                  SizedBox(height: 20,),

                ])
            ),
            GridMoviesListSection(
                _isNowShowing, () => {_navigateToMovieDetailPage(context,_isNowShowing)})
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

  GridMoviesListSection(this._isNowShowing, this.onTapItemView);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: MARGIN_MEDIUM,
          // crossAxisSpacing: 8,
          childAspectRatio: 0.63),
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(left: MARGIN_MEDIUM),
            child: MovieItemView(_isNowShowing, () {
              this.onTapItemView();
            }),
          );
        },
        childCount: 20,
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
      margin: EdgeInsets.only(left: MARGIN_MEDIUM_3),
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

class SearchBoxView extends StatelessWidget {
  const SearchBoxView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.search_rounded),
        Container(
          width: MediaQuery.of(context).size.width*0.5,
          child: Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: ClearableTextField()
          ),
        ),
      ],
    );
  }
}


