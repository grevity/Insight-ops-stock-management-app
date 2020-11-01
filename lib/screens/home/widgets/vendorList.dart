import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:get_it/get_it.dart';
import 'package:stock_management/repository/api/handlers.dart';
import 'package:stock_management/repository/data/models/vendors.dart';
import 'package:stock_management/repository/vmodel/store.dart';
import 'package:stock_management/screens/widgets/shimmerList.dart';
import 'package:stock_management/utils/i18n.dart';

class VendorList extends StatefulWidget {
  @override
  _VendorListState createState() => _VendorListState();
}

class _VendorListState extends State<VendorList> {
  List<Vendors> _vendorList;
  ApiHandlers _apiHandlers = GetIt.I<ApiHandlers>();

  @override
  void initState() {
    super.initState();
    _vendorList = context.read(store).vendors;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      final provider = watch(store);
      if (provider.vendors == null) {
        _apiHandlers.getVendors().then((value) {
          provider.setVendors(value);
          setState(() {
            _vendorList = value;
          });
        });
        return ShimmerList();
      }
      return Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 12, bottom: 6),
            width: MediaQuery.of(context).size.width,
            child: TextField(
              decoration: InputDecoration(
                hintText: I18n.of(context).translate('SearchVendors'),
                prefixIcon: Icon(
                  Icons.search,
                  color: Color(0xFF1abc9c),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF1abc9c)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF1abc9c)),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF1abc9c)),
                ),
              ),
              onChanged: (change) {
                setState(() {
                  _vendorList = provider.vendors.where((e) => e.fullname.toLowerCase().contains(change.toLowerCase())).toList();
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: _vendorList.length,
              itemBuilder: (context, index) {
                return VendorCard(
                  _vendorList[index].fullname,
                  _vendorList[index].gstin,
                  _vendorList[index].phone,
                );
              },
            ),
          ),
        ],
      );
    });
  }
}

class VendorCard extends StatelessWidget {
  final String fullname, phone, gstin;
  VendorCard(this.fullname, this.gstin, this.phone);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 4),
      padding: EdgeInsets.only(top: 12, left: 6, bottom: 12),
      color: Colors.grey[300],
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(6),
            child: Container(
              width: 68.0,
              height: 68.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF169e83).withOpacity(0.4),
              ),
              child: Center(
                child: Text(
                  fullname[0].toUpperCase(),
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'NanumGothic-Regular',
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  fullname,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 19,
                      // fontWeight: FontWeight.bold,
                      fontFamily: 'NanumGothic-Bold'),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "Phone",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                          fontFamily: 'NanumGothic-Regular',
                        ),
                      ),
                      padding: EdgeInsets.only(left: 8,right: 8,top:3,bottom: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.black12
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      phone,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                          fontFamily: 'NanumGothic-Regular'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "GSTIN",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                          fontFamily: 'NanumGothic-Regular',
                        ),
                      ),
                      padding: EdgeInsets.only(left: 8,right: 8,top:3,bottom: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.black12
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      gstin,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                          fontFamily: 'NanumGothic-Regular'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.all(14),child: Icon(Icons.chevron_right,color: Color(0xFF169e83),),)
        ],
      ),
    );
  }
}
