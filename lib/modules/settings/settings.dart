import 'package:flutter/material.dart';
import 'package:to_do_new/shared/styles/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'ShowLanguageBottomSheet.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        MediaQuery.of(context).size.width * 0.09,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Language'
                // AppLocalizations.of(context)!.language,
                // style: Theme.of(context).textTheme.subtitle2,
              ),
              Icon(Icons.arrow_downward),
            ],
          ),
          // SizedBox(height: 10),
          InkWell(
            onTap: () {
              ShowBottomSheetLanguage();
            },
            child: Container(
              margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
              decoration: BoxDecoration(
                color: MyThemeData.WhiteColor,
                border: Border.all(color: MyThemeData.primaryColor),
              ),
              child: Text(
                'English',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ),
          SizedBox(height: 15),

          Text(
            'Mode',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          // SizedBox(height: 10),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
              decoration: BoxDecoration(
                color: MyThemeData.WhiteColor,
                border: Border.all(color: MyThemeData.primaryColor),
              ),
              child: Text(
                'Light',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void ShowBottomSheetLanguage() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ShowLanguageBottomSheet();
        });
  }

  void ShowBottomSheetTheme() {}
}
