import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/screens/indexscreen.dart';
import 'package:pokemon/utils/app_colors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Avenir',
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.kscaffoldBackgroundColor,
          iconTheme: IconThemeData(color: AppColors.kiconthemeColor),
        ),
        scaffoldBackgroundColor: AppColors.kscaffoldBackgroundColor,
      ),
      home: DeviceFrame(
        device: Devices.ios.iPhone13,

        isFrameVisible: true,
        orientation: Orientation.portrait,
        screen: const IndexScreen(),
      ),
    );
  }
}
