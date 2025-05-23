import 'package:aplikaites1/size_config.dart';
import 'package:flutter/material.dart';

class Loginscreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(appBar: AppBar(automaticallyImplyLeading: false));
  }
}
