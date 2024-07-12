import 'package:get/get.dart';
import 'package:getx_mvvm/Data/Responce/Status.dart';
import 'package:getx_mvvm/Model/Home/Userlist_model.dart';
import 'package:getx_mvvm/Repositories/Userslist_repository.dart';

class Userlistcontroller extends GetxController {
  final _api = Userlist_Repository();

  final rxRequestStatus = Status.LOADING.obs;
  final userlist = Userlistmodel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setuserlist(Userlistmodel _value) => userlist.value = _value;
  void seterror(String _value) => error.value = _value;

  // void Userlistapi() {
  //   _api.Userlistapipi().then((value) {
  //     setRxRequestStatus(Status.COMPLETED);
  //     setuserlist(value);
  //   }).onError((error, stackTrace) {
  //     setRxRequestStatus(Status.ERROR);
  //   });
  // }
  void Userlistapi() {
    _api.Userlistapipi().then((value) {
      if (value != null) {
        setRxRequestStatus(Status.COMPLETED);
        setuserlist(value);
      } else {
        // Handle the null case
        setRxRequestStatus(Status.ERROR);
        // Optionally, set some error message or log the error
        print('Received null user list');
      }
    }).onError((error, stackTrace) {
      setRxRequestStatus(Status.ERROR);
      seterror(error.toString());
      print(stackTrace);
      // Optionally, log the error
      print('Error fetching user list: $error');
    });
  }
}
