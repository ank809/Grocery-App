import 'package:bloc_project/features/cart/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cartBloc.add(CartInitialEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cart Items'),
        ),
        body: BlocConsumer<CartBloc, CartState>(
          bloc: cartBloc, 
          listenWhen: (previous, current) => current is CartActionState,
          buildWhen: (previous, current) => current is !CartActionState,
            listener: (context, state)=> {} ,
            builder: (context, state) {
              switch (state.runtimeType) {
                case CartSuccessState:
                  final successstate= state as CartSuccessState;
                  break;
                default:
              }
            },
           )
            );
  }
}
