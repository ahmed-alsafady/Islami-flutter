import 'package:flutter/material.dart';
import 'package:islam_task/core/services/local_storage_keys.dart';
import 'package:islam_task/core/services/local_storage_services.dart';

import '../../../Model/intro_model.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../../layout/pages/layout_page.dart';


class IntroPage extends StatefulWidget {
  const IntroPage({super.key});
  static String routeName = 'String/intro';

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> with TickerProviderStateMixin {
  late PageController _pageController;
  late TabController _tabController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    LocalStorageServices.setBool(LocalStorageKeys.isFirstTimeRun, false);
    _pageController = PageController(initialPage: 0);
    _tabController = TabController(length: IntroModel.introList.length, vsync: this);
  }

  void _updateCurrentPageIndex(int index) {
    setState(() {
      currentIndex = index;
      _tabController.index = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Centers horizontally
          children: [
            Image.asset(AppAssets.introHeader),
            SizedBox(
              height: size.height * 0.45,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _updateCurrentPageIndex,
                scrollDirection: Axis.horizontal,
                itemCount: IntroModel.introList.length,
                itemBuilder: (context, index) {
                  var currentIntro = IntroModel.introList[index];
                  return Image.asset(currentIntro.image);
                },
              ),
            ),
            Text(
              IntroModel.introList[currentIndex].title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryColor,
              ),
            ),
            Text(
              IntroModel.introList[currentIndex].subTitle,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryColor,
              ),
            ),
            Spacer(),
            Row(
              children: [
                Opacity(
                  opacity: currentIndex == 0 ? 0 : 1,
                  child: TextButton(
                    onPressed: () {
                      _updateCurrentPageIndex(currentIndex - 1);
                    },
                     style: TextButton.styleFrom(
                      foregroundColor: AppColors.primaryColor,
                    ),
                    child: Text("Back"),
                  ),
                ),
                Spacer(),
                TabPageSelector(
                  controller: _tabController,
                  color: AppColors.gray,
                  indicatorSize: 8,
                  selectedColor: AppColors.primaryColor,
                  borderStyle: BorderStyle.none,
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    currentIndex == IntroModel.introList.length - 1
                        ? Navigator.pushReplacementNamed(context, LayoutPage.routeName)
                        : _updateCurrentPageIndex(currentIndex + 1);
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.primaryColor,
                  ),
                  child: Text(currentIndex == IntroModel.introList.length - 1 ? "Finish" : "Next"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

