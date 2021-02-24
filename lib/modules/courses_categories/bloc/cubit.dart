import 'package:courses_app/modules/courses_categories/bloc/states.dart';
import 'package:courses_app/shared/components/components.dart';
import 'package:courses_app/shared/end_points.dart';
import 'package:courses_app/shared/network/remote/helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoursesCategoriesCubit extends Cubit<CoursesCategoriesStates>{
  CoursesCategoriesCubit():super(CoursesCategoriesInitState());

  static CoursesCategoriesCubit get(context)=>BlocProvider.of(context);

  List titles=[
    'All Courses',
    'Mobile',
    'Design',
    'Web',
    'Branding',
    'Code',
    'Business'
  ];

  getCategories(){
    emit(CoursesCategoriesLoadingState());
    DioHelper.getData(
     path: COURSES_END_POINT,
     token: getToken(),
    ).then((value){


      emit(CoursesCategoriesSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(CoursesCategoriesErrorState(error));
    });
  }



}