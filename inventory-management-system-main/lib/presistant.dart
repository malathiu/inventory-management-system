import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventorymanagement/home.dart';

import 'package:inventorymanagement/home.dart';
import 'package:inventorymanagement/tools.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'add.dart';


final user = FirebaseAuth.instance.currentUser;


//final user = App(AppConfiguration('application-0-wxtih',localAppName: "odkec")).currentUser;
class MyHomePage1 extends StatefulWidget {
  final String dropdownValue;
      List<CameraDescription>? cameras;
   MyHomePage1({required this.dropdownValue,required this.cameras});


  static const String routeName = "/signup";


  @override
  State<MyHomePage1> createState() => _MyHomePage1State();
}

class _MyHomePage1State extends State<MyHomePage1> {

  int _counter = 0;
  List<String> allv=['Home','','',''];
  List<String> selv=['Home','Add','Status','Profile'];

  @override
  Widget build(BuildContext context) {




    PersistentTabController _controller;

    _controller = PersistentTabController();


    return Scaffold(
      body: WillPopScope(
        onWillPop: ()async{

          // if(user!=null &&_controller.index==0){
          //   return false;
          // }
          // print(_controller.index);
          return true;
        },
        child: PersistentTabView(

          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          confineInSafeArea: true,
          backgroundColor: Colors.white, // Default is Colors.white.
          handleAndroidBackButtonPress: true,
          // Default is true.
          resizeToAvoidBottomInset: true,
          navBarHeight: 60,
          // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
          stateManagement: true, // Default is true.
          hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
          decoration: NavBarDecoration(
              gradient: LinearGradient(colors: [Colors.black,Colors.black]),
              borderRadius: BorderRadius.circular(0),
              colorBehindNavBar: Colors.white
          ),
          popAllScreensOnTapOfSelectedTab: false,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            curve: Curves.decelerate,
            duration: Duration(milliseconds: 100),
          ),
          navBarStyle: NavBarStyle.style10, // Choose the nav bar style with this property.
        ),
      ),
    );


  }
  List<Widget> _buildScreens() {
    return [
      Home(dropdownValue: widget.dropdownValue,cameras: widget.cameras), Tools(dropdownvalue:widget.dropdownValue,cameras: widget.cameras,)
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(

          icon: Icon(Icons.home),
          title: ("Home"),
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.white,
          activeColorSecondary: Colors.black
      ),



      PersistentBottomNavBarItem(
          icon: Icon(Icons.person,),
          title: ("Tools"),
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.white,
          activeColorSecondary: Colors.black
      ),
    ];
  }

}




