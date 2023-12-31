import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:petshop_assist/models/customer_info.dart';
import 'package:petshop_assist/models/datetime_converter.dart';
import 'package:petshop_assist/models/driving_history.dart';
import 'package:petshop_assist/services/driving_history_service.dart';

class CustomerListIndex extends StatefulWidget {
  const CustomerListIndex({
    super.key,
    required this.customerInfo,
    this.recentDrivingHistory,
    // required this.name,
    // required this.callNumber,
  });

  final CustomerInfo customerInfo;
  final DrivingHistory? recentDrivingHistory;
  // final String callNumber;
  // final String name;

  @override
  State<StatefulWidget> createState() => _CustomerListIndexState();
}

class _CustomerListIndexState extends State<CustomerListIndex> {
  final double iconWidth = 48;
  final double dividerHeight = 1;

  double _subMenuHeight = 0;

  DrivingHistory? recentDrivingHistory;
  bool historySearched = false;

  void onCardTap() {
    if (historySearched == false) {
      historySearched = false;

      DrivingHistoryService service = DrivingHistoryService();
      service.findByCustomerIdOrderByDateWithLimit(widget.customerInfo.id).then((value) {
        recentDrivingHistory = value;
        toggleDetails();
      });
    } else {
      toggleDetails();
    }
  }

  void toggleDetails() {
    setState(() {
      if (_subMenuHeight == 0) {
        _subMenuHeight = 110;
      } else {
        _subMenuHeight = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          GestureDetector(
            onTap: () => onCardTap(),
            child: Container(
              padding: const EdgeInsets.only(
                top: 8,
                right: 16,
                left: 16,
                bottom: 8,
              ),
              color: const Color(0xFFFAFAFA),
              width: double.infinity,
              child: Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFF5E8C7),
                    ),
                    margin: const EdgeInsets.only(right: 16),
                    clipBehavior: Clip.hardEdge,
                    width: iconWidth,
                    height: iconWidth,
                    child: SvgPicture.asset(
                      "assets/images/dog_barking_48dp.svg",
                      height: 40,
                      fit: BoxFit.none,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.customerInfo.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.customerInfo.callNumber,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedSize(
            curve: Curves.easeIn,
            duration: const Duration(milliseconds: 100),
            child: Container(
              height: _subMenuHeight,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(0xAC, 0x70, 0x88, 0.2),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.call),
                        splashRadius: 18,
                        color: Colors.green,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.message),
                        splashRadius: 18,
                        color: Colors.blueAccent,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.car_rental),
                        splashRadius: 18,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.info),
                        splashRadius: 18,
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 8,
                      bottom: 8,
                    ),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        if (recentDrivingHistory == null) {
                          return Container(
                            alignment: Alignment.center,
                            height: iconWidth,
                            child: Text(
                              Intl.message("noHistoryData"),
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          );
                        }

                        final priceFormatter = NumberFormat("#,##0", "en_US");
                        String dateString = DateTimeConverter.formatDate(recentDrivingHistory!.createDate);
                        String pathString = "${recentDrivingHistory!.departure} → ${recentDrivingHistory!.destination}";
                        String priceString = "${priceFormatter.format(recentDrivingHistory!.price)} 원";

                        return Row(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFF5E8C7),
                              ),
                              margin: const EdgeInsets.only(right: 16),
                              clipBehavior: Clip.hardEdge,
                              width: iconWidth,
                              height: iconWidth,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  dateString,
                                  // "2023년 9월 29일",
                                  style: const TextStyle(
                                    fontSize: 11,
                                  ),
                                ),
                                Text(
                                  pathString,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  priceString,
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 75,
              right: 10,
            ),
            height: dividerHeight,
            child: Divider(
              thickness: dividerHeight,
              color: const Color.fromARGB(0x80, 0x00, 0x00, 0x00),
            ),
          ),
        ],
      ),
    );
  }
}
