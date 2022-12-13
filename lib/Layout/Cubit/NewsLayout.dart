import 'package:circle_bottom_navigation_bar/circle_bottom_navigation_bar.dart';
import 'package:circle_bottom_navigation_bar/widgets/tab_data.dart';
import 'package:curved_nav_bar/curved_bar/curved_action_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumping_bottom_nav_bar/jumping_bottom_nav_bar.dart';
import 'package:newsapp/Layout/Cubit/cubit.dart';
import 'package:newsapp/Layout/Cubit/state.dart';
import 'package:newsapp/module/BusinessScreen/BusinessScreen.dart';
import 'package:newsapp/module/GeneralScreen/GeneralScreen.dart';
import 'package:newsapp/module/HealthScreen/HealthScreen.dart';
import 'package:newsapp/module/ScienceScreen/ScienceScreen.dart';
import 'package:newsapp/module/SearchScreen/SearchScreen.dart';
import 'package:newsapp/module/SportsScreen/SportsScreen.dart';
import 'package:newsapp/module/TechnologyScreen/TechnologyScreen.dart';
import 'package:newsapp/network/remotly/dio_helper.dart';
import 'package:newsapp/shared/components/components.dart';

class NewsLayout extends StatefulWidget {
  @override
  _NewsLayoutState createState() => _NewsLayoutState();
}

class _NewsLayoutState extends State<NewsLayout> {
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
    'General Screen',
    'Business Screen',
    'Sports Screen',
    'Health Screen',
    'Science Screen',
    'Technology Screen',
  ];

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit, NewsState>(
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepPurpleAccent,
              title: Text(
                'News App',
              ),
              actions: [
                IconButton(icon: Icon(Icons.search), onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder:(context)=>SearchScreen()),);
                }),
              ],
            ),
            // drawer: Drawer(
            //   child: ListView(
            //     children: <Widget>[
            //       UserAccountsDrawerHeader(
            //         arrowColor: Colors.deepPurpleAccent,
            //         accountName: Text(
            //           'Omar Ismail',
            //           style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //             color: Colors.black,
            //             fontSize: 20,
            //           ),
            //         ),
            //         accountEmail: Text(
            //           'omar.bermawy2001@gmail.com',
            //           style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //             color: Colors.black,
            //             fontSize: 15,
            //           ),
            //         ),
            //         currentAccountPicture: CircleAvatar(
            //           backgroundImage: AssetImage('images/omar.jpg'),
            //         ),
            //         decoration: BoxDecoration(
            //             image: DecorationImage(
            //           image: AssetImage('images/news2.jpg'),
            //           fit: BoxFit.cover,
            //         )),
            //       ),
            //       ListTile(
            //         leading: Icon(Icons.person),
            //         title: Text(
            //           'Your Account',
            //           style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //             color: Colors.black,
            //             fontSize: 15,
            //           ),
            //         ),
            //         onTap: () {},
            //       ),
            //       ListTile(
            //         leading: Icon(Icons.share),
            //         title: Text(
            //           'Share',
            //           style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //             color: Colors.black,
            //             fontSize: 15,
            //           ),
            //         ),
            //         onTap: () {},
            //       ),
            //       ListTile(
            //         leading: Icon(Icons.star_rate),
            //         title: Text(
            //           'Rate',
            //           style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //             color: Colors.black,
            //             fontSize: 15,
            //           ),
            //         ),
            //         onTap: () {},
            //       ),
            //       ListTile(
            //         leading: Icon(Icons.settings),
            //         title: Text(
            //           'Settings',
            //           style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //             color: Colors.black,
            //             fontSize: 15,
            //           ),
            //         ),
            //         onTap: () {},
            //       ),
            //       ListTile(
            //         leading: Icon(Icons.logout),
            //         title: Text(
            //           'Logout',
            //           style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //             color: Colors.black,
            //             fontSize: 15,
            //           ),
            //         ),
            //         onTap: () {},
            //       ),
            //     ],
            //   ),
            // ),
            // body: cubit.screen[cubit.CurrentIndex],
            body: Stack(
              fit: StackFit.expand,
              children:<Widget> [
                Center(
                  child: Image.asset('images/news2.jpg',fit: BoxFit.cover,
                  ),
                ),
                cubit.screen[cubit.CurrentIndex],
              ],
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(left:15.0,right: 15,bottom: 10),
              child: CircleBottomNavigationBar(
                  initialSelection: CurrentIndex,
                  circleColor: Colors.deepPurpleAccent,
                  barBackgroundColor: Colors.white70,
                  textColor: Colors.black87,
                  activeIconColor: Colors.black,
                  inactiveIconColor: Colors.deepPurpleAccent,
                  barHeight: 75,
                  arcHeight: 75,
                  arcWidth: 50,
                  tabs: [
                    TabData(
                        icon: Icons.home,
                        iconSize: 24,
                        title: 'Home',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        onClick: () {
                          cubit.getGeneral();
                        }),
                    TabData(
                        icon: Icons.business,
                        iconSize: 24,
                        fontSize: 15,
                        title: 'Business',
                        fontWeight: FontWeight.bold,
                        onClick: () {
                          cubit.getBusiness();
                        }),
                    TabData(
                        icon: Icons.sports,
                        iconSize: 24,
                        fontSize: 15,
                        title: 'Sports',
                        fontWeight: FontWeight.bold,
                        onClick: () {
                          cubit.getSports();
                        }),
                    TabData(
                        icon: Icons.local_hospital_rounded,
                        iconSize: 24,
                        title: 'Health',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        onClick: () {
                          cubit.getHealth();
                        }),
                    TabData(
                        icon: Icons.science,
                        iconSize: 24,
                        title: 'Science',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        onClick: () {
                          cubit.getScience();
                        }),
                    TabData(
                        icon: Icons.computer,
                        iconSize: 24,
                        title: 'Technology',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        onClick: () {
                          cubit.getTechnology();
                        }),
                  ],
                  onTabChangedListener: (index) =>
                      cubit.changeBottomNavBar(index)),
            ),
          );
        },
        listener: (context, state) {},
      );
  }
}
