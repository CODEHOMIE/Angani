import 'package:bhubweatherapp/core/constants/export_files.dart';
import 'package:flutter/material.dart';

ThemeData appTheme(context)=> ThemeData(
  primaryColor: Colors.lightGreen,
        platform: TargetPlatform.iOS,
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: Str.APP_FONT,
            ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
);