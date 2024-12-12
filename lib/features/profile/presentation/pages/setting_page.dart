import 'package:chef_app/core/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(context, "setting"),
      body: Container(),
    );
  }
}
