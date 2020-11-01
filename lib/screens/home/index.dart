import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stock_management/routes/router.gr.dart';
import 'package:stock_management/screens/home/widgets/productList.dart';
import 'package:stock_management/screens/home/widgets/vendorList.dart';
import 'package:stock_management/screens/settings/index.dart';
import 'package:stock_management/utils/i18n.dart';

class HomeIndex extends StatefulWidget {
  @override
  _HomeIndexState createState() => _HomeIndexState();
}

class _HomeIndexState extends State<HomeIndex>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.language,
              color: Colors.white,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => Settings(),
              );
            },
          )
        ],
        backgroundColor: Color(0xFF1abc9c),
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Text(
          I18n.of(context).translate('HomeAppBarTitle'),
        ),
        bottom: TabBar(
          indicatorColor: Colors.white,
          controller: _tabController,
          tabs: [
            Tab(
              child: Text(
                I18n.of(context).translate('HomeTabBarVendor'),
              ),
            ),
            Tab(
              child: Text(
                I18n.of(context).translate('HomeTabBarProducts'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor:Color(0xFF1abc9c) ,
        icon: Icon(Icons.add),
        label: Text(I18n.of(context).translate('CreateReceive')),
        elevation: 0,
        onPressed: () {
          ExtendedNavigator.of(context).push(Routes.createReceiveIndex);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: TabBarView(
        controller: _tabController,
        physics: BouncingScrollPhysics(),
        children: [
          VendorList(),
          ProductList()
        ],
      ),
    );
  }
}
