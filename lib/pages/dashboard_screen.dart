import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pixelfield_flutter/app_utils/app_colors.dart';
import 'package:pixelfield_flutter/app_utils/custom_styling.dart';
import 'scan_screen.dart';
import 'my_collections_screen.dart';
import 'shop_screen.dart';
import 'settings_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 1;

  final List<Widget> _screens = const [
    ScanScreen(),
    MyCollectionsScreen(),
    ShopScreen(),
    SettingsScreen(),
  ];

  String get title {
    switch (_selectedIndex) {
      case 0:
        return 'Scan';
      case 1:
        return 'My Collections';
      case 2:
        return 'Shop';
      case 3:
        return 'Settings';
      default:
        return '';
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left:8.0),
          child: Text(title, style: CustomStyling.headlineLarge),
        ),
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(Icons.notifications,size: 30,),
                Positioned(
                  right: 2,
                  top: 17,
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 5,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.primaryColor,
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: AppColors.inputText,
        ),
        child: BottomNavigationBar(
          backgroundColor: AppColors.primaryColor.withOpacity(0.5),
          elevation: 1,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.white,
          unselectedItemColor: AppColors.textColor1,
          selectedLabelStyle: const TextStyle(fontSize: 11),
          unselectedLabelStyle: const TextStyle(fontSize: 10),
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/Scan.svg'),
                label: 'Scan'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/SquaresFour.svg'),
                label: 'My Collections'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/bottle.svg'),
                label: 'Shop'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/GearSix.svg'),
                label: 'Settings'),
          ],
        ),
      ),
    );
  }
}
