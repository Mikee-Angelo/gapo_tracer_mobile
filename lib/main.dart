import 'package:app/controller/provider/AuthProvider.dart';
import 'package:app/controller/provider/LogsProvider.dart';
import 'package:app/controller/provider/QrProvider.dart';
import 'package:app/controller/provider/StatsProvider.dart';
import 'package:app/model/ProfileModel.dart';
import 'package:app/settings.dart';
import 'package:app/view/Auth/Login.dart';
import 'package:app/view/Home.dart';
import 'package:app/view/QrScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  await Hive.openBox('profile');
  await Hive.openBox('token');

  GlobalConfiguration().loadFromMap(appSettings);
  runApp(Main());
}

class Main extends StatelessWidget {
  // This widget is the root of your application.
  var _profileBox = Hive.box('profile');

  Widget _home() {
    if (_profileBox.isEmpty) return Login();

    return Home();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => QrProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => LogsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => StatsProvider(),
        ),
      ],
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Contact Tracing App',
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(color: Colors.white),
                textTheme: TextTheme(
                  headline6: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              primarySwatch: Colors.blue,
              primaryColor: HexColor('#00C853'),
              scaffoldBackgroundColor: Colors.white,
            ),
            home: _home(),
          );
        },
      ),
    );
  }
}
