import 'package:chef_app/core/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';

class AddMealPage extends StatelessWidget {
  const AddMealPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(context, "Add Meal"),
      body: Container(),
    );
  }
}
