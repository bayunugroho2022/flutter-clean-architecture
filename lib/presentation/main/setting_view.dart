

import 'package:clean_architecture/app/app_prefs.dart';
import 'package:clean_architecture/injection.dart';
import 'package:clean_architecture/data/data_source/local_data_source.dart';
import 'package:clean_architecture/presentation/resources/asset_manager.dart';
import 'package:clean_architecture/presentation/resources/routes_manager.dart';
import 'package:clean_architecture/presentation/resources/string_manager.dart';
import 'package:clean_architecture/presentation/resources/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingView extends StatefulWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  State<SettingView> createState() => SettingViewState();
}

class SettingViewState extends State<SettingView> {
  final _appPreferences = instance<AppPreferences>();
  final _localDataSource = instance<LocalDataSource>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(AppPadding.p8),
        children: [
          ListTile(
            title: Text(
              AppStrings.changeLanguage,
              style: Theme.of(context).textTheme.headline4,
            ),
            leading: SvgPicture.asset(ImageAssets.changeLangIc),
            trailing: SvgPicture.asset(ImageAssets.settingsRightArrowIc),
            onTap: () {
              _changeLanguage();
            },
          ),
          ListTile(
            title: Text(
              AppStrings.contactUs,
              style: Theme.of(context).textTheme.headline4,
            ),
            leading: SvgPicture.asset(ImageAssets.contactUsIc),
            trailing: SvgPicture.asset(ImageAssets.settingsRightArrowIc),
            onTap: () {
              _contactUs();
            },
          ),
          ListTile(
            title: Text(
              AppStrings.inviteYourFriends,
              style: Theme.of(context).textTheme.headline4,
            ),
            leading: SvgPicture.asset(ImageAssets.inviteFriendsIc),
            trailing: SvgPicture.asset(ImageAssets.settingsRightArrowIc),
            onTap: () {
              _inviteFriends();
            },
          ),
          ListTile(
            title: Text(
              AppStrings.logout,
              style: Theme.of(context).textTheme.headline4,
            ),
            leading: SvgPicture.asset(ImageAssets.logoutIc),
            trailing: SvgPicture.asset(ImageAssets.settingsRightArrowIc),
            onTap: () {
              _logout();
            },
          )
        ],
      ),
    );
  }

  void _changeLanguage() {}

  void _contactUs() {}

  void _inviteFriends() {}

  void _logout() {
    _appPreferences.logout();
    _localDataSource.clearCache();
    Navigator.pushReplacementNamed(context, Routes.loginRoute);
  }
}
