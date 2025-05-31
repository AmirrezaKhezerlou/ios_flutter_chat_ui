import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:modern_chat_ui/screens/dashboard/dashboard.dart';
import 'package:modern_chat_ui/utils/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    debugPaintBaselinesEnabled = false;
  debugPaintSizeEnabled = false;
    return GetCupertinoApp(
      showSemanticsDebugger: false,

      debugShowCheckedModeBanner: false,

      theme: ChatThemeClass.lightTheme,
      home: DashboardPage(),
    );
  }
}
