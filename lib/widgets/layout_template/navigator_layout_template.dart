import 'package:flutter/material.dart';
import 'package:vaccination_managment_app/views/profile/profile_screen.dart';
import 'package:vaccination_managment_app/views/vaccines/vaccines_screen.dart';
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
  int _selectedPageIndex = 0;

  void selectPage(int index) => setState(() => _selectedPageIndex = index);

  @override
  Widget build(BuildContext context) {
    Widget activePage = const ProfileScreen();
    String activePageTitle = 'Your profile';

    if (_selectedPageIndex == 1) {
      activePage = const VaccinesScreen();
      activePageTitle = 'Available vaccines';
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
        child: CenteredView(
          child: activePage,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 130, 201, 171),
        onTap: selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
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
