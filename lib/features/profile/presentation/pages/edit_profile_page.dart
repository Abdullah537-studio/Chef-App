import 'package:chef_app/core/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(context, "Edit Profile"),
      body: Container(),
    );
  }
}
