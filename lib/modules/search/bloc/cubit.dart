import 'dart:convert';

import 'package:courses_app/models/courses_model.dart';
import 'package:courses_app/modules/search/bloc/states.dart';
import 'package:courses_app/shared/components/components.dart';
import 'package:courses_app/shared/end_points.dart';
import 'package:courses_app/shared/network/remote/helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchStates>{
  SearchCubit():super(SearchInitState());
  static SearchCubit get(context)=>BlocProvider.of(context);
  CoursesModel model;
  List<Data>dataModel=[];

  searchCourses({value}){
    emit(SearchLoadingState());
    DioHelper.getData(
      path: SEARCH_COURSES_END_POINT,
      token: getToken(),
      data: null,
      query: {
        'q':value,
        'type':1
      }
    ).then((value){
      model = CoursesModel.fromJson(jsonDecode(value.toString()));
      dataModel=model.result.data;
      emit(SearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(SearchErrorState(error));
    });
  }

}