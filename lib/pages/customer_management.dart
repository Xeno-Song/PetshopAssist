import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petshop_assist/services/customer_info_service.dart';

import '../components/app_drawer.dart';
import '../components/bottom_navigation_bar.dart';
import '../components/customer_list_index.dart';
import '../models/customer_info.dart';
import '../theme/WaveDecoratedFloatingActionButton.dart';

class CustomerManagementPage extends StatefulWidget {
  const CustomerManagementPage({super.key});

  @override
  State<CustomerManagementPage> createState() => _CustomerManagementPageState();
}

class _CustomerManagementPageState extends State<CustomerManagementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Intl.message("customerManagement")),
        centerTitle: true,
      ),
      drawer: const AppDrawer(),
      bottomNavigationBar: AppBottomNavigationBar(),
      body: Center(
        child: _CustomerList(),
      ),
      floatingActionButton: const WaveDecoratedFloatingActionButton(
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class _CustomerList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CustomerListState();
}

class _CustomerListState extends State<_CustomerList> {
  final CustomerInfoService _service = CustomerInfoService();
  List<CustomerInfo> customerList = List.empty();
  late CustomerListController listIndexController;

  @override
  void initState() {
    super.initState();

    _service.findAll().then((value) {
      setState(() {
        customerList = value;
        listIndexController = CustomerListController(value.length);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List<Widget>.generate(
        customerList.length,
        (index) {
          return CustomerListIndex(
            customerInfo: customerList[index],
            index: index,
            controller: listIndexController,
          );
        },
      ),
    );
  }
}
