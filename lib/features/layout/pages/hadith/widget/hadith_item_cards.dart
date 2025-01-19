import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:islam_task/Model/hadith_data.dart';
import 'package:islam_task/core/constants/app_assets.dart';
import 'package:islam_task/core/theme/app_colors.dart';

class HadithItemCards extends StatelessWidget {
  final HadithData hadithData;
   HadithItemCards({super.key,required this.hadithData});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        bottom: 20
      ),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AppAssets.hadithCard),
       fit: BoxFit.fitHeight
       ),
      ),
      child: Column(
        children: [
          SizedBox(height: 40),
          Text(hadithData.hadithTitle,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 22,
            fontFamily: "Janna",
            fontWeight: FontWeight.bold,
            color: AppColors.black
          ),),
           Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children:[
                  Text(hadithData.hadithContent,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Janna",
                        fontWeight: FontWeight.bold,
                        color: AppColors.black
                    ),),
                SizedBox(height: 20),
                ]
              ),
            ),
          )
        ],
      ),
      );
  }
}
