import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:get_it/get_it.dart';
import 'package:stock_management/repository/api/handlers.dart';
import 'package:stock_management/repository/vmodel/store.dart';

class SelectVendor extends StatefulWidget {
  @override
  _SelectVendorState createState() => _SelectVendorState();
}

class _SelectVendorState extends State<SelectVendor> {
  ApiHandlers _apiHandlers = GetIt.I<ApiHandlers>();
  int selected = 0;
  @override
  void initState() {
    super.initState();
    selected = context.read(store).getSelectedVendorId??0;
  }
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child){
        final provider = watch(store);
        if(provider.vendors == null){
          _apiHandlers.getVendors().then((value) {
            provider.setVendors(value);
          });
          return CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Color(0xFF1abc9c)),
          );
        }
        return Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            elevation: 0.0,
              icon: Icon(Icons.done),
              onPressed: () {
                provider.setSelectedVendor(selected);
                Navigator.pop(context);
                provider.setItemVendor(null);
                _apiHandlers.getVendorItems(provider.vendors[provider.getSelectedVendorId].id.toString())
                    .then((value) => {
                  provider.setItemVendor(value)
                });
              },
              backgroundColor: Color(0xFF1abc9c),
              label: Text("Done")
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: CupertinoPicker.builder(
              diameterRatio: 100,
              backgroundColor: Colors.white,
              squeeze: 1,
              itemExtent: 34,
              childCount: provider.vendors.length,
              scrollController: FixedExtentScrollController(
                  initialItem:provider.getSelectedVendorId == null ? 0 : provider.getSelectedVendorId
              ),
              onSelectedItemChanged: (int i) {
                setState(() {
                  selected = i;
                });
              },
              itemBuilder: (context, index){
                return Center(
                  child: Text(
                    provider.vendors[index].fullname,
                    style: TextStyle(
                      color: index == selected ? Color(0xFF0ABDE3) : Colors.grey,
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
