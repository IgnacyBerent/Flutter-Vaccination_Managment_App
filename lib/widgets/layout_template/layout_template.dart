import 'package:flutter/material.dart';
import 'package:vaccination_managment_app/widgets/layout_template/layout_template_elements/background_image.dart';
import 'package:vaccination_managment_app/widgets/layout_template/layout_template_elements/blur_effect.dart';
import 'package:vaccination_managment_app/widgets/layout_template/layout_template_elements/layout_app_bar.dart';

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
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: LayoutAppBar(
        title: screenName,
      ),
      body: Stack(
        children: [
          const BackgroundImage(),
          const BlurEffect(),
          child,
        ],
      ),
    );
  }
}
