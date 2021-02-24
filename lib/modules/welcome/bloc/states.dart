abstract class WelcomeStates{}

class WelcomeStateInit extends WelcomeStates{}
class WelcomeStateLoading extends WelcomeStates{}
class WelcomeStateSuccess extends WelcomeStates{}
class WelcomeStateError extends WelcomeStates{
  var error;
  WelcomeStateError(error){
    this.error=error;
  }
}