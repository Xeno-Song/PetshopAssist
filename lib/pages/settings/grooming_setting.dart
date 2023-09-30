import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petshop_assist/components/divider.dart';
import 'package:petshop_assist/services/database_service.dart';
import 'package:petshop_assist/services/grooming_type_service.dart';

import '../../models/grooming_type.dart';

class GroomingSettingPage extends StatefulWidget {
  const GroomingSettingPage({super.key});

  @override
  State<StatefulWidget> createState() => _GroomingSettingPageState();
}

class _GroomingSettingPageState extends State<GroomingSettingPage> {
  final double _cardBorderRadius = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Intl.message("groomingSettingPageTitle")),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (Navigator.of(context).canPop()) Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const GroomingTypeSettingCard(),
            Container(
              height: 12,
            ),
            const GroomingOptionSettingCard(),
          ],
        ),
      ),
    );
  }
}

class GroomingTypeSettingCard extends StatefulWidget {
  const GroomingTypeSettingCard({super.key});

  @override
  State<StatefulWidget> createState() => _GroomingTypeSettingCardState();
}

class _GroomingTypeSettingCardState extends State<GroomingTypeSettingCard> {
  final double _cardBorderRadius = 20;

  List<GroomingType> items = List<GroomingType>.empty();

  @override
  void initState() {
    super.initState();

    GroomingTypeService service = GroomingTypeService();
    service.findByOptionEquals(false).then((value) {
      setState(() {
        items = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> indexList = List.empty(growable: true);

    for (var item in items) {
      indexList.add(InkWell(
        onTap: () {},
        child: Ink(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            children: [
              const Icon(Icons.cut),
              Container(
                height: 44,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 15),
                child: Text(
                  item.name,
                  style: const TextStyle(fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ));
      indexList.add(const ListDivider());
    }
    indexList.add(InkWell(
      onTap: () {},
      child: Ink(
        padding: const EdgeInsets.only(left: 15),
        child: Row(
          children: [
            const Icon(Icons.add_circle),
            Container(
              height: 44,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 15),
              child: Text(
                Intl.message("addGroomingMenu"),
                style: const TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
      ),
    ));

    return Column(
      children: [
        Container(
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            Intl.message("groomingMenu"),
            style: const TextStyle(
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
              children: indexList,
            ),
          ),
        ),
      ],
    );
  }
}

class GroomingOptionSettingCard extends StatefulWidget {
  const GroomingOptionSettingCard({super.key});

  @override
  State<StatefulWidget> createState() => _GroomingOptionSettingCardState();
}

class _GroomingOptionSettingCardState extends State<GroomingOptionSettingCard> {
  final double _cardBorderRadius = 20;

  List<GroomingType> items = List<GroomingType>.empty();

  @override
  void initState() {
    super.initState();

    GroomingTypeService service = GroomingTypeService();
    service.findByOptionEquals(true).then((value) {
      setState(() {
        items = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> indexList = List.empty(growable: true);

    for (var item in items) {
      indexList.add(InkWell(
        onTap: () {},
        child: Ink(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            children: [
              const Image(
                image: AssetImage("assets/images/tangle.png"),
                height: 24,
                alignment: Alignment.center,
                isAntiAlias: true,
              ),
              Container(
                height: 44,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 15),
                child: Text(
                  item.name,
                  style: const TextStyle(fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ));
      indexList.add(const ListDivider());
    }
    indexList.add(InkWell(
      onTap: () {},
      child: Ink(
        padding: const EdgeInsets.only(left: 15),
        child: Row(
          children: [
            const Icon(Icons.add_circle),
            Container(
              height: 44,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 15),
              child: Text(
                Intl.message("addGroomingOption"),
                style: const TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
      ),
    ));

    return Column(
      children: [
        Container(
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            Intl.message("groomingOption"),
            style: const TextStyle(
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
              children: indexList,
            ),
          ),
        ),
      ],
    );
  }
}
