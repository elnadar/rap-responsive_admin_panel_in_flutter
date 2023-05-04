import 'package:flutter/material.dart';
import 'package:rap/components/drawer/drawer.dart';
import 'package:rap/components/panel_center/panel_center_page.dart';
import 'package:rap/components/panel_left/panel_left_page.dart';
import 'package:rap/components/panel_right/panel_right_page.dart';
import 'package:rap/utils/resposive_layout.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerPage(),
        appBar: PreferredSize(
            preferredSize: const Size(double.infinity, 100),
            child: (ResponsiveLayout.isTiny(context) ||
                    ResponsiveLayout.isTinyHeight(context))
                ? const SizedBox()
                : AppBar(
                    title: const Text("Widget Tree"),
                    automaticallyImplyLeading:
                        ResponsiveLayout.isComputer(context) ? false : true,
                  )),
        body: ResponsiveLayout(
          tiny: const SizedBox(),
          phone: const PanelLeftPage(),
          tablet: Row(
            children: const [
              Expanded(child: PanelLeftPage()),
              Expanded(child: PanelCenterPage()),
            ],
          ),
          largeTablet: Row(
            children: const [
              Expanded(child: PanelLeftPage()),
              Expanded(child: PanelCenterPage()),
              Expanded(child: PanelRightPage()),
            ],
          ),
          computer: Row(
            children: const [
              DrawerPage(),
              Expanded(child: PanelLeftPage()),
              Expanded(child: PanelCenterPage()),
              Expanded(child: PanelRightPage()),
            ],
          ),
        ));
  }
}
