import 'package:getx_mvvm/Data/Responce/Status.dart';

class ApiResponce<T> {
  Status? status;
  String? message;
  T? data;

  ApiResponce(this.status, this.data, this.message);

  ApiResponce.LOADING() : status = Status.LOADING;
  ApiResponce.COMPLETED(this.data) : status = Status.COMPLETED;
  ApiResponce.ERROR(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return 'status : $status  \n message:$message \n data:$data';
  }
}
