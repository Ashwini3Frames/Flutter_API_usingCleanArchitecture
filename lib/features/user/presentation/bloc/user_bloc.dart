import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_api/core/error/failures.dart';
import 'package:flutter_api/features/user/domain/entities/user.dart';
import 'package:flutter_api/features/user/domain/usecases/get_user.dart';
import 'package:dartz/dartz.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUser getUser;

  UserBloc({required this.getUser}) : super(Empty()) {
    on<GetUserEvent>((event, emit) async {
      emit(Loading());
      final failureOrUser = await getUser(Params(id: event.id));
      emit(_eitherLoadedOrErrorState(failureOrUser));
    });
  }

  UserState _eitherLoadedOrErrorState(Either<Failure, User> failureOrUser) {
    return failureOrUser.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (user) => Loaded(user: user),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server Failure';
      case CacheFailure:
        return 'Cache Failure';
      default:
        return 'Unexpected Error';
    }
  }
}
