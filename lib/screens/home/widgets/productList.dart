import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:get_it/get_it.dart';
import 'package:stock_management/repository/api/handlers.dart';
import 'package:stock_management/repository/data/models/items.dart';
import 'package:stock_management/repository/vmodel/store.dart';
import 'package:stock_management/screens/widgets/shimmerList.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Items> _itemsList;
  ApiHandlers _apiHandlers = GetIt.I<ApiHandlers>();

  @override
  void initState() {
    super.initState();
    _itemsList = context.read(store).items;
  }
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child){
        final provider = watch(store);
        if(provider.items == null){
          _apiHandlers.getRawItems().then((value) {
            provider.setItems(value);
            setState(() {
              _itemsList = value;
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
                  hintText: "Search Items",
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
                    _itemsList = provider.items.where((e) => e.name.toLowerCase().contains(change.toLowerCase())).toList();
                  });
                },
              ),
            ),
            Expanded(child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: _itemsList.length,
              itemBuilder: (context, index){
                return ProductCard(
                  id: _itemsList[index].id,
                  brand: _itemsList[index].brand,
                  uom: _itemsList[index].uom,
                  group: _itemsList[index].group,
                  price: _itemsList[index].price,
                  category: _itemsList[index].category,
                  image:  _itemsList[index].image,
                  name:  _itemsList[index].name,
                );
              },
            ),),
          ],
        );
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  final String price,name, group, brand, category, uom, image;
  final int id;

  ProductCard({
    this.id,
    this.image,
    this.name,
    this.brand,
    this.category,
    this.group,
    this.price,
    this.uom
});

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
            child: Column(
              children: [
                image == null ?
                Container(
                  width: 68.0,
                  height: 68.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/images/product_placeholder.jpg")
                      )
                  ),
                )
                    :
                CachedNetworkImage(
                  imageUrl: image,
                  imageBuilder: (context, imageProvider) => Container(
                    width: 68.0,
                    height: 68.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Container(
                    width: 68.0,
                    height: 68.0,
                    child:  Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    width: 68.0,
                    height: 68.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/images/product_placeholder.jpg")
                        )
                    ),
                  ),
                ),
                SizedBox(height: 12,),
                Text(
                  "Rs.${price.toString()}",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      // fontWeight: FontWeight.bold,
                      fontFamily: 'NanumGothic-Regular'),
                ),
              ],
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
                  name,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 19,
                      // fontWeight: FontWeight.bold,
                      fontFamily: 'NanumGothic-Bold'),
                ),

                SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "Brand",
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
                      brand,
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
                        "Group",
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
                      group,
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
                        "Category",
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
                      category,
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
                        "UOM",
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
                      uom,
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
