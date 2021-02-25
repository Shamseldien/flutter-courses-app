import 'dart:convert';

import 'package:courses_app/models/single_course_model.dart';
import 'package:courses_app/modules/single_course/bloc/states.dart';
import 'package:courses_app/shared/components/components.dart';
import 'package:courses_app/shared/end_points.dart';
import 'package:courses_app/shared/network/remote/helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleCourseCubit extends Cubit<SingleCourseStates>{
  SingleCourseCubit():super(SingleCourseInitState());
  static SingleCourseCubit get(context)=>BlocProvider.of(context);

Course data;
SingleCourseModel model;
Course courseDetails = new Course();

bool isExpanded = false;
  getCourseDetails({courseId}){
    emit(SingleCourseLoadingState());
    DioHelper.getData(
      path: SINGLE_COURSE_END_POINT,
      token: getToken(),
      data: null,
      query: {
        'course_id':courseId
      }
    ).then((value){
    //  print(value.data['result']['course']['title']);
      model =SingleCourseModel.fromJson(jsonDecode(value.toString()));
      courseDetails = model.result.course;
      print(courseDetails.title);
      emit(SingleCourseSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(SingleCourseErrorState(error));
    });
  }


  void expandText(){
    isExpanded=!isExpanded;
    emit(SingleCourseMoreDescState());
  }


}