import 'package:flutter/material.dart';
import 'package:recode/page/calender_screen.dart';
import 'package:intl/date_symbol_data_local.dart' ;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ko_KR', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalendarScreen(),
    );
  }
}
