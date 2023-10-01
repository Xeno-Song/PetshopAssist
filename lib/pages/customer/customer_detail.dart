import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petshop_assist/components/divider.dart';
import 'package:petshop_assist/models/customer_info.dart';
import 'package:petshop_assist/models/pet_type.dart';
import 'package:petshop_assist/services/pet_info_service.dart';
import 'package:petshop_assist/theme/WaveDecoratedFloatingActionButton.dart';

import '../../models/pet_info.dart';

class CustomerDetailPage extends StatefulWidget {
  const CustomerDetailPage({
    super.key,
    required this.customer,
  });

  final CustomerInfo customer;

  @override
  State<StatefulWidget> createState() => _CustomerDetailPageState();
}

class _CustomerDetailPageState extends State<CustomerDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (Navigator.of(context).canPop()) Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              bottom: 10,
              right: 15,
              left: 15,
              top: 15,
            ),
            child: _CustomerInfoDetail(customer: widget.customer),
          ),
          const Divider(
            color: Color.fromRGBO(0, 0, 0, 0.5),
            height: 2,
          ),
          Expanded(
            child: _CustomerInfoAdditionalInfo(
              customerId: widget.customer.id,
            ),
          ),
        ],
      ),
      floatingActionButton: const WaveDecoratedFloatingActionButton(
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class _CustomerInfoDetail extends StatelessWidget {
  const _CustomerInfoDetail({
    required this.customer,
  });

  final double iconSize = 64;
  final CustomerInfo customer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF5E8C7),
              ),
              margin: const EdgeInsets.only(right: 16),
              clipBehavior: Clip.hardEdge,
              width: iconSize,
              height: iconSize,
              child: SvgPicture.asset(
                "assets/images/dog_barking_48dp.svg",
                height: iconSize - 8,
                fit: BoxFit.none,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  customer.name,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  customer.callNumber,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Color.fromARGB(0xFF, 0x50, 0x50, 0x50),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(right: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.call),
                      color: Colors.green,
                      splashRadius: 24,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.message),
                      color: Colors.blue,
                      splashRadius: 24,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        Container(
          padding: const EdgeInsets.only(top: 5, left: 10),
          alignment: Alignment.centerLeft,
          child: const Text(
            "Memo",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5),
          padding: const EdgeInsets.all(10),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.black,
            ),
          ),
          child: Text(
            customer.memo,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}

class _CustomerInfoAdditionalInfo extends StatefulWidget {
  const _CustomerInfoAdditionalInfo({
    required this.customerId,
  });

  final int customerId;

  @override
  State<StatefulWidget> createState() => _CustomerInfoAdditionalInfoState();
}

class _CustomerInfoAdditionalInfoState extends State<_CustomerInfoAdditionalInfo> with TickerProviderStateMixin {
  late TabController _tabController;

  final double tabBarHeight = 35;

  @override
  void initState() {
    _tabController = TabController(
      length: 3,
      vsync: this,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.blueGrey,
          tabs: [
            Container(
              height: tabBarHeight,
              alignment: Alignment.center,
              child: const Text(
                "애완 동물",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: tabBarHeight,
              alignment: Alignment.center,
              child: const Text(
                "미용",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: tabBarHeight,
              alignment: Alignment.center,
              child: const Text("용품 판매",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _CustomerPetList(
                customerId: widget.customerId,
              ),
              const Text("BB"),
              const Text("CC"),
            ],
          ),
        ),
      ],
    );
  }
}

class _CustomerPetList extends StatefulWidget {
  const _CustomerPetList({
    super.key,
    required this.customerId,
  });

  final int customerId;

  @override
  State<StatefulWidget> createState() => _CustomerPetListState();
}

class _CustomerPetListState extends State<_CustomerPetList> {
  List<PetInfo> petList = List.empty();

  @override
  void initState() {
    PetInfoService().findByCustomerIdEquals(widget.customerId).then((value) {
      setState(() {
        petList = value;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PetInfo info = PetInfo(
      id: 1,
      name: "행운",
      type: PetType.special,
      detailType: "비숑프리제",
      age: 8,
      weight: 4,
      neutering: 1,
      memo: "성격 더러움",
      customerId: 1,
      createDate: DateTime.now(),
    );

    List<Widget> items = List.empty(growable: true);
    for (var index in petList) {
      items.add(_PetListIndex(petInfo: index));
      items.add(const ListDivider());
    }
    if (items.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.error_outline,
                  size: 56,
                ),
                Text("등록된 동물 정보가 없습니다"),
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(),
          ),
        ],
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: items,
      ),
    );
  }
}

class _PetListIndex extends StatelessWidget {
  const _PetListIndex({required this.petInfo});

  final PetInfo petInfo;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Ink(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF5E8C7),
              ),
              height: 48,
              width: 48,
              margin: const EdgeInsets.only(right: 15),
              child: const Icon(Icons.pets, size: 36),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${petInfo.name} (${petInfo.age})",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${petInfo.detailType} (${PetType.format(petInfo.type)})",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(0x00, 0x00, 0x00, 0.7),
                  ),
                ),
                Text(
                  "몸무게 : ${petInfo.weight} kg / 중성화 : ${petInfo.neutering == 1 ? "Y" : "N"}",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(0x00, 0x00, 0x00, 0.7),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
