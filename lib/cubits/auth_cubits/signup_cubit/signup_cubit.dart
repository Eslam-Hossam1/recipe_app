import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'signup_states.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    emit(SignUpLoadingState());
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();

      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(SignUpFailureState(errMsg: e.message ?? e.toString()));
      // } else if (e.code == 'wrong-password') {
      //   emit(SignUpFailureState(
      //       errMsg: 'Wrong password provided for that user.'));
      // }
    } catch (e) {
      emit(SignUpFailureState(errMsg: e.toString()));
    }
  }
}
