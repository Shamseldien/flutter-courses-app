import 'package:courses_app/shared/components/components.dart';
import 'package:courses_app/shared/styles/colors.dart';
import 'package:courses_app/shared/styles/styles.dart';
import 'package:flutter/material.dart';
class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: zeplinColors.paleLilac,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,size: 18),
          onPressed: () {
            Navigator.pop(context);
          },),
        backgroundColor: zeplinColors.paleLilac,
        elevation: 0,
        iconTheme: IconThemeData(
          color: zeplinColors.dark
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Forgot Password',style: black26,),
              Spacer(),
              defaultFormField(
                hintText: 'Shams@gmail.com',
                labelText: 'email'
              ),
             Spacer(),
             Column(
               children: [
                 defaultButton(
                     color: zeplinColors.primary,
                     highlightColor: zeplinColors.primaryDark,
                     text: 'send reset code',
                     textColor: white12,
                     press: (){

                     }
                 ),
                 SizedBox(
                   height: 15,
                 ),
                 defaultButton(
                   press: (){
                     Navigator.pop(context);
                   },
                   textColor: black14,
                   text: 'login',
                 ),
                 SizedBox(
                   height: 15,
                 )
               ],
             )
            ],
          ),
        ),
      ),
    );
  }
}
