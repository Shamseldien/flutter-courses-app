import 'package:conditional_builder/conditional_builder.dart';
import 'package:courses_app/models/courses_model.dart';
import 'package:courses_app/modules/courses_categories/bloc/cubit.dart';
import 'package:courses_app/modules/courses_categories/bloc/states.dart';
import 'package:courses_app/shared/components/components.dart';
import 'package:courses_app/shared/styles/colors.dart';
import 'package:courses_app/shared/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class CoursesCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CoursesCategoriesCubit.get(context)..getCourses();
    return BlocConsumer<CoursesCategoriesCubit, CoursesCategoriesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CoursesCategoriesCubit.get(context);
        return Scaffold(
          body: SafeArea(
              child: ConditionalBuilder(
                  condition: state is! CoursesCategoriesLoadingState,
                  builder: (ctx)=>SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StaggeredGridView.countBuilder(
                            crossAxisCount: 2,
                            physics: BouncingScrollPhysics(),
                            itemCount: cubit.dataModel.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) =>
                                categoriesItems(
                                  data: cubit.dataModel[index]
                                ),
                            staggeredTileBuilder: (int index) =>
                                StaggeredTile.count(1, index.isEven ? 1.2 : 1.1),
                            mainAxisSpacing: 10.0,
                            crossAxisSpacing: 10.0,
                          ),
                          if (cubit.currentPage <= cubit.lastPage)
                            Center(
                                child: state is! CoursesCategoriesMoreState
                                    ? TextButton(
                                    onPressed: () {
                                      if (cubit.currentPage <= cubit.lastPage) {
                                        cubit.getMoreCourses();
                                      }
                                    },
                                    child: Text(
                                      'More Courses...',
                                      style: TextStyle(fontSize: 18),
                                    ))
                                    : loadingWidget())
                        ],
                      ),
                    ),
                  ),
                fallback: (ctx)=>loadingWidget(),
              )),
        );
      },
    );
  }


}
