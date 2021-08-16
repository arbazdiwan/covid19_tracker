import 'package:flutter/material.dart';

import 'datasource.dart';
import 'home_page.dart';

var isDebugMode = false;

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: isDebugMode,
      theme:
          ThemeData(primaryColor: primaryBlack, fontFamily: 'Source Sans Pro'),
      home: HomePage(),
    ));
