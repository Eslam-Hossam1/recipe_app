import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'forgot_password_states.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordStates> {
  ForgotPasswordCubit() : super(ForgotPasswordInitialState());

  Future<void> sendPasswordResetEmail(String email) async {
    emit(ForgotPasswordLoadingState());
    emit(ForgotPasswordLoadingState());
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      emit(ForgotPasswordSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(ForgotPasswordFailureState(errMsg: e.message ?? e.toString()));
    } catch (e) {
      emit(ForgotPasswordFailureState(errMsg: e.toString()));
    }
  }
}
