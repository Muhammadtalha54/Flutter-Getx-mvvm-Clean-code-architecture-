class AppExceptions implements Exception {
  final _prefix;
  final _message;

  AppExceptions([this._prefix, this._message]);

  String toString() {
    return '$_prefix$_message';
  }
}

class InternetExceptions extends AppExceptions {
  // this is just an example the text used will not be hard coded it will be added in the
  //localization and then it will be used in tyhe code
  InternetExceptions([String? message])
      : super(message, 'No Internet connection');
}

class RequestTimeout extends AppExceptions {
  RequestTimeout([String? message]) : super(message, 'Request timed out');
}

class ServerExceptions extends AppExceptions {
  ServerExceptions([String? message])
      : super(message, 'Server connection lost');
}

class InvalidurlExceptions extends AppExceptions {
  InvalidurlExceptions([String? message]) : super(message, 'Url is invalid');
}

class FetchdataExceptions extends AppExceptions {
  FetchdataExceptions([String? message]) : super(message, 'kk');
}
