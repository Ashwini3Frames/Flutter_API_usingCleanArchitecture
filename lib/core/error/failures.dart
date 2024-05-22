// lib/core/error/failures.dart
abstract class Failure {
  final List<Object> properties;

  Failure([this.properties = const <Object>[]]);
}

class ServerFailure extends Failure {}
class CacheFailure extends Failure {}
