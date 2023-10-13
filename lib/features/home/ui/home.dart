import 'package:bloc_project/features/cart/ui/cart.dart';
import 'package:bloc_project/features/home/bloc/home_bloc.dart';
import 'package:bloc_project/features/wishlist/ui/wishList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

//pass an event to the bloc -> state
class _HomeState extends State<Home> {
  final HomeBloc homeBloc= HomeBloc();
  @override
  Widget build(BuildContext context) {

    // blocConsume listen to events and states also 
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      // only want to listen when get an action state 
      // only want to build when i dont get an action state 
      listenWhen: (previous, current)=>current is HomeActionState,
       buildWhen: (previous, current) =>  current is !HomeActionState,
      listener: (context, state) {
        // TODO: implement listener
        if(state is HomeNavigateToWishlist){
          // Get.to(WishListPage());
          Navigator.push(context, MaterialPageRoute(builder: (context)=> WishListPage()));
        }
        else if(state is HomeNavigateToCart){
          //Get.to(CartPage());
          Navigator.push(context, MaterialPageRoute(builder: (context)=> CartPage()));

        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Ankita's Grocery Store"),
            actions: [
              IconButton(onPressed: (){
                homeBloc.add(HomeWishListButtonNavigateClickEvent());
              }, icon: Icon(Icons.favorite_border_outlined)),
              IconButton(onPressed: (){
                homeBloc.add(HomeCartButtonNavigateClickEvent());
              }, icon: Icon(Icons.shopping_bag_outlined))
            ],
          ),
        );
      },
    );
  }
}
