import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/cubits/auth_cubits/login_cubit/login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    emit(LoginLoadingState());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(LoginFailureState(errMsg: e.message ?? e.toString()));
      // } else if (e.code == 'wrong-password') {
      //   emit(LoginFailureState(
      //       errMsg: 'Wrong password provided for that user.'));
      // }
    } catch (e) {
      emit(LoginFailureState(errMsg: e.toString()));
    }
  }

  Future<void> sendEmailVerification() async {
    emit(LoginLoadingState());
    try {
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      emit(SendVerificationState());
    } on Exception catch (e) {
      emit(LoginFailureState(errMsg: e.toString()));
    }
  }
}
