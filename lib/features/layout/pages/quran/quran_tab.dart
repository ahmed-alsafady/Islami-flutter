import 'package:flutter/material.dart';
import 'package:islam_task/Model/quran_surah_model.dart';
import 'package:islam_task/Model/recent_data.dart';
import 'package:islam_task/core/constants/app_assets.dart';
import 'package:islam_task/core/services/local_storage_keys.dart';
import 'package:islam_task/core/services/local_storage_services.dart';
import 'package:islam_task/core/theme/app_colors.dart';
import 'package:islam_task/features/layout/pages/quran/quran_details_view.dart';
import 'package:islam_task/features/layout/pages/quran/widget/recent_card.dart';
import 'package:islam_task/features/layout/pages/quran/widget/surah_card_widget.dart';
import '../../../../Model/quran_surah_model.dart';

class QuranTab extends StatefulWidget {
     QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  @override
  void initState() {
    super.initState();
    _loadRecentSuras();
  }
  List<QuranSurahModel> recentSurahModels = [
  ];
  List<QuranSurahModel> searchSurahList = [
  ];

  List<String> recentSuraIndexes = [];
  String searchQuery = "";
   @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image:
        AssetImage(AppAssets.quranBg),
          fit: BoxFit.cover
        ),
      ),
      child:  SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(AppAssets.introHeader),
                TextFormField(
                  onChanged: (String value) {
                    searchQuery = value;
                    search();
                    setState(() {});
                  },
                  cursorColor: AppColors.primaryColor,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color:AppColors.titleTextColor                ),
                  decoration: InputDecoration(
                    hintText: "Sura Name",
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color:AppColors.titleTextColor
                    ),
                    fillColor: AppColors.secondaryColor.withAlpha(200),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: AppColors.primaryColor
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: AppColors.primaryColor
                        )
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color:AppColors.secondaryColor
                        )
                    ),
                    prefixIcon:  Padding(
                      padding: EdgeInsets.all(8),
                      child: ImageIcon(
                        AssetImage(AppAssets.quranIcon),
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
                Visibility(
                    visible: searchQuery.isEmpty ? true : false ,
                    replacement: ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      separatorBuilder: (context,index) => Divider(endIndent: 60,indent: 60),
                      itemBuilder: (context,index) => GestureDetector (
                        onTap: () {
                          _onSuraTab( searchSurahList[index].suraNumber - 1);
                        },
                        child:SurahCardWidget(surahData: searchSurahList[index],),
                      ),

                      itemCount: searchSurahList.length,
                    ),
                    child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                      visible:  recentSurahModels.isEmpty ? false: true,
                      child: Padding(
                        padding: EdgeInsets.all(14),
                        child: Text("Most Recently",
                          style: TextStyle(
                              fontSize: 18,
                              color: AppColors.titleTextColor,
                              fontWeight: FontWeight.bold
                          ),),
                      ),
                    ),
                    SizedBox(
                      height: recentSurahModels.isEmpty ? 0 : 150,
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index) => GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context,QuranDetailsView.routeName,
                                arguments: recentSurahModels[index],
                              );
                            },
                            child: RecentCard(recentData: recentSurahModels[index])),
                        itemCount: recentSurahModels.length,
                        separatorBuilder: (BuildContext context, int index) => SizedBox(width: 16),

                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(14),
                      child: Text("Surah List",
                        style: TextStyle(
                            fontSize: 18,
                            color: AppColors.titleTextColor,
                            fontWeight: FontWeight.bold
                        ),),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      separatorBuilder: (context,index) => Divider(endIndent: 60,indent: 60),
                      itemBuilder: (context,index) => GestureDetector (
                        onTap: () {
                          _onSuraTab(QuranSurahModel.quranSurahList[index].suraNumber - 1);
                        },
                        child:SurahCardWidget(surahData: QuranSurahModel.quranSurahList[index],),
                      ),

                      itemCount: QuranSurahModel.quranSurahList.length,
                    )

                  ],
                ))


              ],
            ),
          ),
        ),
      ),
     );
  }
  _onSuraTab(int index) {
    _cacheSura(index);
    Navigator.of(context).pushNamed(
        QuranDetailsView.routeName,
        arguments: QuranSurahModel.quranSurahList[index]);
  }
  _cacheSura(int index) async {
     var indexString = index.toString();
     if (recentSuraIndexes.contains(indexString)) return;
     if(recentSuraIndexes.length == 5) {
       recentSuraIndexes.removeLast();
     }
        recentSuraIndexes.insert(0,indexString);
      await LocalStorageServices.setList(
         LocalStorageKeys.recentSuras,
         recentSuraIndexes);
     _loadRecentSuras();
     setState(() {});
  }
  _loadRecentSuras() {
     // LocalStorageServices.remove(LocalStorageKeys.recentSuras);
    recentSuraIndexes = [];
    recentSurahModels  = [];
    recentSuraIndexes = LocalStorageServices.getStringList(LocalStorageKeys.recentSuras) ?? [];
     for(var index in recentSuraIndexes) {
       var indexInt = int.parse(index);
       recentSurahModels.add(QuranSurahModel.quranSurahList[indexInt]);
     }
  }
  void search() {
     searchSurahList = [];
     for(var sura in QuranSurahModel.quranSurahList ) {
       if (sura.suraNameAr.toLowerCase().contains(searchQuery.toLowerCase()) || sura.suraNameEn.toLowerCase().contains(searchQuery.toLowerCase())) {
         searchSurahList.add(sura);
       }
     }
  }
}
