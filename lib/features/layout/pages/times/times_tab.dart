import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';

class TimesTab extends StatelessWidget {
  const TimesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
        image: DecorationImage(image:
        AssetImage(AppAssets.timeBg),
    fit: BoxFit.cover
    ),
    ),
        child: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(AppAssets.introHeader),
              ]
          ),
        )
    );
  }
}
