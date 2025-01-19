import 'package:flutter/material.dart';
import 'package:islam_task/core/theme/app_colors.dart';

import '../../../../core/constants/app_assets.dart';

class SbhaTab extends StatefulWidget {
  const SbhaTab({super.key});

  @override
  State<SbhaTab> createState() => _SbhaTabState();
}

class _SbhaTabState extends State<SbhaTab> {
  int counter = 0;
  double angle = 0;
  int currentIndex = 0 ;
  List<String> list = ["لا الله الا الله", "الله اكبر","الحمد الله", "سبحان الله"];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(image:
          AssetImage(AppAssets.sebhaBg),
              fit: BoxFit.cover
          ),
        ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment:  CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.hadithLogo,height: size.height * 0.20,),
            SizedBox(height: 16),
              Center(
                child: Text(list[currentIndex],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: AppColors.white,
                    fontFamily: "Janna"
                  ),),
              ),
              Spacer(),
              Center(
                child: GestureDetector(
                  onTap: _onSebhaTap,
                  child: Stack(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: size.width * 0.35),
                          child: Image.asset(AppAssets.sebhaHeader,height: size.height * 0.10,)),
                      Container(
                          margin: EdgeInsets.only(top: size.height * 0.09),
                          child: Stack(
                              alignment: Alignment.center,
                              children:[
                            Transform.rotate(
                              
                              angle: angle,
                              child: Image.asset(AppAssets.sebhaBody,
                                width: size.width * 0.70,
                                height: size.width * 0.70,fit: BoxFit.fill,),
                            ),
                      Text(counter.toString(),
                        style: TextStyle(
                            fontFamily: "Janna",
                            fontSize: 40,
                            color: AppColors.white,
                            fontWeight: FontWeight.bold
                        ),),
                          ]
                          )
                      )
                    ],
                  ),
                ),
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
  _onSebhaTap() {
    counter++ ;
    angle -= 1;
    if(counter == 33) {
    counter = 0;
    currentIndex ++ ;
    if(currentIndex == 3) currentIndex = 0;
    }
    setState(() {

    });
  }
}
