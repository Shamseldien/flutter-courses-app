import 'package:conditional_builder/conditional_builder.dart';
import 'package:courses_app/modules/search/bloc/cubit.dart';
import 'package:courses_app/modules/search/bloc/states.dart';
import 'package:courses_app/shared/components/components.dart';
import 'package:courses_app/shared/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:courses_app/shared/styles/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SearchCourses extends StatelessWidget {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit,SearchStates>(
      listener: (context, state) {  },
      builder: (context, state) {
        var cubit = SearchCubit.get(context);
        return Scaffold(
          body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text('Search Courses',style: black26,),
                    SizedBox(
                      height: 20,
                    ),
                    searchFormField(
                        controller: searchController,
                        onSubmitted: (value){
                          if(value.toString().isNotEmpty) {
                        cubit.searchCourses(value: value.toString());
                        searchController.text='';
                      }
                    },
                        onPressed: (){
                          if(searchController.text.isNotEmpty){
                            cubit.searchCourses(
                                value: searchController.text
                            );
                            searchController.text='';
                          }else{
                            errorToast(
                              text: 'Search field must not be empty'
                            );
                          }
                        }
                    ),
                    SizedBox(
                      height: 10,
                    ),
                   Expanded(
                      child: ConditionalBuilder(
                        condition: state is! SearchLoadingState,
                        builder:(ctx)=>ListView.builder(
                          shrinkWrap: true,
                          itemBuilder:((ctx,index)=>searchBuildItems(cubit.dataModel[index])),
                          itemCount: cubit.dataModel.length,),
                        fallback:(ctx)=> Center(child: loadingWidget(),),
                      ),
                    )
                  ],
                ),
              )),
        );
      },);
  }
}
