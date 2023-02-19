import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/widgets/clip_date_card.dart';
import 'package:movie_booking_app/widgets/my_clipper_card.dart';

class DateTimeCard extends StatelessWidget {
  final String day;
  final String month;
  final String date;
  final bool active;
  Function onTapCardItem;


  DateTimeCard(this.day, this.month, this.date, this.active,this.onTapCardItem);

  @override
  Widget build(BuildContext context) {

    print("date time card =  $active");

    return GestureDetector(
      onTap: ()=> onTapCardItem(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                    margin: EdgeInsets.only(bottom: 10, left: 10),
                     width: 80,
                     height: 100,
                    child: ClipDateCard(
                    clipper: MyClipperCard(holeRadius: 10,height: 4),
                    shadow: Shadow(
                      color: Colors.grey,
                      blurRadius: 2,
                      offset: Offset(0.5, 0.5),
                    ),
                    child: Container(
                       padding:
                       EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 5),
                      decoration: BoxDecoration(
                        color: active ? SECONDARY_COLOR : Colors.grey[350],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(children: [
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              day,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: TEXT_REGULAR,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              month,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: TEXT_REGULAR,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              date,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: TEXT_REGULAR,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        )
                      ]),
                    ),
                  ),
                ),
                Positioned(
                    left: 40,
                    top: 5,
                    child: Container(
                      width: 20,
                      height: 5,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Colors.black,
                      ),
                    ))
              ],
            ),
          ],
        ));
  }
}