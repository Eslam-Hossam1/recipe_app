abstract class SignUpStates {}

class SignUpLoadingState extends SignUpStates {}

class SignUpFailureState extends SignUpStates {
  String errMsg;
  SignUpFailureState({required this.errMsg});
}

class SignUpInitialState extends SignUpStates {}

class SignUpSuccessState extends SignUpStates {}

class SendVerificationState extends SignUpStates {}
