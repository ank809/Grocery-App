import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_project/data/cart_data.dart';
import 'package:bloc_project/features/cart/bloc/cart_bloc.dart';
import 'package:bloc_project/features/home/models/home_product_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
  on<CartInitialEvent>(cartInitialEvent);
  }

  FutureOr<void> cartInitialEvent(event, Emitter<CartState> emit) {
    emit(CartSuccessState(carItems: CartItem().cart));
  }
}
