import 'package:courses_app/modules/authentication/registration/bloc/cubit.dart';
import 'package:courses_app/modules/authentication/registration/bloc/states.dart';
import 'package:courses_app/shared/components/components.dart';
import 'package:courses_app/shared/styles/colors.dart';
import 'package:courses_app/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class RegisterScreen extends StatelessWidget {
  var fNameCon=TextEditingController();
  var lNameCon=TextEditingController();
  var emailCon=TextEditingController();
  var passwordCon=TextEditingController();
  var validationKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationCubit,RegistrationStates>(
        listener: (context,state){},
        builder: (context,state){
          return Scaffold(
            backgroundColor: zeplinColors.paleLilac,
            body: SafeArea(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Form(
                          key: validationKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Sign up',style: black28),
                              SizedBox(
                                height: 15,
                              ),
                              defaultFormField(

                                  errorMsg: 'First name must not be empty',
                                  controller: fNameCon,
                                  hintText: 'Shams',
                                  labelText: 'First name',
                                  onSubmit: (value){
                                    if(validationKey.currentState.validate()){}
                                  },
                                  keyboardType: TextInputType.name
                              ),

                              defaultFormField(

                                  errorMsg: 'Last name must not be empty',
                                  controller: lNameCon,
                                  hintText: 'Mahmoud',
                                  labelText: 'Last name',
                                  onSubmit: (value){
                                    if(validationKey.currentState.validate()){}
                                  },
                                  keyboardType: TextInputType.name
                              ),

                              defaultFormField(

                                  errorMsg: 'Email must not be empty',
                                  controller: emailCon,
                                  hintText: 'shams@gmail.com',
                                  labelText: 'Email',
                                  onSubmit: (value){
                                    if(validationKey.currentState.validate()){}
                                  },
                                  keyboardType: TextInputType.emailAddress
                              ),

                              defaultFormField(
                                togglePassword: (){
                                  RegistrationCubit.get(context)
                                      .togglePassword();
                                },
                                  errorMsg: 'Password must not be empty',
                                  controller: passwordCon,
                                  hintText: '**********',
                                  labelText: 'Password',
                                  onSubmit: (value){
                                    if(validationKey.currentState.validate()){}
                                  },
                                  icon: RegistrationCubit.get(context).showPass
                                  ?Icons.visibility_off
                                  :Icons.visibility,
                                  isPassword: RegistrationCubit.get(context).showPass,
                                  keyboardType: TextInputType.visiblePassword
                              ),

                              SizedBox(
                                height: 30,
                              ),
                              defaultButton(
                                  color: zeplinColors.primary,
                                  highlightColor: zeplinColors.primaryDark,
                                  text: 'sign up',
                                  textColor: white14,
                                  press: (){
                                    if(validationKey.currentState.validate()){

                                      RegistrationCubit.get(context)
                                          .userRegister(
                                        context: context,
                                        password: passwordCon.text,
                                        email: emailCon.text,
                                        fName: fNameCon.text,
                                        lName: lNameCon.text
                                      );

                                    }

                                  }
                              ),
                              SizedBox(
                                height: 20,
                              ),

                              defaultButton(
                                  color: zeplinColors.paleLilac,
                                  highlightColor: zeplinColors.primaryDark,
                                  text: 'login',
                                  textColor: white14.copyWith(
                                      color: zeplinColors.primary
                                  ),
                                  borderColor: zeplinColors.primary,
                                  press: (){
                                    Navigator.pop(context);
                                  }
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Center(child: Text('Forgot your password ?',style: black16)),
                            ],

                          ),
                        ),
                      ),
                    ),
                    if(RegistrationCubit.get(context).isLoading)
                      CircularProgressIndicator()

                  ],
                )),
          );
        },
    );
  }
}
