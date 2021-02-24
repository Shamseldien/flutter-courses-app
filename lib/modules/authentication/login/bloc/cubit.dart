import 'dart:convert';

import 'package:courses_app/layouts/home_layout.dart';
import 'package:courses_app/modules/authentication/login/bloc/states.dart';
import 'package:courses_app/shared/components/components.dart';
import 'package:courses_app/shared/end_points.dart';
import 'package:courses_app/shared/network/remote/helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit() : super(LoginStateInitial());

  static LoginCubit get(context)=>BlocProvider.of(context);

  bool isLoading = false;
  bool showPass=true;
  togglePassword(){
    showPass=!showPass;
    emit(LoginStateShowPass());
  }

  userLogin({email,password,context}){
    emit(LoginStateLoading());
    isLoading=true;
    DioHelper.getData(
      path: LOGIN_END_POINT,
      data: {
        'username':email,
        'password':password,
        'grant_type': 'password',
        'client_id': '1',
        'client_secret': 'UFj2FJ7X2jQfSjtptUIadua4rb0yeZjKvVaS55T9',
      }
    ).then((value) {
      saveToken(jsonDecode(value.toString())['access_token']);
      print(getToken());
      isLoading=false;
      navigateToAndRemove(context: context,widget: HomeLayout());
      emit(LoginStateSuccess());
    }).catchError((error){
      isLoading=false;
          print(error.message);
      emit(LoginStateError(error.message));
    });

  }

}