abstract class RegistrationStates {}
class RegistrationStateInitial extends RegistrationStates{}
class RegistrationStateLoading extends RegistrationStates{}
class RegistrationStateSuccess extends RegistrationStates{}
class RegistrationStateShowPass extends RegistrationStates{}
class RegistrationStateError extends RegistrationStates {
  var error;
  RegistrationStateError(error){
    this.error=error;
  }
}