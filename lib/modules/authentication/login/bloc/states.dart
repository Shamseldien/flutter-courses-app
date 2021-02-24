abstract class LoginStates {}
class LoginStateInitial extends LoginStates{}
class LoginStateLoading extends LoginStates{}
class LoginStateSuccess extends LoginStates{}
class LoginStateShowPass extends LoginStates{}
class LoginStateError extends LoginStates {
  var error;
  LoginStateError(error){
    this.error=error;
  }
}