import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List properties;
  const Failure([this.properties = const <dynamic>[]]);
  @override
  List get props => properties;
}

// General failures
class GenericFailure extends Failure {}

class ServerFailure extends Failure {
  final int? statusCode;
  final String? message;

  const ServerFailure({this.statusCode, this.message});
  @override
  List<Object?> get props => [statusCode, message];
}

class CacheFailure extends Failure {}

class NoInternetConnectionFailure extends Failure {}

class EmailNotVerifiedFailure extends Failure {}

class PlatformFailure extends Failure {
  final String? message;

  const PlatformFailure({this.message});

  @override
  List<Object?> get props => [message];
}
