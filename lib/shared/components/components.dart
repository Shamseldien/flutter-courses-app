import 'package:courses_app/models/courses_model.dart';
import 'package:courses_app/models/single_course_model.dart';
import 'package:courses_app/modules/authentication/registration/registration_screen.dart';
import 'package:courses_app/modules/single_course/single_course.dart';
import 'package:courses_app/modules/splash/bloc/cubit.dart';
import 'package:courses_app/modules/welcome/welcome.dart';
import 'package:courses_app/shared/const.dart';
import 'package:courses_app/shared/network/remote/helper.dart';
import 'package:courses_app/modules/authentication/login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:courses_app/shared/styles/colors.dart';
import 'package:courses_app/shared/styles/styles.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences preferences;

Future<void> initPref() async {
  return await SharedPreferences.getInstance().then((value) {
    preferences = value;
  });
}

saveToken(token) => preferences.setString(KEY_TOKEN, token);

getToken() => preferences.getString(KEY_TOKEN);

Widget defaultFormField(
        {errorMsg,
        controller,
        hintText,
        labelText,
        isPassword = false,
        icon,
        onSubmit,
        togglePassword,
        keyboardType}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20.0),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              blurRadius: 20, offset: Offset(0, 6), color: zeplinColors.grey)
        ]),
        child: TextFormField(
          controller: controller,
          validator: (value) {
            if (value.isEmpty) {
              return errorMsg;
            }
            return null;
          },
          onFieldSubmitted: onSubmit,
          keyboardType: keyboardType,
          obscureText: isPassword,
          decoration: InputDecoration(
            //contentPadding: EdgeInsets.all(5.0),
            labelText: labelText,
            labelStyle: grey16,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide(color: zeplinColors.primary)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide(color: Colors.transparent)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide(color: zeplinColors.grey)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            fillColor: zeplinColors.white,
            filled: true,
            hintText: hintText,
            hintStyle: grey12,
            suffixIcon: icon != null
                ? GestureDetector(
                    onTap: togglePassword,
                    child: Icon(
                      icon,
                      color: Colors.grey,
                    ),
                  )
                : null,
          ),
        ),
      ),
    );

Widget searchFormField({
  onPressed,
  controller,
  onSubmitted,
}) =>
    Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            blurRadius: 20, offset: Offset(0, 6), color: zeplinColors.grey)
      ]),
      child: TextFormField(
          controller: controller,
          onFieldSubmitted: onSubmitted,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(color: zeplinColors.primary)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(color: Colors.transparent)),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(color: zeplinColors.grey)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              fillColor: zeplinColors.white,
              filled: true,
              hintText: 'Start search...',
              hintStyle: grey16,
              suffixIcon: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: zeplinColors.primary,
                      borderRadius: BorderRadius.circular(16)),
                  child: IconButton(
                      icon: Icon(
                        Icons.search,
                        color: zeplinColors.white,
                      ),
                      onPressed: onPressed)))),
    );

Widget searchBuildItems(Data dataModel) => GestureDetector(
      onTap: () {
        Get.to(SingleCourse(dataModel.id));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          )),
          child: Stack(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                    color: zeplinColors.blue,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage('${dataModel.image}'))),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: zeplinColors.dark.withOpacity(0.75),
                ),
                child: Text(
                  dataModel.title,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: white18.copyWith(
                    letterSpacing: 2,
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 60,
                    width: 80,
                    decoration: BoxDecoration(
                        color: zeplinColors.primary,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(60))),
                    child: Center(
                      child: IconButton(
                          icon: Icon(
                            Icons.add,
                            color: zeplinColors.white,
                          ),
                          onPressed: () {}),
                    ),
                  )),
              Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    height: 60,
                    width: 80,
                    decoration: BoxDecoration(
                        color: zeplinColors.primary,
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(60))),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Price',
                            style:
                                white18.copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            dataModel.price,
                            style: white14,
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );

Widget defaultButton(
        {highlightColor,
        color,
        borderColor = Colors.transparent,
        textColor,
        text,
        press}) =>
    Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
          border: Border.all(
            color: borderColor,
          )),
      child: MaterialButton(
          height: 48,
          highlightColor: highlightColor,
          color: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
          child: Text(
            text.toUpperCase(),
            style: textColor,
          ),
          onPressed: press),
    );

navigateTo({context, widget}) => Navigator.push(
    context, MaterialPageRoute(builder: (BuildContext context) => widget));

navigateToAndRemove({context, widget}) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (BuildContext context) => widget),
    (route) => false);

errorToast({text}) => Fluttertoast.showToast(
      msg: text,
      textColor: zeplinColors.white,
      backgroundColor: Colors.red,
      toastLength: Toast.LENGTH_LONG,
    );

successToast({text}) => Fluttertoast.showToast(
      msg: text,
      textColor: zeplinColors.white,
      backgroundColor: Colors.green,
      toastLength: Toast.LENGTH_LONG,
    );

Widget splashOne() => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image(image: AssetImage('images/image4.png')),
          ),
          Text(
            'Welcome to Courses',
            style: black28.copyWith(color: zeplinColors.yellow),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Build your overall ability with awesome courses straight on your device, anytime, anywhere by experience tutors',
            style: white16,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );

Widget splashTwo() => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image(image: AssetImage('images/image2.png')),
          ),
          SizedBox(
            height: 25.0,
          ),
          Text(
            'Learn',
            style: black28.copyWith(color: zeplinColors.yellow),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Grow with new skills needed for new jobs and opportunities',
            style: white16,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );

Widget splashThree() => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image(image: AssetImage('images/image3.png')),
          ),
          SizedBox(
            height: 25.0,
          ),
          Text(
            'Grow',
            style: black28.copyWith(color: zeplinColors.yellow),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Keeping growing with new courses as they are added.',
            style: white16,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );

Widget getStarted() => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image(image: AssetImage('images/certified.png')),
          ),
          Text(
            'Certificate',
            style: black28.copyWith(color: zeplinColors.yellow),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Leave with a certificate, more knowledgeable, wiser, more experienced right in the app.',
            style: white16,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: 45,
            width: double.infinity,
            child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                    side: BorderSide(width: 1, color: zeplinColors.paleLilac)),
                onPressed: () {
                  Get.to(Welcome());
                },
                child: Text(
                  'Get Started',
                  style: grey14,
                )),
          )
        ],
      ),
    );

Widget indicator({currentPage, context}) => Container(
      height: 8.0,
      width: 36,
      decoration: BoxDecoration(
          color: SplashCubit.get(context).currentIndex == currentPage
              ? zeplinColors.cyan
              : zeplinColors.white,
          borderRadius: BorderRadius.circular(6.0)),
    );

Widget categoriesItems({Data data}) => GestureDetector(

  onTap: (){
    Get.to(SingleCourse(data.id));
  },
  child:   Container(

        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(32),

          gradient: LinearGradient(

            colors: [Color(0xff9b5de5), zeplinColors.primaryDark],



            stops: [0, 1],



            begin: Alignment(-0.57, -0.82),



            end: Alignment(0.57, 0.82),



            // angle: 145,



            // scale: undefined,

          ),

          boxShadow: [

            BoxShadow(

                color: Color(0x1a301d46),

                offset: Offset(0, 7),

                blurRadius: 30,

                spreadRadius: 0)

          ],

        ),

        child: Stack(

          children: [

            Column(

              mainAxisAlignment: MainAxisAlignment.start,

              crossAxisAlignment: CrossAxisAlignment.center,

              mainAxisSize: MainAxisSize.min,

              children: [

                Container(

                  height: 100,

                  decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(30),

                      image: DecorationImage(

                          fit: BoxFit.cover,

                          image: NetworkImage(

                            data.image,

                          ))),

                ),

                SizedBox(

                  height: 5,

                ),

                Text(

                  data.title,

                  style: white16.copyWith(

                    letterSpacing: 2,

                  ),

                  textAlign: TextAlign.center,

                  maxLines: 2,

                  overflow: TextOverflow.ellipsis,

                ),

                SizedBox(

                  height: 15,

                ),

              ],

            ),

            Positioned(

              bottom: 0,

              right: 0,

              child: Container(

                height: 30,

                width: 80,

                decoration: BoxDecoration(

                    color: zeplinColors.pink,

                    borderRadius: BorderRadius.only(

                        bottomRight: Radius.circular(24),

                        topLeft: Radius.circular(24))),

                child: Center(

                    child: Text(

                      '${data.price} L:E',

                      style: white14,

                    )),

              ),

            )

          ],

        ),

      ),
);

Widget buildItem() => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        gradient: LinearGradient(
          colors: [Color(0xff9b5de5), zeplinColors.primaryDark],
          stops: [0, 1],
          begin: Alignment(-0.57, -0.82),
          end: Alignment(0.57, 0.82),
          // angle: 145,
          // scale: undefined,
        ),
        boxShadow: [
          BoxShadow(
              color: Color(0x1a301d46),
              offset: Offset(0, 7),
              blurRadius: 30,
              spreadRadius: 0)
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  'Daily goal',
                  style: white16,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  '2hrs - daily',
                  style: grey12,
                ),
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              '50%',
              style: grey14.copyWith(color: Colors.yellow),
            ),
            LinearPercentIndicator(
              lineHeight: 8,
              backgroundColor: Colors.yellow,
              progressColor: Colors.blue,
              percent: 0.5,
            )
          ],
        ),
      ),
    );

Widget profileItem(
        {color,
        text,
        icon,
        iconColor,
        coursesNum,
        avatarColor,
        textStyle = white16}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: color,
        boxShadow: [
          BoxShadow(
              color: Color(0x1a301d46),
              offset: Offset(0, 7),
              blurRadius: 30,
              spreadRadius: 0)
        ],
      ),
      child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: avatarColor,
                child: icon != null
                    ? Icon(
                        icon,
                        color: iconColor,
                      )
                    : Text(
                        '$coursesNum',
                        style: white20.copyWith(fontWeight: FontWeight.bold),
                      ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '$text',
                style: textStyle,
                textAlign: TextAlign.center,
              )
            ],
          )),
    );

Widget loadingWidget() => Center(
      child: SpinKitThreeBounce(
        color: zeplinColors.primaryDark,
        size: 30,
      ),
    );

Widget teachers(Teacher teacher) => Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(teacher.image),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '${teacher.firstName} ${teacher.lastName} ',
                    style: black16,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  if (teacher.active)
                    Icon(
                      Icons.verified,
                      color: Colors.blue,
                      size: 20,
                    )
                ],
              ),
              Text(
                teacher.email,
                style: black12,
              ),
            ],
          ),
        ],
      ),
    );
