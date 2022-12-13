import 'package:bloc/bloc.dart';
import 'package:circle_bottom_navigation_bar/circle_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Layout/Cubit/NewsLayout.dart';
import 'package:newsapp/Layout/Cubit/cubit.dart';
import 'package:newsapp/module/Login/LoginScreen.dart';
import 'package:newsapp/module/SearchScreen/SearchScreen.dart';
import 'package:newsapp/network/remotly/dio_helper.dart';
import 'package:newsapp/shared/bloc_observe.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer=MyBlocObserver();
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>NewsCubit()..getBusiness()..getSports()..getTechnology()..getHealth()..getGeneral()..getScience(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.deepPurpleAccent,
            backwardsCompatibility: false,
            elevation: 1.0,
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              systemOverlayStyle:SystemUiOverlayStyle(
                statusBarColor: Colors.black,
                statusBarBrightness:Brightness.light,
              )
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.deepPurple,
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.white70,
          ),
          textTheme: TextTheme(
        bodyText1: TextStyle(
        fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        )
      )
      ),
        // darkTheme: ThemeData(
        //   scaffoldBackgroundColor: Colors.black12,
        //     primarySwatch: Colors.deepPurple,
        //     appBarTheme: AppBarTheme(
        //         backgroundColor: Colors.black12,
        //         backwardsCompatibility: false,
        //         elevation: 1.0,
        //         titleTextStyle: TextStyle(
        //           color: Colors.white,
        //           fontWeight: FontWeight.bold,
        //           fontSize: 20,
        //         ),
        //         systemOverlayStyle:SystemUiOverlayStyle(
        //           statusBarColor: Colors.black12,
        //           statusBarBrightness:Brightness.light,
        //         )
        //     ),
        //     // bottomNavigationBarTheme: BottomNavigationBarThemeData(
        //     //   type: BottomNavigationBarType.fixed,
        //     //   selectedItemColor: Colors.white70,
        //     //   unselectedItemColor: Colors.grey,
        //     //   backgroundColor: Colors.black,
        //     //   elevation: 20.0,
        //     // ),
        //   textTheme: TextTheme(
        //         bodyText1: TextStyle(
        //           fontSize: 16,
        //           fontWeight: FontWeight.w600,
        //           color: Colors.white,
        //         )
        //   )
        // ),
        // themeMode: ThemeMode.light,
        home:LoginScreen() ,
      ),
    );
  }
}

