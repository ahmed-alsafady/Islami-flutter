import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islam_task/core/services/local_storage_keys.dart';
import 'package:islam_task/core/services/local_storage_services.dart';
import 'package:islam_task/features/layout/pages/layout_page.dart';
import '../../../core/constants/app_assets.dart';
import '../../intro/pages/intro_page.dart';

class SplashPage extends StatefulWidget {
  static String routeName = 'splash';
  static final Duration _duration = Duration(
    microseconds: 1750,
  );
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
 @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 2),
        () {
        var isFirstTime = LocalStorageServices.getBool(LocalStorageKeys.isFirstTimeRun) ?? true ;
       isFirstTime ?  Navigator.pushReplacementNamed(context, IntroPage.routeName) : Navigator.pushReplacementNamed(context, LayoutPage.routeName) ;
        }

    );
  }
  @override
  Widget build(BuildContext context) {
    var  size = MediaQuery.of(context).size;
    return Container(

      decoration: BoxDecoration(
        image:DecorationImage(
            image: AssetImage(AppAssets.splashBg),
            fit: BoxFit.cover,
        ),
      ),
        child:Scaffold(
          backgroundColor: Colors.transparent,
          body:Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: FadeInDown(
                  child: Image.asset(
                    AppAssets.splashGlow,
                    height: size.height * 0.30,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top:size.height * 0.25),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: FadeInRight(
                    child: Image.asset(
                      AppAssets.splashLeftShape,
                      height: size.width * 0.50,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: size.height * 0.40),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: FadeInLeft(
                    child: Image.asset(
                      AppAssets.splashRightShape,
                      height: size.height * 0.25,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: FadeInUp(
                  child: Image.asset(
                    AppAssets.splashBrand,
                    height: size.height * 0.15,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: ZoomIn(
                  child: Image.asset(
                    AppAssets.splashLogo,
                    height: size.height * 0.25,
                  ),
                ),
              ),


            ],

          )
        )
    );
  }
}
