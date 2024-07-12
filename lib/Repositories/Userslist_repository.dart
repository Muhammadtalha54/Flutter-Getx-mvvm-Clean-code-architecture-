import 'package:getx_mvvm/Data/Network/Network_Api_services.dart';
import 'package:getx_mvvm/Model/Home/Userlist_model.dart';
import 'package:getx_mvvm/Resources/app_urls/urls.dart';

class Userlist_Repository {
  final _apiServices = NetworkApiServices();

  // Future<Userlistmodel> Userlistapipi() async {
  //   dynamic responce =await _apiServices.getApi(Appurls.userlistapi);
  //   return Userlistmodel.fromJson(responce);
  // }

  Future<Userlistmodel?> Userlistapipi() async {
    try {
      dynamic response = await _apiServices.getApi(Appurls.userlistapi);
      if (response != null && response is Map<String, dynamic>) {
        return Userlistmodel.fromJson(response);
      } else {
        // Handle invalid response format
        print('Invalid response format');
        return null;
      }
    } catch (e) {
      // Handle exceptions such as network errors
      print('Error fetching user list: $e');
      return null;
    }
  }
}
