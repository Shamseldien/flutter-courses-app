import 'package:courses_app/models/user_info_model.dart';
import 'package:courses_app/modules/profile/bloc/states.dart';
import 'package:courses_app/shared/components/components.dart';
import 'package:courses_app/shared/end_points.dart';
import 'package:courses_app/shared/network/remote/helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileStates>{
  ProfileCubit() : super(ProfileStateInit());
  static ProfileCubit get(context)=>BlocProvider.of(context);

  Map userInfo={};

  getUserInfo(){
    emit(ProfileStateLoading());
    DioHelper.getData(
      path:USER_END_POINT,
      token: getToken()
    ).then((value) {
      userInfo = value.data as Map;
      print( value.data as Map);
      UserInfo(data:value.data as Map );
      emit(ProfileStateSuccess());
    })
    .catchError((error){
      print(error.toString());
      emit(ProfileStateError(error));
    });
  }

}