abstract class SingleCourseStates{}
class SingleCourseInitState extends SingleCourseStates{}
class SingleCourseLoadingState extends SingleCourseStates{}
class SingleCourseSuccessState extends SingleCourseStates{}
class SingleCourseMoreDescState extends SingleCourseStates{}
class SingleCourseErrorState extends SingleCourseStates{
  var error;
  SingleCourseErrorState(error){
    this.error = error;
  }
}