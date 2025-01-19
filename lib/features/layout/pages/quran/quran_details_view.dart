import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islam_task/core/constants/app_assets.dart';
import 'package:islam_task/core/theme/app_colors.dart';

import '../../../../Model/quran_surah_model.dart';

class QuranDetailsView extends StatefulWidget {
  QuranDetailsView({super.key});

  static String routeName = "/QuranDetailsView";

  @override
  State<QuranDetailsView> createState() => _QuranDetailsViewState();
}

class _QuranDetailsViewState extends State<QuranDetailsView> {
  var versesList = [] ;

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as QuranSurahModel ;
    var size = MediaQuery.of(context).size;
   if(versesList.isEmpty) loadSurahDetails(args.suraNumber);
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          args.suraNameAr,
          style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
              fontFamily: "Janna",
              fontSize: 22),
        ),
        iconTheme: IconThemeData(color: AppColors.primaryColor),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              AppAssets.quranDetailsFooter,
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Image.asset(AppAssets.quranDetailsLeft,)),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      args.suraNameAr,
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Janna",
                          fontSize: 25),
                    ),
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: Image.asset(AppAssets.quranDetailsRight)),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.0),
                    child: ListView.builder(
                      itemBuilder: (context,index) => Text("[${index + 1}] ${versesList[index]}",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Janna",
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      itemCount: versesList.length,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future loadSurahDetails(int suraNumber) async {
   String content = (await rootBundle.loadString("assets/files/surah/$suraNumber.txt"));
   setState(() {
     versesList = content.split("\n");
   });
   }
}
