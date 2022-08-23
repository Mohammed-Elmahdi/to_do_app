import 'package:flutter/material.dart';
import 'package:to_do_new/shared/styles/my_theme.dart';
import 'package:provider/provider.dart';

import 'MyProvider.dart';


class ShowLanguageBottomSheet extends StatefulWidget {
  @override
  State<ShowLanguageBottomSheet> createState() =>
      _ShowLanguageBottomSheetState();
}

class _ShowLanguageBottomSheetState extends State<ShowLanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          InkWell(onTap: () {},
              child: ShowLanguageSelected('English', true)),
          SizedBox(
            height: 10,
          ),
          ShowLanguageSelected('العربية', false),
        ],
      ),
    );
  }

  Widget ShowLanguageSelected(String text, bool selected) {
    if (selected) {
      return Text('$text',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: MyThemeData.primaryColor,
              ));
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$text', style: Theme.of(context).textTheme.bodyText1),
          Icon(Icons.check),
        ],
      );
    }
  }
}
