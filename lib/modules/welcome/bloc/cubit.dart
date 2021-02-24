
import 'package:courses_app/layouts/home_layout.dart';
import 'package:courses_app/modules/welcome/bloc/states.dart';
import 'package:courses_app/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class WelcomeCubit extends Cubit<WelcomeStates>{
  WelcomeCubit() : super(WelcomeStateInit());
  static WelcomeCubit get(context)=>BlocProvider.of(context);



  Future loginWithGoogle()async{
emit(WelcomeStateLoading());
    GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      final user =  await googleSignIn.signIn();

      if(user!=null){
        final auth = await user.authentication;

        final credintial = GoogleAuthProvider.credential(
            accessToken: auth.accessToken,
            idToken:auth.idToken
        );

        await FirebaseAuth.instance
            .signInWithCredential(credintial).then((value){
          saveToken(value.user.uid);
          print(value.user.email);
          Get.to(HomeLayout());
          emit(WelcomeStateSuccess());
        });

      }
    } catch (error) {
      emit(WelcomeStateError(error.toString()));
      print(error);
    }

  }


  signOutGoogle()async{
    GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    emit(WelcomeStateSuccess());
  }


  loginWithApple()async{
    SignInWithAppleButton(
      onPressed: () async {
        final credential = await SignInWithApple.getAppleIDCredential(
          scopes: [
            AppleIDAuthorizationScopes.email,
            AppleIDAuthorizationScopes.fullName,
          ],
        );

        print(credential);

      },
    );

  }
}


