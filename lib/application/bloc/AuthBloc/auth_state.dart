part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthenticationUninitialized extends AuthState {}

class AuthenticationLoading extends AuthState {}

class AuthenticationUnauthenticated extends AuthState {}

class AuthenticationAuthenticated extends AuthState {}



// class LoggedIn extends AuthState {}

// class LoggedOut extends AuthState {}

// class AuthFailed extends AuthState {
//   final String errorMsg;

//   AuthFailed({required this.errorMsg});
// }
