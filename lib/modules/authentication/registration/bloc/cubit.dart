import 'dart:convert';

import 'package:courses_app/layouts/home_layout.dart';
import 'package:courses_app/modules/authentication/registration/bloc/states.dart';
import 'package:courses_app/shared/components/components.dart';
import 'package:courses_app/shared/end_points.dart';
import 'package:courses_app/shared/network/remote/helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationCubit extends Cubit<RegistrationStates>{
  RegistrationCubit() : super(RegistrationStateInitial());

  static RegistrationCubit get(context)=>BlocProvider.of(context);

  bool isLoading = false;
  bool showPass=true;
  togglePassword(){
    showPass=!showPass;
    emit(RegistrationStateShowPass());
  }

  userRegister({fName,lName,email,password,context}){
    emit(RegistrationStateLoading());
    isLoading=true;
    DioHelper.getData(
      path: REGISTER_END_POINT,
      data: {
        'email':email,
        'password':password,
        'first_name':fName,
        'last_name':lName
      }
    ).then((value) {
      print(value.toString());
    if(jsonDecode(value.toString())['message']=='Successfully created user!'){
      isLoading=false;
      successToast(
        text: jsonDecode(value.toString())['message']
      );
      navigateToAndRemove(context: context,widget: HomeLayout());
    }else{
      errorToast(
          text: jsonDecode(value.toString())['message']
      );
      //emit(RegistrationStateError(jsonDecode(value.toString())['message']));
    }
    emit(RegistrationStateSuccess());

    }).catchError((error){
      isLoading=false;
          print(error.toString());
      emit(RegistrationStateError(error.message));
    });

  }



}