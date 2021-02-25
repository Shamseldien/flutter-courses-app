abstract class CoursesCategoriesStates {}
class CoursesCategoriesInitState extends CoursesCategoriesStates{}
class CoursesCategoriesLoadingState extends CoursesCategoriesStates{}
class CoursesCategoriesSuccessState extends CoursesCategoriesStates{}
class CoursesCategoriesMoreState extends CoursesCategoriesStates{}
class CoursesCategoriesErrorState extends CoursesCategoriesStates{
  var error;
  CoursesCategoriesErrorState(error){
    this.error = error;
  }
}