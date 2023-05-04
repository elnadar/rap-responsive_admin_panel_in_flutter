import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget tiny, phone, tablet, largeTablet, computer;
  const ResponsiveLayout({Key? key, required this.tiny, required this.phone, required this.tablet, required this.largeTablet, required this.computer,}) : super(key: key);
  static const int tinyHeightLimit = 100,
                   tinyLimit = 270,
                   phoneLimit = 550,
                   tabletLimit = 800,
                   largeTabletLimit = 1000;

  static bool isTinyHeight(BuildContext context) =>
      MediaQuery.of(context).size.height < tinyHeightLimit;
  static bool isTiny(BuildContext context) =>
      MediaQuery.of(context).size.width < tinyLimit;
  static bool isPhone(BuildContext context) =>
      MediaQuery.of(context).size.width < phoneLimit && MediaQuery.of(context).size.width >= tinyLimit;
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < tabletLimit && MediaQuery.of(context).size.width >= phoneLimit;
  static bool isLargeTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < largeTabletLimit && MediaQuery.of(context).size.width >= tabletLimit;
  static bool isComputer(BuildContext context) =>
      MediaQuery.of(context).size.width >= largeTabletLimit;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){
      if(constraints.maxWidth <= tinyLimit  || constraints.maxHeight <= tinyHeightLimit){
        return tiny;
      } else if(constraints.maxWidth <= phoneLimit){
        return phone;
      } else if(constraints.maxWidth <= tabletLimit){
        return tablet;
      } else if(constraints.maxWidth <= largeTabletLimit){
        return largeTablet;
      } else{
        return computer;
      }
      });
  }
}
