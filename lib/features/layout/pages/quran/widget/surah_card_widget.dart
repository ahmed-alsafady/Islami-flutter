import 'package:flutter/material.dart';
import 'package:islam_task/core/constants/app_assets.dart';
import 'package:islam_task/core/theme/app_colors.dart';

import '../../../../../Model/quran_surah_model.dart';

class SurahCardWidget extends StatelessWidget {
  final QuranSurahModel surahData ;
   const SurahCardWidget({super.key, required this.surahData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            width: 50,
              height: 50,
              alignment: Alignment.center,
               decoration:BoxDecoration(
                 image:DecorationImage(image: AssetImage(AppAssets.surahNumberIcon))),
            child: Text("${surahData.suraNumber}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.white,
              fontSize: 14
            ),),
          ),
          SizedBox(width: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(surahData.suraNameEn,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.white
              ),),
            SizedBox(height: 6),
            Text("${surahData.suraVerses} Verses",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white
              ),
            )
          ],),
          Spacer(),
          Text(surahData.suraNameAr,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.white
          ),),


        ],
      ),
    );
  }
}
