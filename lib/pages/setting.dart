import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petshop_assist/components/app_drawer.dart';
import 'package:petshop_assist/components/bottom_navigation_bar.dart';
import 'package:petshop_assist/theme/WaveDecoratedFloatingActionButton.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<StatefulWidget> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Intl.message("settingPageTitle")),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (Navigator.of(context).canPop()) Navigator.of(context).pop();
          },
        ),
      ),
      body: _SettingIndex(),
    );
  }
}

class _SettingIndex extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingIndexState();
}

class _SettingIndexState extends State<_SettingIndex> {
  final double _cardBorderRadius = 20;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.only(left: 10),
              child: const Text(
                "가격 관리",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(0xFF, 0xAC, 0x70, 0x88),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(_cardBorderRadius),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(_cardBorderRadius),
                ),
                clipBehavior: Clip.hardEdge,
                child: Column(
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: ListTile(
                        onTap: () {},
                        title: const Text("미용 가격 설정"),
                      ),
                    ),
                    const Divider(
                      color: Colors.black87,
                      height: 2,
                      indent: 15,
                      endIndent: 15,
                    ),
                    Material(
                      color: Colors.transparent,
                      child: ListTile(
                        onTap: () {},
                        title: const Text("제품 목록 관리"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
