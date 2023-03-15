import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:movie_booking_app/data/models/movie_booking_app_model.dart';
import 'package:movie_booking_app/data/models/movie_booking_app_model_impl.dart';
import 'package:movie_booking_app/network/api_constants.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/resources/strings.dart';
import 'package:movie_booking_app/viewitems/profile_list_item_view.dart';
import 'package:movie_booking_app/widgets/custom_button_view.dart';

class ProfilePage extends StatefulWidget {

  final String? profileImageLink;

  ProfilePage({Key? key,required this.profileImageLink}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();


}

class _ProfilePageState extends State<ProfilePage> {
 // MovieBookingAppModel movieBookingAppModel = MovieBookingAppModelImpl();
 // String profileImageLink = "";
 /* @override
  void initState() {
    movieBookingAppModel.getUserDataFromDatabase(paramTokenStr).then((userDataVO) {
      profileImageLink = userDataVO?.profileImage.toString()??"";
      print("string profile link ${profileImageLink}");
    }).catchError((error) {
      debugPrint(error.toString());
    });
    super.initState();
  }*/
  @override
  Widget build(BuildContext context) {

    print("string profile link ${widget.profileImageLink}");
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: PRIMARY_COLOR,
            child: Column(
              children: [
                ProfileView(profileImageLink: widget.profileImageLink),
                ProfileListView( (String titletxt)=>{
                  if(titletxt == "Logout")
                  _showMyDialog(context)
                })

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
  final Function(String) onTapProfileInfoItem;

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
                    (String titleTxt){
                  this.onTapProfileInfoItem(titleTxt);
                });
          }),
    );

  }
}

class ProfileView extends StatelessWidget {

  final String? profileImageLink;

  ProfileView({
    Key? key,
    required this.profileImageLink
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 220,
      child: Stack(
        children: [
          const Positioned.fill(
            child: ProfileBackgroundImageView(),
          ),
          Align(alignment: Alignment.center,
          child: ProfilePhoto_Login_SingUpView(
              profileImageLink:this.profileImageLink),)
        ],
      ),
    );
  }
}

class ProfilePhoto_Login_SingUpView extends StatelessWidget {
  final String? profileImageLink;

  ProfilePhoto_Login_SingUpView({
    Key? key,
    required this.profileImageLink
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    print("circle image = ${IMAGE_BASE_URL}${this.profileImageLink}");

    return Column(
      children: [
        const SizedBox(height: 10,),
        Container(
          padding: const EdgeInsets.only(top: MARGIN_CARD_MEDIUM_2,bottom: MARGIN_CARD_MEDIUM_2),
            width:100,
            height: 100,
            child:

            ClipOval(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.red,
                    width: 2.0,
                  ),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage('${IMAGE_BASE_URL}${profileImageLink}'),
                  ),
                ),
              ),
            ),



    // Image.asset("assets/images/profile_pic.png")
     ),
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
/* AlertDialog(
        title: Text('Alert'),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text('Are you sure you want to logout?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Yes'),
            onPressed: () {
              print('Confirmed');
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('No'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );*/

Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return
        AlertDialog(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: SECONDARY_COLOR),
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          backgroundColor: PRIMARY_COLOR,
          title: const Text(
            'Are you sure you want to logout?',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: TEXT_REGULAR_2X,
            ),
          ),
          content: Container(
            //  color: PRIMARY_COLOR,
            child:
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 50,
                  child: CustomButtonView(
                      buttonContainerBgColor: SECONDARY_COLOR,
                      buttonContainerHeight: LOGIN_PAGE_BUTTON_HEIGHT,
                      buttonContainerRadius: BORDER_RADIUS,
                      iconPadding: 0,
                      iconWidthHeight: 0,
                      textColor: Colors.black,
                      textDesc: "YES",
                      textFontSize: TEXT_REGULAR_2X,
                      iconPath: '',
                      isShowIcon: false, () async{
                    await Hive.deleteFromDisk();
                    paramTokenStr = "";
                    //Navigator.of(context).pop();
                  //  Navigator.of(context).pushNamedAndRemoveUntil('/log_in_page', (Route route) => false);
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  }),
                ),
                SizedBox(width: 20,),
                Container(
                  width: 50,
                  child: CustomButtonView(
                      buttonContainerBgColor: Colors.black,
                      buttonContainerHeight: LOGIN_PAGE_BUTTON_HEIGHT,
                      buttonContainerRadius: BORDER_RADIUS,
                      iconPadding: 0,
                      iconWidthHeight: 0,
                      textColor: SECONDARY_COLOR,
                      textDesc: "NO",
                      textFontSize: TEXT_REGULAR_2X,
                      iconPath: '',
                      isShowIcon: false, () {
                    Navigator.of(context).pop();
                  }),
                ),
              ],
            )

        ),
        );


    },
  );
}
