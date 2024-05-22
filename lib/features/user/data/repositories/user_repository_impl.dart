// lib/features/user/data/repositories/user_repository_impl.dart
import 'package:dartz/dartz.dart';
import 'package:flutter_api/core/error/failures.dart';
import 'package:flutter_api/features/user/domain/entities/user.dart';
import 'package:flutter_api/features/user/domain/repositories/user_repository.dart';
import 'package:flutter_api/features/user/data/datasources/user_remote_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, User>> getUser(int id) async {
    try {
      final remoteUser = await remoteDataSource.getUser(id);
      return Right(remoteUser);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
