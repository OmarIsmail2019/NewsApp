
import 'package:bloc/bloc.dart';
import 'package:circle_bottom_navigation_bar/circle_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Layout/Cubit/state.dart';
import 'package:newsapp/module/BusinessScreen/BusinessScreen.dart';
import 'package:newsapp/module/GeneralScreen/GeneralScreen.dart';
import 'package:newsapp/module/HealthScreen/HealthScreen.dart';
import 'package:newsapp/module/ScienceScreen/ScienceScreen.dart';
import 'package:newsapp/module/SportsScreen/SportsScreen.dart';
import 'package:newsapp/module/TechnologyScreen/TechnologyScreen.dart';
import 'package:newsapp/network/remotly/dio_helper.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);
  int CurrentIndex = 0;
  List<Widget> screen = [
    GeneralScreen(),
    BusinessScreen(),
    SportsScreen(),
    HealthScreen(),
    ScienceScreen(),
    TechnologyScreen(),
  ];

  List<String> title = [
    'General',
    'Business',
    'Sports',
    'Health',
    'Science',
    'Technology',
  ];

  // List<BottomNavigationBarItem> bottomItems=[
  //   BottomNavigationBarItem(
  //     icon: Icon(
  //       Icons.home,
  //     ),
  //     label: 'General',
  //   ),
  //   BottomNavigationBarItem(
  //     icon: Icon(
  //       Icons.business,
  //     ),
  //     label: 'Business',
  //   ),
  //   BottomNavigationBarItem(
  //     icon: Icon(
  //       Icons.sports,
  //     ),
  //     label: 'Sports',
  //   ),
  //   BottomNavigationBarItem(
  //     icon: Icon(
  //       Icons.local_hospital_outlined,
  //     ),
  //     label: 'Health',
  //   ),
  //   BottomNavigationBarItem(
  //     icon: Icon(
  //       Icons.science,
  //     ),
  //     label: 'Science',
  //   ),
  //   BottomNavigationBarItem(
  //     icon: Icon(
  //       Icons.computer,
  //     ),
  //     label: 'Technology',
  //   ),
  // ];

  void changeBottomNavBar(int index) {
    CurrentIndex = index;
    if(index==1) getBusiness();
    if(index==2) getSports();
    if(index==3) getHealth();
    if(index==4) getScience();
    if(index==5) getTechnology();
    emit(NewsBottomNav());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsGetBusienessLoadingState());
    if(business.length==0){
      DioHelper.getData(url: 'v2/top-headlines',
          query: {
            'country': 'eg',
            'category': 'business',
            'apiKey': '1132cf748d9c40388c346780b5159934',
          }).then((value) {
        // print(value.data.toString());
        business=value.data['articles'];
        // print(business[0]['title']);
        emit(NewsGetBusienessSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetBusienessErrorState(error.toString()));
      });
    }
    else
      {
        emit(NewsGetBusienessSuccessState());
      }
  }
  List<dynamic> sport = [];

  void getSports() {
    emit(NewsGetSportsLoadingState());
  if(sport.length==0){
    DioHelper.getData(url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'sports',
          'apiKey': '1132cf748d9c40388c346780b5159934',
        }).then((value) {
      // print(value.data.toString());
      sport=value.data['articles'];
      // print(business[0]['title']);
      emit(NewsGetSportsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSportsErrorState(error.toString()));
    });
  }
  else
    {
      emit(NewsGetSportsSuccessState());
    }
  }
  List<dynamic> general = [];

  void getGeneral() {
    emit(NewsGetGeneralLoadingState());
   if(general.length==0){
     DioHelper.getData(url: 'v2/top-headlines',
         query: {
           'country': 'eg',
           'category': 'general',
           'apiKey': '1132cf748d9c40388c346780b5159934',
         }).then((value) {
       // print(value.data.toString());
       general=value.data['articles'];
       // print(business[0]['title']);
       emit(NewsGetGeneralSuccessState());
     }).catchError((error) {
       print(error.toString());
       emit(NewsGetGeneralErrorState(error.toString()));
     });
   }
   else{
     emit(NewsGetGeneralSuccessState());
   }
  }
  List<dynamic> health = [];

  void getHealth() {
    emit(NewsGetHealthLoadingState());
    if(health.length==0){
      DioHelper.getData(url: 'v2/top-headlines',
          query: {
            'country': 'eg',
            'category': 'health',
            'apiKey': '1132cf748d9c40388c346780b5159934',
          }).then((value) {
        // print(value.data.toString());
        health=value.data['articles'];
        // print(business[0]['title']);
        emit(NewsGetHealthSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetHealthErrorState(error.toString()));
      });
    }
    else{
      emit(NewsGetHealthSuccessState());
    }
  }
  List<dynamic> science = [];

  void getScience() {
    emit(NewsGetScienceLoadingState());
   if(science.length==0){
     DioHelper.getData(url: 'v2/top-headlines',
         query: {
           'country': 'eg',
           'category': 'science',
           'apiKey': '1132cf748d9c40388c346780b5159934',
         }).then((value) {
       // print(value.data.toString());
       science=value.data['articles'];
       // print(business[0]['title']);
       emit(NewsGetScienceSuccessState());
     }).catchError((error) {
       print(error.toString());
       emit(NewsGetScienceErrorState(error.toString()));
     });
   }
   else{
     emit(NewsGetScienceSuccessState());
   }
  }
  List<dynamic> technology = [];

  void getTechnology() {
    emit(NewsGetTechnologyLoadingState());
   if(technology.length==0){
     DioHelper.getData(url: 'v2/top-headlines',
         query: {
           'country': 'eg',
           'category': 'technology',
           'apiKey': '1132cf748d9c40388c346780b5159934',
         }).then((value) {
       // print(value.data.toString());
       technology=value.data['articles'];
       // print(business[0]['title']);
       emit(NewsGetTechnologySuccessState());
     }).catchError((error) {
       print(error.toString());
       emit(NewsGetTechnologyErrorState(error.toString()));
     });
   }
   else{
     emit(NewsGetTechnologySuccessState());
   }
  }

  List<dynamic> search = [];

  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q': '$value',
          'apiKey': '1132cf748d9c40388c346780b5159934',
        }).then((value) {
      // print(value.data.toString());
      search=value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }
}