import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petshop_assist/pages/settings/grooming_setting.dart';

class AppBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedFontSize: 12,
      unselectedFontSize: 12,
      onTap: (value) {
        if (value == 2) Navigator.of(context).push(MaterialPageRoute(builder: (_) => const GroomingSettingPage()));
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Customers",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: "Calendar",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: "Settings",
        ),
      ],
    );
  }
}
