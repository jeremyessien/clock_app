import 'package:clock_app/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class MenuInfo extends ChangeNotifier{
  MenuType menuType;
  String? title;
  String? imageSource;
  MenuInfo(this.menuType, {this.title, this.imageSource});
}