abstract class LoginPageState {}

class InitialLoginpageState extends LoginPageState {}

class SuccesLoginState extends LoginPageState {}

class SuccesRegisterState extends LoginPageState {}

class LoadingState extends LoginPageState {}

class FailureState extends LoginPageState {
  String msg;

  FailureState(this.msg);
}
