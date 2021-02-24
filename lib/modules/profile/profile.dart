import 'package:courses_app/models/user_info_model.dart';
import 'package:courses_app/modules/profile/bloc/cubit.dart';
import 'package:courses_app/modules/profile/bloc/states.dart';
import 'package:courses_app/shared/components/components.dart';
import 'package:courses_app/shared/styles/colors.dart';
import 'package:courses_app/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return BlocConsumer<ProfileCubit,ProfileStates>(
       listener: (context,state){},
       builder: (context,state){
         return  Scaffold(
           body: SafeArea(
             child: state is! ProfileStateLoading
             ?SingleChildScrollView(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   CircleAvatar(
                     radius: 53,
                     child: Container(
                       height: 100,
                       width: 100,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(50.0),
                         image: DecorationImage(
                           fit: BoxFit.cover,
                           image: NetworkImage('${UserInfo.getUserImage()??'https://www.shareicon.net/data/512x512/2017/01/06/868320_people_512x512.png'}')
                         )
                       ),
                     ),
                   ),
                   SizedBox(height: 10.0,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text('${UserInfo.getUserName()??'demo'}',style: black26,),
                       SizedBox(width: 5.0,),
                       Icon(Icons.edit_outlined,color: zeplinColors.primary,size: 18,),

                     ],
                   ),
                   SizedBox(height: 19.0,),
                   Text('${UserInfo.getUserEmail()??'email'}',style: black14,),
                   SizedBox(height: 10.0,),
                   GridView(
                     shrinkWrap: true,
                     physics: NeverScrollableScrollPhysics(),
                     padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                       crossAxisCount: 2,
                       mainAxisSpacing: 20,
                       crossAxisSpacing: 20,
                     ),
                     children: [
                       profileItem(
                           color: zeplinColors.primary,
                           text: 'My \n Courses',
                           coursesNum: '5'
                       ),
                       profileItem(
                           color: zeplinColors.blue,
                           text: 'My \n Favorite',
                           icon: Icons.favorite_outline,
                           iconColor: zeplinColors.blue,
                           avatarColor: zeplinColors.white
                       ),

                       profileItem(
                           color: zeplinColors.pink,
                           text: 'My \n Cart',
                           icon: Icons.shopping_basket_outlined,
                           iconColor: zeplinColors.pink,
                           avatarColor: zeplinColors.white
                       ),
                       profileItem(
                           color: zeplinColors.primaryDark,
                           text: 'My \n Reviews',
                           icon: Icons.star_half_outlined,
                           iconColor: zeplinColors.primaryDark,
                           avatarColor: zeplinColors.white
                       ),
                       profileItem(
                           color: zeplinColors.yellow,
                           text: 'Invite a friend',
                           icon: Icons.share,
                           iconColor: zeplinColors.white,
                           avatarColor: zeplinColors.dark,
                           textStyle: black16
                       ),
                       profileItem(
                           color: zeplinColors.white,
                           text: 'Help & support',
                           icon: Icons.help_outline_outlined,
                           iconColor: zeplinColors.white,
                           avatarColor: zeplinColors.primary,
                           textStyle: black16
                       ),


                     ],
                   )
                 ],
               ),
             )
         :Center(child: CircularProgressIndicator(),),
           ),
         );
       },
   );
  }
}
