import 'package:courses_app/layouts/bloc/cubit.dart';
import 'package:courses_app/layouts/bloc/states.dart';
import 'package:courses_app/shared/styles/colors.dart';
import 'package:courses_app/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit=HomeCubit.get(context);
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          backgroundColor: zeplinColors.paleLilac,
          appBar: AppBar(
            title: Text(cubit.title[cubit.currentIndex],style: black18,),
            backgroundColor: zeplinColors.paleLilac,
            elevation: 2,
            actionsIconTheme: IconThemeData(color: zeplinColors.dark),
            actions: [
              IconButton(
                  icon: Icon(Icons.notifications_none_outlined), onPressed: () {})
            ],
          ),
          bottomNavigationBar: Container(
            clipBehavior: Clip.antiAlias,
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: zeplinColors.white,
              borderRadius: BorderRadius.circular(25.0),),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                onTap: (index){
                  cubit.changeIndex(index);
                },
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                backgroundColor:zeplinColors.white,
                selectedItemColor: zeplinColors.primary,
                unselectedItemColor: zeplinColors.dark,
                showUnselectedLabels: true,
                iconSize: 16,
                selectedLabelStyle: GoogleFonts.montserrat(
                    fontSize: 12
                ),
                unselectedLabelStyle: GoogleFonts.montserrat(
                    fontSize: 12
                ),
                items: [
                  BottomNavigationBarItem(icon: Icon(Icons.dashboard),label: 'Dashboard'),
                  BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search'),
                  BottomNavigationBarItem(icon: Icon(Icons.library_books),label: 'Courses'),
                  BottomNavigationBarItem(icon: Icon(Icons.person_outline),label: 'Profile'),
                  BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),

                ],
              ),
            ),
          ),
          body: cubit.pages[cubit.currentIndex],
        );
      },
    );
  }
}
