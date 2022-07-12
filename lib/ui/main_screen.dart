import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:technical_challange/ui/gift_page.dart';
import 'package:technical_challange/ui/home_page.dart';
import 'package:technical_challange/ui/wallet_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int value = 0;
  List<Widget> page = [
    const HomePage(),
     WalletPage(),
    const HomePage(),
    Container()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: const IconThemeData(color: Color(0xff199EFF)),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            label: "",
            icon: SvgPicture.asset(
              'assets/icons/home_icon.svg',
              width: 24,
              height: 24,
              color: (value == 0)
                  ? const Color(0xff199EFF)
                  : const Color(0xff999EA1),
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: SvgPicture.asset(
              'assets/icons/wallet_icon.svg',
              width: 26,
              height: 26,
              color: (value == 1)
                  ? const Color(0xff199EFF)
                  : const Color(0xff999EA1),
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: SvgPicture.asset(
              'assets/icons/gift_icon.svg',
              width: 22,
              height: 22,
              color: (value == 2)
                  ? const Color(0xff199EFF)
                  : const Color(0xff999EA1),
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: SvgPicture.asset(
              'assets/icons/profile_icon.svg',
              width: 24,
              height: 24,
              color: (value == 3)
                  ? const Color(0xff199EFF)
                  : const Color(0xff999EA1),
            ),
          ),
        ],
        currentIndex: value,
        onTap: (index) {
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext c) => const Giftpage(),
              ),
            );
          } else {
            setState(() {
              value = index;
            });
          }
        },
      ),
      body: IndexedStack(children: page, index: value),
    );
  }
}
