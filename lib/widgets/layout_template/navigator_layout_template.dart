import 'package:flutter/material.dart';
import 'package:vaccination_managment_app/views/calendar_screen/calendar_screen.dart';
import 'package:vaccination_managment_app/views/home/home_screen.dart';
import 'package:vaccination_managment_app/views/vaccines_screen/vaccines_screen.dart';
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
  int _selectedPageIndex = 1;

  void selectPage(int index) => setState(() => _selectedPageIndex = index);

  @override
  Widget build(BuildContext context) {
    Widget activePage = HomeScreen(selectPage: selectPage);
    String activePageTitle = 'Your profile';

    if (_selectedPageIndex == 2) {
      activePage = const VaccinesScreen();
      activePageTitle = 'Available Vaccines';
    } else if (_selectedPageIndex == 1) {
      activePage = HomeScreen(selectPage: selectPage);
      activePageTitle = 'Home';
    } else if (_selectedPageIndex == 0) {
      activePage = const CalendarScreen();
      activePageTitle = 'My Calendar';
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
          unselectedItemColor: const Color.fromARGB(255, 178, 189, 180),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'Calendar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Home',
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
