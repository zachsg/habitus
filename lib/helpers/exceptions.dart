class NoAuthException implements Exception {}

class UserNotFoundException implements Exception {
  UserNotFoundException(this.message);
  final String message;
}

class GenericErrorException implements Exception {
  GenericErrorException(this.message);
  final String message;
}
