import 'package:alpha_twelve_app/data/tab_button_list.dart';
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
    return Scaffold(
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        // type: BottomNavigationBar,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.onSurface,
        selectedLabelStyle: GoogleFonts.ibmPlexSans(
          color: Theme.of(context).colorScheme.primary,
        ),
        unselectedLabelStyle: GoogleFonts.ibmPlexSans(color: Colors.black),
        showUnselectedLabels: true,
        items: [
          ...tabButtonList.map(
            (tabBtn) => BottomNavigationBarItem(
              icon: Container(
                // color:  Theme.of(context).colorScheme.primary,
                child: Image.asset(tabBtn.tabIcon),
              ),
              label: tabBtn.tabLabel,
            ),
          ),
        ],
      ),
    );
  }
}
