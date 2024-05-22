// lib/features/user/domain/repositories/user_repository.dart
import 'package:dartz/dartz.dart';
import 'package:flutter_api/core/error/failures.dart';
import 'package:flutter_api/features/user/domain/entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> getUser(int id);
}
