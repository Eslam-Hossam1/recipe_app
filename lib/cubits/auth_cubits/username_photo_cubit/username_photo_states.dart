abstract class UsernamePhotoStates {}

class UsernamePhotoLoadingState extends UsernamePhotoStates {}

class UsernamePhotoFailureState extends UsernamePhotoStates {
  String errMsg;
  UsernamePhotoFailureState({required this.errMsg});
}

class UsernamePhotoInitialState extends UsernamePhotoStates {}

class UsernamePhotoSuccessState extends UsernamePhotoStates {}
