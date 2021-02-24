import 'package:courses_app/modules/authentication/login/login_screen.dart';
import 'package:courses_app/modules/authentication/registration/registration_screen.dart';
import 'package:courses_app/modules/welcome/bloc/cubit.dart';
import 'package:courses_app/modules/welcome/bloc/states.dart';
import 'package:courses_app/shared/components/components.dart';
import 'package:courses_app/shared/styles/colors.dart';
import 'package:courses_app/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = WelcomeCubit.get(context);
  return  BlocConsumer<WelcomeCubit,WelcomeStates>(
    listener: (context,state){},
    builder: (context,state){
      return Scaffold(
        backgroundColor: zeplinColors.paleLilac,
        body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    child: Text('Welcome to Courses',style: black26,
                      textAlign: TextAlign.center,),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Image(
                    height: 150,
                    width: 150,
                    image: AssetImage('images/logo.png'),
                  ),
                  SizedBox(
                    height: 45.0,
                  ),
                  defaultButton(
                      color: zeplinColors.primary,
                      text: 'login',
                      textColor: white14,
                      press: (){
                        Get.to(LoginScreen());
                      },
                      highlightColor: zeplinColors.primary
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  defaultButton(
                      borderColor: zeplinColors.primary,
                      text: 'sign up',
                      textColor: labelStyle,
                      press: (){
                        Get.to(RegisterScreen());
                      },
                      highlightColor: zeplinColors.primary
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text('Or login with',style: black14,),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(

                        onTap: (){
                          print('apple clicked');
                          cubit.loginWithApple();
                        },
                        child: CircleAvatar(
                          backgroundColor: zeplinColors.primary,
                          child: Image(
                            height: 40,
                            width: 40,
                            image: AssetImage('images/apple.png'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      GestureDetector(
                        onTap: (){
                          cubit.loginWithGoogle();
                        },
                        child: CircleAvatar(
                          backgroundColor: zeplinColors.primary,
                          child: Image(
                            height: 40,
                            width: 40,
                            image: AssetImage('images/google.png'),
                          ),
                        ),
                      ),


                    ],
                  ),
                ],
              ),
            )),
      );
    },
  );
  }

}


