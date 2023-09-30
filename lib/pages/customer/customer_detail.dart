import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:petshop_assist/components/app_drawer.dart';
import 'package:petshop_assist/components/bottom_navigation_bar.dart';
import 'package:petshop_assist/models/customer_info.dart';
import 'package:petshop_assist/theme/WaveDecoratedFloatingActionButton.dart';

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
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            _CustomerInfoDetail(customer: widget.customer),
          ],
        ),
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
    super.key,
    required this.customer,
  });

  final double iconSize = 64;
  final CustomerInfo customer;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 3,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
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
              child: Text(customer.memo),
            ),
          ],
        ),
      ),
    );
  }
}
