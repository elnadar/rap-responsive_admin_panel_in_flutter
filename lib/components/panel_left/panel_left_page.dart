import 'package:flutter/material.dart';
import 'package:rap/utils/constants.dart';
import 'package:rap/utils/resposive_layout.dart';

class PanelLeftPage extends StatefulWidget {
  const PanelLeftPage({Key? key}) : super(key: key);

  @override
  State<PanelLeftPage> createState() => _PanelLeftPageState();
}

class _PanelLeftPageState extends State<PanelLeftPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (ResponsiveLayout.isComputer(context))
            const SizedBox(
              width: 50,
              height: 50,
              child: ColoredBox(
                color: ThemeColors.purpleLight,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: ThemeColors.purpleDark,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(50))),
                ),
              ),
            ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: Measures.kPadding / 2,
                    left: Measures.kPadding / 2,
                    right: Measures.kPadding / 2,
                  ),
                  child: Card(
                    color: ThemeColors.purpleLight,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const ListTile(
                      title: Text("Products Sold",
                          style: TextStyle(color: Colors.white)),
                      subtitle: Text("18% products sold.",
                          style: TextStyle(color: Colors.white)),
                      trailing: Chip(
                          label: Text("4,500",
                              style: TextStyle(color: Colors.white))),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
