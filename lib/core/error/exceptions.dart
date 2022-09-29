import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements Exception {
  final String? message;

  const ServerException([this.message]);

  @override
  List<Object?> get props => [message];

  @override
  String toString() => '$message';
}

class FetchDataException extends ServerException {
  // const FetchDataException([message]) : super("Error During Communication");
  const FetchDataException([super.message = 'Error During Communication']);
}

class BadRequestException extends ServerException {
  // const BadRequestException({message}) : super("Bad Request");
  const BadRequestException([super.message = 'Bad Request']);
}

class UnauthorizedException extends ServerException {
  // const UnauthorizedException([message]) : super("Unauthorized");
  const UnauthorizedException([super.message = 'Unauthorized']);
}

class NotFoundException extends ServerException {
  // const NotFoundException([message]) : super("Requested Info Not Found");
  const NotFoundException([super.message = 'Requested Info Not Found']);
}

class ConflictException extends ServerException {
  // const ConflictException([message]) : super("Conflict Occurred");
  const ConflictException([super.message = 'Conflict Occurred']);
}

class InternalServerErrorException extends ServerException {
  // const InternalServerErrorException([message])
  //     : super("Internal Server Error");
  const InternalServerErrorException([super.message = 'Internal Server Error']);
}

class NoInternetConnectionException extends ServerException {
  // const NoInternetConnectionException([message])
  //     : super("No Internet Connection");
  const NoInternetConnectionException([super.message = 'No Internet Connection']);
}

class CacheException implements Exception {}
