import 'package:courses_app/shared/styles/colors.dart';
import 'package:courses_app/shared/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:courses_app/shared/components/components.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: zeplinColors.paleLilac,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Welcome back, Allie.',style: black26,),
          ),
          Expanded(
            child: StaggeredGridView.countBuilder(
              crossAxisCount:2,
              physics: BouncingScrollPhysics(),
              itemCount: 6,
              padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
              itemBuilder: (BuildContext context, int index)=>buildItem(),
              staggeredTileBuilder: (int index) =>
               StaggeredTile.count(1, index.isEven ? 1.2: 1),
              mainAxisSpacing: 20.0,
              crossAxisSpacing: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}
