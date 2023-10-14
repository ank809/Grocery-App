import 'package:bloc_project/data/grocery_data.dart';
import 'package:bloc_project/features/home/bloc/home_bloc.dart';
import 'package:bloc_project/features/home/models/home_product_model.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final ProductModel productDataModel;
   final HomeBloc homeBloc;
  ProductTile({required this.productDataModel, required this.homeBloc});
 
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(14.0)),
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 200.0,
          width: double.maxFinite,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(productDataModel.imageURL))),
        ),
        Text(
          productDataModel.name,
          style: const TextStyle(
              fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        Text(productDataModel.description,
            style: const TextStyle(fontSize: 18.0, color: Colors.black)),
        Row(children: [
          Text('\$' + productDataModel.price.toString(),
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          IconButton(
              onPressed: () {
                homeBloc.add(HomeProductWishListButtonClickEvent(clickedProduct: productDataModel));
              },
              icon: Icon(Icons.favorite_border_outlined)),
          IconButton(
              onPressed: () {
                homeBloc.add(HomeProductCartButtonClickEvent(clickedProduct: productDataModel));
              },
              icon: const Icon(Icons.shopping_bag_outlined))
        ]),
      ]),
    );
  }
}
