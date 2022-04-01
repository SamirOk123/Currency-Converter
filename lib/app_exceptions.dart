class AppExceptions implements Exception {
  final message;
  final prefix;

  AppExceptions([this.message, this.prefix]);
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
      : super(message, 'Error during communication!');
}
