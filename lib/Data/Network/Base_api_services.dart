abstract class BaseApiAervices {
// this for fetching or getting data from an api
  Future<dynamic> getApi(String Url);

  // this is for post api

  Future<dynamic> PostApi(dynamic data, String Url);
}

//The code of GetApi post api del api etc will be written on time and will be
//the methods will be defined n the baseapi class then they will be extended into
// the network api class

//Benefit
//The code will be reusable can be written only 1 time and can be
//used to handle multiple apis  Moreover exceptions are also handled in the code
