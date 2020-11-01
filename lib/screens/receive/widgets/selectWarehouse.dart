import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:stock_management/repository/api/handlers.dart';
import 'package:stock_management/repository/vmodel/store.dart';
import 'package:flutter_riverpod/all.dart';


class SelectWarehouse extends StatefulWidget {
  @override
  _SelectWarehouseState createState() => _SelectWarehouseState();
}

class _SelectWarehouseState extends State<SelectWarehouse> {
  ApiHandlers _apiHandlers = GetIt.I<ApiHandlers>();
  int selected = 0;
  @override
  void initState() {
    super.initState();
    selected = context.read(store).getSelectedWarehouseId??0;
  }
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child){
        final provider = watch(store);
        if(provider.getWarehouse == null){
          _apiHandlers.getWarehouse().then((value) {
            provider.setWarehouse(value);
          });
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Center(
              child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Color(0xFF1abc9c)),
              ),
            ),
          );
        }
        return Scaffold(
          floatingActionButton: FloatingActionButton.extended(
              elevation: 0.0,
              icon: Icon(Icons.done),
              onPressed: () {
                provider.setSelectedWarehouse(selected);
                Navigator.pop(context);
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
              itemExtent: 54,
              childCount: provider.getWarehouse.length,
              scrollController: FixedExtentScrollController(
                  initialItem:provider.getSelectedWarehouseId == null ? 0 : provider.getSelectedWarehouseId
              ),
              onSelectedItemChanged: (int i) {
                setState(() {
                  selected = i;
                });
              },
              itemBuilder: (context, index){
                return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          provider.getWarehouse[index].name,
                          style: TextStyle(
                            color: index == selected ? Color(0xFF0ABDE3) : Colors.grey,
                          ),
                        ),
                        Text(
                          provider.getWarehouse[index].address.join(" / "),
                          style: TextStyle(
                            fontSize: 13,
                            color: index == selected ? Color(0xFF0ABDE3) : Colors.grey,
                          ),
                        ),
                      ],
                    )
                );
              },
            ),
          ),
        );
      },
    );
  }
}
