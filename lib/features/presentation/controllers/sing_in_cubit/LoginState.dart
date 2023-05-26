abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final String uId;

  LoginSuccessState(this.uId);
}

class LoginErrorState extends LoginState {
  final String error;

  LoginErrorState(this.error);
}

class ChangePasswordVisibilityState extends LoginState {}
class GetUserLoadingState extends LoginState {}
class GetUserSuccessState extends LoginState {}
class GetUserErrorState extends LoginState {
  final String error;

  GetUserErrorState(this.error);
}