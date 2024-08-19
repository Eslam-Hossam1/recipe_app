abstract class ForgotPasswordStates {}

class ForgotPasswordLoadingState extends ForgotPasswordStates {}

class ForgotPasswordFailureState extends ForgotPasswordStates {
  String errMsg;
  ForgotPasswordFailureState({required this.errMsg});
}

class ForgotPasswordInitialState extends ForgotPasswordStates {}

class ForgotPasswordSuccessState extends ForgotPasswordStates {}
