import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:stock_management/repository/api/handlers.dart';
import 'package:stock_management/repository/vmodel/store.dart';
import 'package:stock_management/screens/Receive/widgets/selectVendor.dart';
import 'package:stock_management/screens/Receive/widgets/selectWarehouse.dart';
import 'package:stock_management/utils/i18n.dart';
import 'package:flutter_riverpod/all.dart';

class CreateReceiveIndex extends StatefulWidget {
  @override
  _CreateReceiveState createState() => _CreateReceiveState();
}

class _CreateReceiveState extends State<CreateReceiveIndex> {
  TextEditingController totalAmountController = TextEditingController();
  TextEditingController dueAmountController = TextEditingController();
  ApiHandlers _apiHandlers = GetIt.I<ApiHandlers>();
  static const int numItems = 10;
  bool isLoading = false;
  List<Map<String, dynamic>> items = [];
  List<bool> selected = List<bool>.generate(numItems, (index) => false);

  void addToItems(int item, int qty) {
    if (items.where((element) => element["item"] == item).length != 0) {
      print("removing item");
      print(item);
      items.removeWhere((element) => element["item"] == item);
    }
    items.add({"item": item, "quantity": qty});
  }

  bool checkIfAllMembersHaveQty() {
    for (Map<String, dynamic> item in items) {
      print(item);
      if (item["quantity"] == null) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Builder(
        builder: (context) {
          return FloatingActionButton.extended(
            onPressed: () {
              if (!checkIfAllMembersHaveQty()) {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text(I18n.of(context).translate('PleaseFillQty')),
                  backgroundColor: Colors.red,
                ));
              } else {
                var total = 0.0;
                for(Map<String, dynamic> item in items){
                  total += double.parse(context.read(store).getVendorItems.where((element) => element.id == item["item"]).toList()[0].price) * item["quantity"];
                }
                setState(() {
                  totalAmountController.text = total.toString();
                });
                showDialog(
                    context: context,
                    builder: (_) {
                      return Scaffold(
                        backgroundColor: Colors.transparent,
                        body: Center(
                          child:
                          Container(
                            color: Colors.white,
                            padding: EdgeInsets.all(12),
                            width: MediaQuery.of(context).size.width / 1.4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  I18n.of(context).translate('OneMoreStep'),
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 21
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                TextField(
                                  controller: totalAmountController,
                                  decoration: InputDecoration(
                                    labelText: I18n.of(context).translate('TotalAmount'),
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                TextField(
                                  controller: dueAmountController,
                                  decoration: InputDecoration(
                                    labelText:I18n.of(context).translate('DueAmount'),
                                  ),
                                ),
                                SizedBox(height: 8,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    FlatButton(onPressed: (){
                                      Navigator.pop(context);
                                      Scaffold.of(context).showSnackBar(
                                        SnackBar(content: Text(I18n.of(context).translate('CreateReceive')))
                                      );
                                      _apiHandlers.createReceive(items, context.read(store).getSelectedVendorId, context.read(store).getSelectedWarehouseId, total, double.parse(dueAmountController.text == "" ? "0" : dueAmountController.text))
                                          .then((value) {
                                        if(value){
                                          setState(() {
                                            isLoading = false;
                                          });
                                          //to go to home screen...
                                          Scaffold.of(context).showSnackBar(
                                              SnackBar(content: Text(I18n.of(context).translate('ReceiveSuccess')),backgroundColor: Colors.green,)
                                          );
                                          context.read(store).setSelectedWarehouse(null);
                                          context.read(store).setSelectedVendor(null);
                                          context.read(store).setItemVendor([]);
                                        } else {
                                          Scaffold.of(context).showSnackBar(
                                              SnackBar(content: Text(I18n.of(context).translate('ReceiveFail')),backgroundColor: Colors.red,)
                                          );
                                        }
                                      });
                                    }, child: Text(I18n.of(context).translate('OK')))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              }
            },
            label: Text(I18n.of(context).translate('CreateReceive')),
            icon: Icon(Icons.done),
            elevation: 0.0,
            backgroundColor: Color(0xFF1abc9c),
          );
        },
      ),
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Color(0xFF1abc9c),
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Text(I18n.of(context).translate('CreateReceive')),
      ),
      body: Consumer(
        builder: (context, watch, child) {
          final provider = watch(store);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: 24, right: 24, top: 18, bottom: 4),
                child: InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        provider.getSelectedVendorId == null
                            ? I18n.of(context).translate('ChooseVendor')
                            : provider
                                .vendors[provider.getSelectedVendorId].fullname,
                        style: TextStyle(
                            fontSize: 16,
                            color: provider.getSelectedVendorId == null
                                ? Colors.black45
                                : Colors.black),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(4),
                      ),
                      gradient: new LinearGradient(
                        stops: [0.04, 0.04],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [Color(0xFF1abc9c), Colors.grey[300]],
                      ),
                    ),
                  ),
                  onTap: () {
                    showDialog(context: context, child: SelectVendor());
                  },
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 24, right: 24, top: 12, bottom: 12),
                child: InkWell(
                  onTap: () {
                    showDialog(context: context, child: SelectWarehouse());
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        provider.getSelectedWarehouseId == null
                            ? I18n.of(context).translate('ChooseWarehouse')
                            : provider
                                .getWarehouse[provider.getSelectedWarehouseId]
                                .name,
                        style: TextStyle(
                            fontSize: 16,
                            color: provider.getSelectedWarehouseId == null
                                ? Colors.black45
                                : Colors.black),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(4),
                      ),
                      gradient: new LinearGradient(
                        stops: [0.05, 0.05],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [Color(0xFF1abc9c), Colors.grey[300]],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 24, right: 24, top: 18, bottom: 4),
                child: Text(
                  I18n.of(context).translate('ChooseItemLabel'),
                  style: TextStyle(color: Colors.black45),
                ),
              ),
              provider.getVendorItems == null
                  ? Expanded(
                      child: Center(
                        child: CircularProgressIndicator(
                          valueColor: new AlwaysStoppedAnimation<Color>(
                              Color(0xFF1abc9c)),
                        ),
                      ),
                    )
                  : provider.getVendorItems.length == 0
                      ? Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.info_outline_rounded,
                                  color: Colors.black26,
                                  size: MediaQuery.of(context).size.width / 5,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 34, right: 34),
                                  child: Text(
                                    I18n.of(context).translate('Warning'),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                        fontSize: 16),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      : Expanded(
                          child: ListView(
                            children: <Widget>[
                              SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                child: DataTable(
                                  columns: const <DataColumn>[
                                    DataColumn(
                                      label: Text(
                                        '#',
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Name',
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Quantity',
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Price (Rs)',
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Base Price (Rs)',
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'UOM',
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic),
                                      ),
                                    ),
                                  ],
                                  rows: List.generate(
                                      provider.getVendorItems.length, (index) {
                                    return DataRow(
                                      selected: selected[index],
                                      onSelectChanged: (bool value) {
                                        setState(() {
                                          selected[index] = value;
                                        });
                                      },
                                      cells: <DataCell>[
                                        DataCell(Text(provider
                                            .getVendorItems[index].id
                                            .toString())),
                                        DataCell(Text(provider
                                            .getVendorItems[index].name)),
                                        DataCell(TextField(
                                          onChanged: (text) => {
                                            if (text.isNotEmpty || text != "")
                                              {
                                                addToItems(
                                                    provider
                                                        .getVendorItems[index]
                                                        .id,
                                                    int.parse(text))
                                              }
                                            else
                                              {
                                                if (items
                                                        .where((element) =>
                                                            element["item"] ==
                                                            provider
                                                                .getVendorItems[
                                                                    index]
                                                                .id)
                                                        .length !=
                                                    0)
                                                  {
                                                    for (Map<String,
                                                        dynamic> item in items)
                                                      {
                                                        if (item["item"] ==
                                                            provider
                                                                .getVendorItems[
                                                                    index]
                                                                .id)
                                                          {
                                                            item["quantity"] =
                                                                null
                                                          }
                                                      }
                                                  }
                                              }
                                          },
                                          keyboardType: TextInputType.number,
                                          enabled: selected[index],
                                        )),
                                        DataCell(Text(provider
                                            .getVendorItems[index].price)),
                                        DataCell(Text(provider
                                            .getVendorItems[index].basePrice)),
                                        DataCell(Text(provider
                                            .getVendorItems[index].uom)),
                                      ],
                                    );
                                  }),
                                ),
                              ),
                            ],
                          ),
                        ),
            ],
          );
        },
      ),
    );
  }
}
