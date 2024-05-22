// lib/features/user/domain/usecases/get_user.dart
import 'package:dartz/dartz.dart';
import 'package:flutter_api/core/error/failures.dart';
import 'package:flutter_api/core/usecase/usecase.dart';
import 'package:flutter_api/features/user/domain/entities/user.dart';
import 'package:flutter_api/features/user/domain/repositories/user_repository.dart';

class GetUser implements UseCase<User, Params> {
  final UserRepository repository;

  GetUser(this.repository);

  @override
  Future<Either<Failure, User>> call(Params params) async {
    return await repository.getUser(params.id);
  }
}

class Params {
  final int id;

  Params({required this.id});
}
