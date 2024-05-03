import 'package:flutter/material.dart';
import 'package:vaccination_managment_app/views/profile/profile_screen.dart';
import 'package:vaccination_managment_app/views/vaccines/vaccines_screen.dart';
import 'package:vaccination_managment_app/widgets/layout_template/layout_template_elements/background_image.dart';
import 'package:vaccination_managment_app/widgets/layout_template/layout_template_elements/blur_effect.dart';
import 'package:vaccination_managment_app/widgets/layout_template/layout_template_elements/layout_app_bar.dart';

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
      backgroundColor: const Color(0xFF2F4858),
      extendBodyBehindAppBar: true,
      appBar: LayoutAppBar(
        title: activePageTitle,
      ),
      body: Stack(
        children: [
          const BackgroundImage(),
          const BlurEffect(),
          activePage,
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: const Color(0xFF2F4858),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: const Color(0xFF2F4858),
          onTap: selectPage,
          currentIndex: _selectedPageIndex,
          selectedItemColor: const Color(0xFF00CB94),
          unselectedItemColor: const Color.fromARGB(255, 0, 102, 75),
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
      ),
    );
  }
}
