abstract class LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginFailureState extends LoginStates {
  String errMsg;
  LoginFailureState({required this.errMsg});
}

class LoginInitialState extends LoginStates {}

class LoginSuccessState extends LoginStates {}

class SendVerificationState extends LoginStates {}
