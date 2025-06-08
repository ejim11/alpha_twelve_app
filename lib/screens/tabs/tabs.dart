import 'package:alpha_twelve_app/data/tab_button_list.dart';
import 'package:alpha_twelve_app/models/tab_button_item.dart';
import 'package:alpha_twelve_app/screens/tabs/cart_screen.dart';
import 'package:alpha_twelve_app/screens/tabs/favourite_screen.dart';
import 'package:alpha_twelve_app/screens/tabs/home_screen.dart';
import 'package:alpha_twelve_app/screens/tabs/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const HomeScreen();

    switch (_selectedPageIndex) {
      case 0:
        activePage = const HomeScreen();
      case 1:
        activePage = const CartScreen();
      case 2:
        activePage = const FavouriteScreen();
      default:
        activePage = const ProfileScreen();
    }

    return Scaffold(
      body: activePage,
      backgroundColor: Theme.of(context).colorScheme.surface,
      bottomNavigationBar: Container(
        // decoration: BoxDecoration(
        //   // border: BoxBorder.fromLTRB(
        //   //   top: BorderSide(
        //   //     color: Theme.of(context).colorScheme.primaryContainer,
        //   //     width: 1,
        //   //   ),
        //   ),
        // ),
        child: BottomNavigationBar(
          currentIndex: _selectedPageIndex,
          onTap: _selectPage,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).colorScheme.surface,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Theme.of(context).colorScheme.onSurface,
          selectedLabelStyle: GoogleFonts.ibmPlexSans(
            color: Theme.of(context).colorScheme.primary,
          ),
          unselectedLabelStyle: GoogleFonts.ibmPlexSans(color: Colors.red),
          showUnselectedLabels: true,
          items: tabButtonList.asMap().entries.map((entry) {
            int index = entry.key;
            TabButtonItem tabBtn = entry.value;

            return BottomNavigationBarItem(
              icon: Container(
                width: 56,
                height: 32,
                decoration: BoxDecoration(
                  color: _selectedPageIndex == index
                      ? Theme.of(context).colorScheme.primary
                      : null,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image.asset(
                  tabBtn.tabIcon,
                  color: _selectedPageIndex == index
                      ? Colors.white
                      : Theme.of(context).colorScheme.onSurface,
                ),
              ),
              label: tabBtn.tabLabel,
            );
          }).toList(),
        ),
      ),
    );
  }
}
