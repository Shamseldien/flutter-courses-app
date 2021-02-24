import 'package:courses_app/modules/courses_categories/bloc/cubit.dart';
import 'package:courses_app/modules/courses_categories/bloc/states.dart';
import 'package:courses_app/shared/styles/colors.dart';
import 'package:courses_app/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CoursesCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return BlocConsumer<CoursesCategoriesCubit,CoursesCategoriesStates>(
     listener: (context, state) {  },
     builder: (context, state) {
       var cubit = CoursesCategoriesCubit.get(context);
       return Scaffold(
         body: SafeArea(
             child: SingleChildScrollView(
               child: Padding(
                 padding: const EdgeInsets.all(20.0),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     StaggeredGridView.countBuilder(
                       crossAxisCount:2,
                       physics: BouncingScrollPhysics(),
                       itemCount: 7,
                       shrinkWrap: true,
                       itemBuilder: (BuildContext context, int index)=>categoriesItems(
                         title: cubit.titles[index]
                       ),
                       staggeredTileBuilder: (int index) =>
                           StaggeredTile.count(1, index.isEven ? 1.1: 0.9),
                       mainAxisSpacing: 25.0,
                       crossAxisSpacing: 25.0,
                     ),
                   ],
                 ),
               ),
             )),
       );
     },);
  }

  Widget categoriesItems({title})=> Container(
      decoration:  BoxDecoration(
        color: zeplinColors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [BoxShadow(
            color: Color(0x1a301d46),
            offset: Offset(0,7),
            blurRadius: 30,
            spreadRadius: 0

        ) ],

      ),
    child:  MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24)
      ),
      onPressed: (){

      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundColor: zeplinColors.primary,
            child: Icon(Icons.wb_incandescent_outlined,color: zeplinColors.white,),
          ),
          SizedBox(height: 15,),
          Text(title,
            style: black16.copyWith(letterSpacing: 2),
            textAlign: TextAlign.center,)
        ],
      ),
    ),
  );

}
