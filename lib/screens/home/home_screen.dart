import 'package:flutter/material.dart';

import '../../componenets/app_bar.dart';
import './main_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const bgColor = Colors.white;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: buildMainAppBar(context, color: bgColor),
      body: const MainBody(),
    );
  }
}
