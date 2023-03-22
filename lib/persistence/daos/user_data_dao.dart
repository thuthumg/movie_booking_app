import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_booking_app/data/vos/user_data_vo.dart';
import 'package:movie_booking_app/persistence/hive_constants.dart';

class UserDataDao{


  static final UserDataDao _singleton =
  UserDataDao._internal();

  factory UserDataDao(){
    return _singleton;
  }

  UserDataDao._internal();

  void saveUserData(UserDataVO userDataVO) async{
    return getUserDataBox().put(userDataVO.id, userDataVO);
  }


  // UserDataVO? getUserDataByToken(String userToken){
  //   return getUserDataBox().values
  //       .where((data) => data.userToken == userToken).toList().first;
  // }

  UserDataVO? getUserDataByToken(){

    if (getUserDataBox().isEmpty) {
      return null; // or return a default value
    } else {
      return getUserDataBox().values.toList().first;
    }

  }

  Box<UserDataVO> getUserDataBox(){
    return Hive.box<UserDataVO>(BOX_NAME_USER_DATA_VO);
  }

  void deleteBox(){
    getUserDataBox().delete('BOX_NAME_USER_DATA_VO');
  }
}