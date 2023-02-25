import 'package:flutter/material.dart';
import 'package:movie_booking_app/widgets/time_range_slider_view.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/resources/strings.dart';
import 'package:movie_booking_app/viewitems/filter_dropdown_view.dart';
import 'package:movie_booking_app/widgets/booking_movie_theaters_view.dart';
import 'package:movie_booking_app/widgets/price_range_slider.dart';
import 'package:movie_booking_app/widgets/clearable_text_field.dart';

class CinemaSearchPage extends StatelessWidget {
  const CinemaSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RangeValues _currentRangeValues = RangeValues(0.2, 0.8);
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.chevron_left)),
        title: SearchBoxView(),
        actions: [
          FilterButtonView(),
        ],
      ),
      body: Container(
        color: PRIMARY_COLOR,
        child: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              const FilterDropdownSectionView(),
              const SizedBox(
                height: 20,
              ),
              const PriceRangeSectionView(),
              const SizedBox(
                height: 20,
              ),
              const TimeRangeSectionView(),
              const SizedBox(
                height: 20,
              ),
              const CinemaFilterListSectionView(),
            ]))
          ],
        ),
      ),
    );
  }
}

class CinemaFilterListSectionView extends StatelessWidget {
  const CinemaFilterListSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: MARGIN_MEDIUM_2, right: MARGIN_MEDIUM_2),
      child: Column(
        children: [
          BookingMovieTheatersView(),
        ],
      ),
    );
  }
}

class TimeRangeSectionView extends StatelessWidget {
  const TimeRangeSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: MARGIN_MEDIUM_3),
          child: const Text(
            SHOW_TIMES_TEXT,
            style: TextStyle(
                color: Colors.white,
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
            margin:
                const EdgeInsets.only(left: MARGIN_MEDIUM_3, right: MARGIN_MEDIUM_3),
            child: TimeRangeSliderView())
      ],
    );
  }
}

class PriceRangeSectionView extends StatelessWidget {
  const PriceRangeSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: MARGIN_MEDIUM_3),
          child: const Text(
            PRICE_RANGE_TEXT,
            style: TextStyle(
                color: Colors.white,
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        PriceRangeSliderSectionView(),
      ],
    );
  }
}

class FilterDropdownSectionView extends StatelessWidget {
  const FilterDropdownSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          width: MediaQuery.of(context).size.width * 0.5,
          child: Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: ClearableTextField()),
        ),
      ],
    );
  }
}

class PriceRangeSliderSectionView extends StatefulWidget {
  const PriceRangeSliderSectionView({
    Key? key,
  }) : super(key: key);

  @override
  State<PriceRangeSliderSectionView> createState() =>
      _PriceRangeSliderSectionViewState();
}

class _PriceRangeSliderSectionViewState
    extends State<PriceRangeSliderSectionView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: MARGIN_MEDIUM_3, right: MARGIN_MEDIUM_3),
        child: PriceRangeSlider());

  }
}

class TimeRangeSliderSectionView extends StatefulWidget {
  const TimeRangeSliderSectionView({
    Key? key,
  }) : super(key: key);

  @override
  State<TimeRangeSliderSectionView> createState() =>
      _TimeRangeSliderSectionViewState();
}

class _TimeRangeSliderSectionViewState
    extends State<TimeRangeSliderSectionView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: MARGIN_MEDIUM_3, right: MARGIN_MEDIUM_3),
        child: PriceRangeSlider());
  }
}
