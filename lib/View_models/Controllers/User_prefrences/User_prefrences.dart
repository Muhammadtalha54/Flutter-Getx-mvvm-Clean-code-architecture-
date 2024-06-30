import 'package:getx_mvvm/Model/Login/User_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPrefrences {
  //This function, `saveuser`, asynchronously saves a user token from the
  // `UserModel` to the device's shared preferences and returns `true`
  // once the token is stored. It retrieves an instance of `SharedPreferences`,
  //stores the token as a string under the key 'token', and then confirms successful
  // storage.

  Future<bool> saveuser(UserModel responcemodel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', responcemodel.token.toString());
    sp.setBool('islogin', responcemodel.islogin!);
    return true;
  }

//This function, `getuser`, asynchronously retrieves the user token from
//the device's shared preferences and returns a `UserModel` instance
//containing the retrieved token. It gets an instance of `SharedPreferences`,
//fetches the stored token string, and constructs a `UserModel` with the token.

  Future<UserModel> getuser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString('token');
    bool? islogin = sp.getBool('islogin');
    return UserModel(
      token: token,
      islogin: islogin,
    );
  }

  // function used to remove user from the sharedprefrences

  Future<bool> Removeuser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}
