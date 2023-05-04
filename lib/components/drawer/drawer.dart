import 'package:flutter/material.dart';
import 'package:rap/utils/constants.dart';
import 'package:rap/utils/resposive_layout.dart';

class TilesInfo {
  final String title;
  final IconData iconData;

  TilesInfo({required this.title, required this.iconData});
}

class DrawerList {
  int _currIndex = 0;

  DrawerList._sharedInstance();
  static final DrawerList _shared = DrawerList._sharedInstance();
  factory DrawerList() => _shared;

  final List<TilesInfo> _tilesInfo = [
    TilesInfo(title: "Home", iconData: Icons.home),
    TilesInfo(title: "Notifications", iconData: Icons.notifications),
    TilesInfo(title: "Contacts", iconData: Icons.contact_phone),
    TilesInfo(title: "Sales", iconData: Icons.sell),
    TilesInfo(title: "Marketing", iconData: Icons.mark_email_read),
    TilesInfo(title: "Security", iconData: Icons.verified_user),
    TilesInfo(title: "Users", iconData: Icons.supervised_user_circle_rounded),
  ];

  int get currIndex {
    return _currIndex;
  }

  set currIndex(int newIndex) {
    _currIndex = newIndex;
  }

  int get length {
    return _tilesInfo.length;
  }

  List<TilesInfo> get tilesInfo {
    return _tilesInfo;
  }
}

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  final DrawerList drawerList = DrawerList();
  final DecorationTween decorationTween = DecorationTween(
    begin: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: LinearGradient(colors: [
        ThemeColors.redDark.withOpacity(.9),
        ThemeColors.orangeLight.withOpacity(.9)
      ]),
    ),
    end: null,
  );
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Measures.kPadding),
          child: Column(
            children: [
              ListTile(
                title: const Text(
                  "Admin Menu",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: ResponsiveLayout.isComputer(context)
                    ? null
                    : IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.close),
                        color: Colors.white,
                      ),
              ),
              ...List.generate(
                  drawerList.length,
                  (index) => DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: index == drawerList._currIndex
                              ? LinearGradient(colors: [
                                  ThemeColors.redDark.withOpacity(.9),
                                  ThemeColors.orangeLight.withOpacity(.9)
                                ])
                              : null,
                        ),
                        child: ListTile(
                          title: Text(drawerList.tilesInfo[index].title),
                          leading: Icon(drawerList.tilesInfo[index].iconData),
                          iconColor: Colors.white,
                          textColor: Colors.white,
                          onTap: () => setState(() {
                            drawerList.currIndex = index;
                          }),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      )),
              const Divider(
                color: Colors.white,
                thickness: .1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
