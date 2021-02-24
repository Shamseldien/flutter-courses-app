import 'package:courses_app/modules/authentication/login/bloc/cubit.dart';
import 'package:courses_app/modules/authentication/login/bloc/states.dart';
import 'package:courses_app/modules/authentication/registration/registration_screen.dart';
import 'package:courses_app/modules/forgot_password/forgot_password.dart';
import 'package:courses_app/shared/components/components.dart';
import 'package:courses_app/shared/styles/colors.dart';
import 'package:courses_app/shared/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
 var emailController = TextEditingController();
 var passwordController = TextEditingController();
 var validateKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
   return BlocConsumer<LoginCubit,LoginStates>(
       listener: (context,state){
         if(state is LoginStateError)
             errorToast(text: state.error.toString());
       },
       builder: (context,state){
         return Scaffold(
           backgroundColor: zeplinColors.paleLilac,
           body: SafeArea(
               child: Padding(
                 padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                 child: SingleChildScrollView(
                   child: Stack(
                     alignment: Alignment.center,
                     children: [
                       Form(
                         key: validateKey,
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text('Login',style: black28),
                             SizedBox(height: 40,),
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 defaultFormField(
                                     hintText: 'shams@gmail.com',
                                     labelText: 'Email',
                                     onSubmit: (value){
                                       if (validateKey.currentState.validate()) {}
                                     },
                                     keyboardType: TextInputType.emailAddress,
                                   errorMsg: 'Email must not be empty',
                                   controller: emailController
                                 ),
                                 defaultFormField(
                                     togglePassword: (){
                                       LoginCubit.get(context)
                                           .togglePassword();
                                     },
                                     errorMsg: 'Password must not be empty',
                                     controller: passwordController,
                                     hintText: '**********',
                                     labelText: 'Password',
                                     onSubmit: (value){
                                       if(validateKey.currentState.validate()){}
                                     },
                                     icon: LoginCubit.get(context).showPass
                                         ?Icons.visibility_off
                                         :Icons.visibility,
                                     isPassword: LoginCubit.get(context).showPass,
                                     keyboardType: TextInputType.visiblePassword
                                 ),
                                 SizedBox(
                                   height: 30,
                                 ),

                                 defaultButton(
                                     color: zeplinColors.primary,
                                     highlightColor: zeplinColors.primaryDark,
                                     text: 'login',
                                     textColor: white14,
                                     press: (){
                                      if(validateKey.currentState.validate()){
                                        LoginCubit.get(context).userLogin(
                                            email: emailController.text,
                                            password: passwordController.text,
                                          context: context
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
                                     text: 'sign up',
                                     textColor: white14.copyWith(
                                         color: zeplinColors.primary
                                     ),
                                     borderColor: zeplinColors.primary,
                                     press: (){
                                       navigateTo(
                                           context: context,
                                           widget: RegisterScreen()
                                       );
                                     }
                                 ),
                                 SizedBox(
                                   height: 30,
                                 ),
                                 GestureDetector(
                                   onTap: (){
                                     navigateTo(
                                       context: context,
                                       widget: ForgotPassword()
                                     );
                                   },
                                     child: Center(child: Text('Forgot your password ?',style: black16))),
                                 SizedBox(
                                   height: 20,
                                 ),

                               ],

                             ),
                           ],
                         ),
                       ),
                       if(LoginCubit.get(context).isLoading)
                         CircularProgressIndicator(),


                     ],
                   ),
                 ),
               )),
         );
       },
   );
  }
}
