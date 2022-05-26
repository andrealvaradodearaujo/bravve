class GenericException implements Exception {}

class ServerException implements Exception {
  final int statusCode;
  final String message;

  ServerException({required this.statusCode, required this.message});
}

class CacheException implements Exception {}

class EmailNotVerifiedException implements Exception {}
