

import 'package:clean_architecture/presentation/resources/string_manager.dart';
import 'package:flutter/material.dart';

class SettingView extends StatefulWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  State<SettingView> createState() => SettingViewState();
}

class SettingViewState extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(AppStrings.setting),
    );
  }
}
