import 'package:flutter/material.dart';
import 'package:islam_task/Model/recent_data.dart';
import 'package:islam_task/core/constants/app_assets.dart';
import 'package:islam_task/core/theme/app_colors.dart';

import '../../../../../Model/quran_surah_model.dart';

class RecentCard extends StatelessWidget {
  final QuranSurahModel recentData ;
  const RecentCard({super.key, required this.recentData});
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  recentData.suraNameEn,
                  style:TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black
                )),
                    Text(
           recentData.suraNameAr,
            style:TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.black
            ),),
                Text(
                 "${recentData.suraVerses} Verses",
                  style:TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black
                  ),
                )
              ],
            ),
          ),
          Image.asset(AppAssets.recentlyCard),
        ],
      ),
    );
  }
}
