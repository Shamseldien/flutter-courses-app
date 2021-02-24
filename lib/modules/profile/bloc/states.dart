abstract class ProfileStates {}
class ProfileStateInit extends ProfileStates{}
class ProfileStateLoading extends ProfileStates{}
class ProfileStateSuccess extends ProfileStates{}
class ProfileStateError extends ProfileStates{
  var error;
  ProfileStateError(error){
    this.error = error;
  }
}