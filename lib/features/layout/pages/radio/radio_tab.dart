import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image:
        AssetImage(AppAssets.radioBg),
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
