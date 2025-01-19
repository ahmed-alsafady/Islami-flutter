import 'package:flutter/material.dart';
import 'package:islam_task/features/layout/pages/hadith/hadith_tab.dart';
import 'package:islam_task/features/layout/pages/quran/quran_tab.dart';
import 'package:islam_task/features/layout/pages/radio/radio_tab.dart';
import 'package:islam_task/features/layout/pages/sbha/sbha_tab.dart';
import 'package:islam_task/features/layout/pages/times/times_tab.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../widgets/custom_nav_bar_item.dart';

class LayoutPage extends StatefulWidget {
  static String routeName = "/layout";
  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    HadithTab(),
    SbhaTab(),
    RadioTab(),
    TimesTab()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    backgroundColor: Colors.transparent,
      bottomNavigationBar: BottomNavigationBar(
        items:
      [
        BottomNavigationBarItem(icon:CustomNavBarItem(selectedIndex: selectedIndex,navBarItem: 0,iconPath:AppAssets.quranIcon,),label: "Quran"),
        BottomNavigationBarItem(icon:CustomNavBarItem(selectedIndex: selectedIndex,navBarItem: 1,iconPath:AppAssets.hadithIcon,),label: "Hadith"),
        BottomNavigationBarItem(icon:CustomNavBarItem(selectedIndex: selectedIndex,navBarItem: 2,iconPath:AppAssets.sebhaIcon,),label: "Sebha"),
        BottomNavigationBarItem(icon:CustomNavBarItem(selectedIndex: selectedIndex,navBarItem: 3,iconPath:AppAssets.radioIcon,),label: "Radio"),
        BottomNavigationBarItem(icon:CustomNavBarItem(selectedIndex: selectedIndex,navBarItem: 4,iconPath:AppAssets.timesIcon,),label: "Times")

      ],


        type: BottomNavigationBarType.fixed,
        fixedColor: AppColors.white,
        backgroundColor: AppColors.primaryColor,
        showUnselectedLabels: false,
        currentIndex: selectedIndex,
        onTap: (int index) {
          selectedIndex = index;
          setState(() {});
        },
      ),
      body: tabs[selectedIndex],
    );
  }
}
