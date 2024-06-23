class AppExceptions implements Exception {
  final _prefix;
  final _message;

  AppExceptions([this._prefix, this._message]);

  String toString() {
    return '$_prefix$_message';
  }
}

class InternetExceptions extends AppExceptions {
  InternetExceptions([String? message]) : super(message, 'No Internet');
}

class RequestTimeoutExceptions extends AppExceptions {
  RequestTimeoutExceptions([String? message]) : super(message, 'No Requests');
}

class ServerExceptions extends AppExceptions {
  ServerExceptions([String? message])
      : super(message, 'Server connection lost');
}
