import 'package:flutter/material.dart';
import 'package:vaccination_managment_app/widgets/layout_template/animated_background_container.dart';
import 'package:vaccination_managment_app/widgets/layout_template/centered_view.dart';
import 'package:vaccination_managment_app/widgets/layout_template/layout_app_bar.dart';

class LayoutTemplate extends StatelessWidget {
  const LayoutTemplate({
    Key? key,
    required this.screenName,
    required this.child,
  }) : super(key: key);

  final String screenName;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: LayoutAppBar(
        title: screenName,
      ),
      body: AnimatedBackgroundContainer(
        child: CenteredView(child: child),
      ),
    );
  }
}
