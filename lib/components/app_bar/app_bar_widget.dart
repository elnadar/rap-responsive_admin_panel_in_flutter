import 'package:flutter/material.dart';
import 'package:rap/utils/constants.dart';
import 'package:rap/utils/resposive_layout.dart';

class MenuList {
  int currIndex = 0;

  MenuList._sharedInstance();
  static final MenuList _shared = MenuList._sharedInstance();
  factory MenuList() => _shared;

  final List<String> _menuList = ["Overview", "Revenue", "Sales", "Control"];

  int get length {
    return _menuList.length;
  }

  List<String> get tilesInfo {
    return _menuList;
  }
}

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  final menuInfo = MenuList();
  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: const BoxDecoration(color: ThemeColors.purpleLight),
      child: DefaultTextStyle(
        style: const TextStyle(color: Colors.white),
        child: IconTheme.merge(
          data: const IconThemeData(color: Colors.white, size: 30),
          child: Row(
            children: [
              if (ResponsiveLayout.isComputer(context))
                Container(
                  margin: const EdgeInsets.all(Measures.kPadding),
                  height: double.infinity,
                  decoration:
                      const BoxDecoration(shape: BoxShape.circle, boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      offset: Offset(0, 0),
                      spreadRadius: 1,
                      blurRadius: 10,
                    )
                  ]),
                  child: CircleAvatar(
                    backgroundColor: Colors.pink,
                    radius: 30,
                    child: Image.asset("images/mapp.png"),
                  ),
                )
              else
                IconButton(
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    icon: const Icon(Icons.menu)),
              const SizedBox(
                width: Measures.kPadding,
              ),
              const Spacer(),
              if (ResponsiveLayout.isComputer(context))
                ...List.generate(
                  menuInfo.length,
                  (index) => TextButton(
                    onPressed: () {
                      setState(() {
                        menuInfo.currIndex = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(Measures.kPadding * 2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            menuInfo.tilesInfo[index],
                            style: TextStyle(
                                color: menuInfo.currIndex == index
                                    ? Colors.white
                                    : Colors.white70),
                          ),
                          Container(
                            width: 60,
                            height: 2,
                            margin: const EdgeInsets.all(Measures.kPadding / 2),
                            decoration: BoxDecoration(
                                gradient: menuInfo.currIndex == index
                                    ? const LinearGradient(colors: [
                                        ThemeColors.redDark,
                                        ThemeColors.orangeDark
                                      ])
                                    : null),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              else
                TextButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(Measures.kPadding * 2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          menuInfo.tilesInfo[menuInfo.currIndex],
                          style: const TextStyle(color: Colors.white),
                        ),
                        Container(
                          width: 60,
                          height: 2,
                          margin: const EdgeInsets.all(Measures.kPadding / 2),
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(colors: [
                            ThemeColors.redDark,
                            ThemeColors.orangeDark
                          ])),
                        )
                      ],
                    ),
                  ),
                ),
              const Spacer(),
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              IconButton(
                  onPressed: () {},
                  icon: const Badge(
                      alignment: AlignmentDirectional(16, -5),
                      label: Text("3"),
                      child: Icon(Icons.notifications))),
              if (!ResponsiveLayout.isPhone(context))
                Container(
                  margin: const EdgeInsets.all(Measures.kPadding),
                  height: double.infinity,
                  decoration:
                      const BoxDecoration(shape: BoxShape.circle, boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      offset: Offset(0, 0),
                      spreadRadius: 1,
                      blurRadius: 10,
                    )
                  ]),
                  child: CircleAvatar(
                    backgroundColor: ThemeColors.orangeDark,
                    radius: 30,
                    child: Image.asset("images/profile.png"),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
