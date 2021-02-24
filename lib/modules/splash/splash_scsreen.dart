import 'package:courses_app/modules/splash/bloc/cubit.dart';
import 'package:courses_app/modules/splash/bloc/state.dart';
import 'package:courses_app/modules/welcome/welcome.dart';
import 'package:courses_app/shared/components/components.dart';
import 'package:courses_app/modules/authentication/login/login_screen.dart';

import 'package:courses_app/shared/styles/colors.dart';
import 'package:courses_app/shared/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = SplashCubit.get(context);
    return BlocConsumer<SplashCubit,SplashStates>(
        listener: (context,state){},
        builder: (context,state){
          return Scaffold(
            backgroundColor: zeplinColors.primaryDark,
            body:Stack(
              alignment: Alignment.bottomCenter,
              children: [
                PageView.builder(
                  onPageChanged: (index){
                    cubit.changeIndex(index);
                  },
                  itemBuilder: (ctx,index)=>cubit.splashPages[index],
                  itemCount: cubit.splashPages.length,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 40.0
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: zeplinColors.white,
                            borderRadius: BorderRadius.circular(6.0)
                        ),
                        child: Row(
                          children:
                          List.generate(cubit.splashPages.length, (index) => indicator(context: context,currentPage: index)),
                        ),
                      ),
                      Spacer(),
                    if(cubit.currentIndex!=3)
                      GestureDetector(
                          onTap: (){
                            navigateToAndRemove(
                                context: context,
                                widget: Welcome()
                            );
                          },
                            child: Text('Skip',style: grey14,))

                    ],
                  ),
                )
              ],
            ),
          );
        },
    );
  }



}
