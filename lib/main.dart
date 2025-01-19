import 'package:flutter/material.dart';
import 'package:islam_task/core/services/local_storage_services.dart';
import 'features/intro/pages/intro_page.dart';
import 'features/layout/pages/layout_page.dart';
import 'features/layout/pages/quran/quran_details_view.dart';
import 'features/splash/pages/splash_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await  LocalStorageServices.init();



  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashPage.routeName,
      routes: {
        SplashPage.routeName: (BuildContext _) {
          return SplashPage();
        },
        IntroPage.routeName: (BuildContext _) {
          return IntroPage();
        },
        LayoutPage.routeName: (BuildContext _) {
          return LayoutPage();
        },
        QuranDetailsView.routeName: (BuildContext _) {
          return QuranDetailsView();
        },
        
      },
    );
  }
}

