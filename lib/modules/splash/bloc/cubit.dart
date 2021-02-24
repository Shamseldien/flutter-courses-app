import 'package:courses_app/modules/splash/bloc/state.dart';
import 'package:courses_app/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashStates>{
  SplashCubit() : super(SplashInitState());

  static SplashCubit get(context)=>BlocProvider.of(context);

  int currentIndex=0;
  List splashPages=[
    splashOne(),
    splashTwo(),
    splashThree(),
    getStarted()
  ];



  changeIndex(index){
    currentIndex=index;
    emit(SplashChangePageState());
  }

}