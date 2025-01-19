import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islam_task/Model/hadith_data.dart';
import 'package:islam_task/Model/quran_surah_model.dart';
import 'package:islam_task/features/layout/pages/hadith/widget/hadith_item_cards.dart';

import '../../../../core/constants/app_assets.dart';

class HadithTab extends StatefulWidget {
   HadithTab({super.key});

  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
 List<HadithData> hadithDataList = [];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    if(hadithDataList.isEmpty) loadHadithData();
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image:
        AssetImage(AppAssets.hadithBg),
            fit: BoxFit.cover
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AppAssets.hadithLogo,height: size.height * 0.17,),
            Expanded(
              child: CarouselSlider(
                  items: hadithDataList.map((e) {
                    return HadithItemCards(hadithData: e,);
                  },).toList(),
                  options: CarouselOptions(
                    aspectRatio: 0.7,
                    viewportFraction: 0.68,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: false,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                     scrollDirection: Axis.horizontal,
                  )
              ),
            )

          ],
        ),
      ),
    );
  }

  Future loadHadithData() async {
    String content = (await rootBundle.loadString("assets/files/hadith/ahadeth.txt"));
    List<String> singleHadith = content.split("#");
    for(var element in singleHadith) {
      String singleHadith = element.trim();
     int index =  singleHadith.indexOf("\n");
     String hadithTitle = singleHadith.substring(0,index);
     String hadithContent = singleHadith.substring(index + 1);
     var hadithData = HadithData(hadithTitle: hadithTitle, hadithContent: hadithContent);
     hadithDataList.add(hadithData);
     setState(() {
     });
     // element.substring(start);
    }
   }
}
