import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/resources/strings.dart';
import 'package:movie_booking_app/viewitems/profile_list_item_view.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: PRIMARY_COLOR,
            child: Column(
              children: [
                ProfileView(),
                ProfileListView( ()=>{})

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileInfoListItemObject {
  String title = "";
  String iconLink = "";

  ProfileInfoListItemObject(this.title, this.iconLink);
}
class ProfileListView extends StatelessWidget {
  final Function onTapProfileInfoItem;

  ProfileListView(this.onTapProfileInfoItem);

  @override
  Widget build(BuildContext context) {
    return Container(
     // height: MediaQuery.of(context).size.height,
      margin: const EdgeInsets.only(left: 20.0, right: 20.0,top: 20.0),
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: profileInfoList.length,
          itemBuilder: (BuildContext context, int index) {
            return ProfileListItemView(
                profileInfoList[index].title,
                profileInfoList[index].iconLink,
                    (){
                  this.onTapProfileInfoItem();
                });
          }),
    );

  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: Stack(
        children: const [
          Positioned.fill(
            child: ProfileBackgroundImageView(),
          ),
          Align(alignment: Alignment.center,
          child: ProfilePhoto_Login_SingUpView(),)
        ],
      ),
    );
  }
}

class ProfilePhoto_Login_SingUpView extends StatelessWidget {
  const ProfilePhoto_Login_SingUpView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10,),
        Container(
          padding: const EdgeInsets.only(top: MARGIN_CARD_MEDIUM_2,bottom: MARGIN_CARD_MEDIUM_2),
            width:100,
            height: 100,
            child: Image.asset("assets/images/profile_pic.png")),
        Container(

          height: 40,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(MARGIN_MEDIUM)),
              border: Border.all(
                color: const Color.fromRGBO(0, 255, 106, 1),
                width: 1.0,
                style: BorderStyle.solid,
                // strokeAlign: StrokeAlign.inside
              ),
              gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromRGBO(0, 255, 106, 0.1),
                    Color.fromRGBO(0, 255, 106, 0.1)
                  ])),
          child: const Padding(
            padding: EdgeInsets.only(
                left: MARGIN_XLARGE,right: MARGIN_XLARGE,
                top: MARGIN_MEDIUM,bottom: MARGIN_MEDIUM),
            child: Text(
              textAlign:TextAlign.center,
              "Login or Sign Up",
              style: TextStyle(
                  color: Color.fromRGBO(0, 255, 106, 1),
                  fontSize: TEXT_REGULAR_1X,
                  fontWeight: FontWeight.w600),
            ),
          ),
        )
      ],
    );
  }
}

class ProfileBackgroundImageView extends StatelessWidget {
  const ProfileBackgroundImageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/profile_bg.png",
      fit: BoxFit.cover,
    );
  }
}
