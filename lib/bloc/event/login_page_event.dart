abstract class LoginPageEvent {}

class Login extends LoginPageEvent {
  String email;
  String password;

  Login(this.email, this.password);
}

class Register extends LoginPageEvent {
  String name;
  String email;
  String password;

  Register(this.name, this.email, this.password);
}
