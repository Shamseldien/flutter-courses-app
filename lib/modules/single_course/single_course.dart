import 'package:conditional_builder/conditional_builder.dart';
import 'package:courses_app/modules/single_course/bloc/cubit.dart';
import 'package:courses_app/modules/single_course/bloc/states.dart';
import 'package:courses_app/shared/components/components.dart';
import 'package:courses_app/shared/styles/colors.dart';
import 'package:courses_app/shared/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SingleCourse extends StatelessWidget {
  var courseId;
  SingleCourse(this.courseId);
  @override
  Widget build(BuildContext context) {
    SingleCourseCubit.get(context)..getCourseDetails(courseId: courseId);
   return BlocConsumer<SingleCourseCubit,SingleCourseStates>(
     listener: ( context, state) {  },
     builder: ( context, state) {
       var cubit = SingleCourseCubit.get(context);
       return Scaffold(
         /*appBar: AppBar(
        backgroundColor: zeplinColors.paleLilac,
        iconTheme: IconThemeData(
          color: zeplinColors.dark
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.notifications_none_outlined),
              onPressed: (){})
        ],
      ),*/
         body: ConditionalBuilder(
             condition: state is! SingleCourseLoadingState,
             builder: (ctx)=>SingleChildScrollView(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Stack(
                     children: [
                       Container(
                         height: 300,
                         width: double.infinity,
                         decoration: BoxDecoration(
                             image: DecorationImage(
                                 fit: BoxFit.cover,
                                 image: NetworkImage('${cubit.courseDetails.image}')
                             ),
                             color: Colors.purple,
                             borderRadius: BorderRadius.only(
                               bottomRight: Radius.circular(20),
                               bottomLeft: Radius.circular(20),
                             )
                         ),
                       ),
                       Positioned(
                         bottom:0,
                         right: 0,
                         child: Container(
                             padding: EdgeInsets.all(15),
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.only(
                                   bottomRight: Radius.circular(20),
                                   topLeft: Radius.circular(25),
                                 ),
                                 color: zeplinColors.pink
                             ),
                             child: Center(child: Text(cubit.courseDetails.category.name,
                               style: white14,
                               overflow: TextOverflow.ellipsis,
                               maxLines: 1,
                               textAlign: TextAlign.center,))),
                       ),

                     ],
                   ),
                   Padding(
                     padding: const EdgeInsets.all(15.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(cubit.courseDetails.title,
                           overflow: TextOverflow.ellipsis,
                           maxLines: 2,
                           style: black20.copyWith(letterSpacing: 2),),
                         SizedBox(
                           height: 25,
                         ),
                         Text('Teachers',style: black20.copyWith(letterSpacing: 2,fontWeight: FontWeight.bold),),
                         ListView.builder(
                             shrinkWrap: true,
                             physics: NeverScrollableScrollPhysics(),
                             itemCount: cubit.courseDetails.teachers.length,
                             itemBuilder:(ctx,index)=>teachers(cubit.courseDetails.teachers[index]) ),
                         SizedBox(
                           height: 20,
                         ),
                         Text('Description',style: black20.copyWith(letterSpacing: 2,fontWeight: FontWeight.bold),),
                         SizedBox(
                           height: 10,
                         ),
                         Text('${cubit.courseDetails.description.replaceAll('\n', '')}',
                           maxLines: cubit.isExpanded ? null : 5,
                           style: grey14.copyWith(
                               color: zeplinColors.dark,
                               wordSpacing: 1,
                               height: 1.5
                           ),),
                         Center(
                             child: TextButton(
                                 child: Icon(
                                   !cubit.isExpanded
                                       ? Icons.keyboard_arrow_down_outlined
                                       :Icons.keyboard_arrow_up_outlined,
                                   size: 30,
                                 ), onPressed: (){
                               cubit.expandText();
                             }))

                       ],
                     ),
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Padding(
                         padding: const EdgeInsets.symmetric(
                             horizontal: 10
                         ),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text('Price',style: black20.copyWith(fontWeight: FontWeight.bold),),
                             Text('${cubit.courseDetails.price} L:E',style: black14,),
                           ],
                         ),
                       ),
                       MaterialButton(
                           splashColor: zeplinColors.pink,
                           shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.only(
                                 topLeft: Radius.circular(50),
                               )
                           ),
                           height: 50,
                           color: zeplinColors.primaryDark,
                           child: Padding(
                             padding:  EdgeInsets.all(8.0),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               mainAxisSize: MainAxisSize.min,
                               children: [
                                 Icon(Icons.shopping_cart_outlined,color: zeplinColors.white,),
                                 SizedBox(
                                   width: 5,
                                 ),
                                 Text('Add To Cart',style: white16,)
                               ],
                             ),
                           ),
                           onPressed: (){}),
                     ],
                   )
                 ],
               ),
             ),
           fallback:(ctx)=> loadingWidget(),
         ),
       );
     },);
  }

}
