import 'package:bkdschool/bloc/chat_bloc/chat_bloc.dart';
import 'package:bkdschool/bloc/class_bloc/class_bloc.dart';
import 'package:bkdschool/bloc/user_bloc/user_bloc.dart';
import 'package:bkdschool/data/repos/ChatRepo.dart';
import 'package:bkdschool/data/repos/UserRepo.dart';
import 'package:bkdschool/screens/EntryScreen/EntryScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/material.dart';

import 'data/services/services.dart';
import 'zkaran/zmain.dart';

//Main
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initializeDateFormatting();
  await Hive.initFlutter();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => UserBloc(UserRepo())..add(UserRepoInit())),
        BlocProvider(create: (context) => ClassBloc()),
        BlocProvider(create: (context) => ChatBloc()),
      ],
      child: MaterialApp(
        title: "BKD School",
        debugShowCheckedModeBanner: false,
        navigatorKey: Globals.navigation,
        theme: ThemeData(
            textTheme: GoogleFonts.poppinsTextTheme(),
            brightness: Brightness.light,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            primaryColor: Globals.colorMain,
            accentColor: Globals.colorMain,
            textSelectionTheme:
                TextSelectionThemeData(cursorColor: Globals.colorMain)),
        home: Hschool(),
      ),
    );
  }
}
