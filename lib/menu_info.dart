import 'package:clock_app/enum.dart';

class MenuInfo{
  MenuType menuType;
  String? title;
  String? imageSource;
  MenuInfo(this.menuType, {this.title, this.imageSource});
}