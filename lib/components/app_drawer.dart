import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        Container(
          decoration: const BoxDecoration(color: Color(0xFFF5E8C7)),
          // decoration: const BoxDecoration(color: Color(0xFFF5E8C7)),
          height: 100,
          alignment: Alignment.bottomCenter,
          child: const Text('Too many empty space...'),
        ),
        const ListTile(
          leading: Icon(
            Icons.apps,
            color: Color(0xFFDEB6AB),
          ),
          title: Text('Main'),
          textColor: Color(0xFF1B1C1F),
          style: ListTileStyle.drawer,
        ),
      ]),
    );
  }
}
