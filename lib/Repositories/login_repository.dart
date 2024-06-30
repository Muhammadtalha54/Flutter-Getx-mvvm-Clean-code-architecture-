import 'package:getx_mvvm/Data/Network/Network_Api_services.dart';
import 'package:getx_mvvm/Resources/app_urls/urls.dart';
//repositories folder manages necessory api calling to the server
class loginRepository{

  final _apiServices= NetworkApiServices();


   Future<dynamic>loginApi(var data) async{

    dynamic responce=_apiServices.PostApi(data, Appurls.loginApi);
    return responce;


   }

}