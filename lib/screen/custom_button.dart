import 'package:delivery_boy/screen/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../textfild/custom_themes.dart';
import 'color_resources.dart';

class CustomButton extends StatelessWidget {
  final Function onTap;
  final String buttonText;
  CustomButton({required this.onTap, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
      onPressed: (){},
      child: Container(
        height: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: ColorResources.getChatIcon(context),
            boxShadow: [
              BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 1, blurRadius: 7, offset: Offset(0, 1)), // changes position of shadow
            ],
            gradient: (Provider.of<ThemeProvider>(context).darkTheme || onTap == null) ? null : LinearGradient(colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColor,
            ]),
            borderRadius: BorderRadius.circular(10)),
        child: Text(buttonText,
            style: titilliumSemiBold.copyWith(
              fontSize: 16,
              color: Theme.of(context).highlightColor,
            )),
      ),
    );
  }
}
