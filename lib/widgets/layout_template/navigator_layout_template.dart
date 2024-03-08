import 'package:flutter/material.dart';
import 'package:vaccination_managment_app/views/home/home/home_screen.dart';
import 'package:vaccination_managment_app/views/home/profile/profile_screen.dart';
import 'package:vaccination_managment_app/views/home/vaccines/vaccines_screen.dart';
import 'package:vaccination_managment_app/widgets/layout_template/animated_background_container.dart';
import 'package:vaccination_managment_app/widgets/layout_template/centered_view.dart';
import 'package:vaccination_managment_app/widgets/layout_template/layout_app_bar.dart';

class NavigatorLayoutTemplate extends StatefulWidget {
  const NavigatorLayoutTemplate({
    Key? key,
  }) : super(key: key);

  @override
  State<NavigatorLayoutTemplate> createState() =>
      _NavigatorLayoutTemplateState();
}

class _NavigatorLayoutTemplateState extends State<NavigatorLayoutTemplate> {
  int _selectedPageIndex = 1;

  void selectPage(int index) => setState(() => _selectedPageIndex = index);

  @override
  Widget build(BuildContext context) {
    Widget activePage = HomeScreen(selectPage);
    String activePageTitle = 'Home';

    if (_selectedPageIndex == 2) {
      activePage = const VaccinesScreen();
      activePageTitle = 'Your trainings';
    } else if (_selectedPageIndex == 0) {
      activePage = const ProfileScreen();
      activePageTitle = 'Your profile';
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: LayoutAppBar(
        title: activePageTitle,
      ),
      body: AnimatedBackgroundContainer(
        child: CenteredView(child: activePage),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 0, 37, 25),
        onTap: selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.vaccines),
            label: 'Vaccines',
          ),
        ],
      ),
    );
  }
}
