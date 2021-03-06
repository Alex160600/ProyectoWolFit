import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wolfit_aplication/pages/home_page.dart';
import 'package:wolfit_aplication/providers/main_provider.dart';
import 'package:wolfit_aplication/theme/main_theme.dart';



void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context, listen: true);
    return FutureBuilder<bool>(
        future: mainProvider.getPreferences(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ScreenUtilInit(
                designSize: const Size(360, 690),
                builder: () => MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'WOLFIT',
                    theme: AppTheme.themeData(mainProvider.mode),
                    home: const HomePage()));
          }
          return const SizedBox.square(
              dimension: 50.0, child: CircularProgressIndicator());
        });
  }
}

