
import '../core/constants/app_assets.dart';

class IntroModel   {
  final String image;
  final String title;
  final String subTitle;

  IntroModel({required this.image, required this.title, required this.subTitle});
  
  static List<IntroModel> introList = [
    IntroModel(image: AppAssets.introFirst, title: "Welcome To Islmi App", subTitle: ""),
    IntroModel(image: AppAssets.introSecond, title: "Welcome To Islmi", subTitle: "We Are Very Excited To Have You In Our Community"),
    IntroModel(image: AppAssets.introThird, title: "Reading the Quran", subTitle: "Read, and your Lord is the Most Generous"),
    IntroModel(image: AppAssets.introFourth, title: "Bearish", subTitle: "Praise the name of your Lord, the Most High"),
    IntroModel(image: AppAssets.introFifth, title: "Holy Quran Radio", subTitle: "You can listen to the Holy Quran Radio through the application for free and easily")

  ];

}

