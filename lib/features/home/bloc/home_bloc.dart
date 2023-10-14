import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:bloc_project/data/cart_data.dart';
import 'package:bloc_project/data/grocery_data.dart';
import 'package:bloc_project/data/wishlist_data.dart';
import 'package:bloc_project/features/home/models/home_product_model.dart';
import 'package:bloc_project/features/home/ui/home.dart';
import 'package:bloc_project/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:get/get.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeProductCartButtonClickEvent>(homeProductCartButtonClickEvent);
    on<HomeProductWishListButtonClickEvent>(
        homeProductWishListButtonClickEvent);
    on<HomeCartButtonNavigateClickEvent>(homeCartButtonNavigateClickEvent);
    on<HomeWishListButtonNavigateClickEvent>(
        homeWishListButtonNavigateClickEvent);
    on<HomeInitialEvent>(homeInitialEvent);
  }
  FutureOr<void> homeInitialEvent (
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
   await Future.delayed(Duration(seconds: 3));
    emit(HomeSuccessState(
      // here e is just a name of the map  
        product: GroceryData.groceryProducts
            .map((e) => ProductModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageURL: e['imageURL']))
            .toList()));
  }

  FutureOr<void> homeProductWishListButtonClickEvent(
      HomeProductWishListButtonClickEvent event, Emitter<HomeState> emit) {
    log('Wish list button click event');
    WishlistItem().wishlist.add(event.clickedProduct);
    emit(HomeProductWishlistedItem());
  }

  FutureOr<void> homeProductCartButtonClickEvent(
      HomeProductCartButtonClickEvent event, Emitter<HomeState> emit) {
    log('Cart button click event');
    CartItem().cart.add(event.clickedProduct);
    emit(HomeProductCartedItem());
  }

  FutureOr<void> homeCartButtonNavigateClickEvent(
      HomeCartButtonNavigateClickEvent event, Emitter<HomeState> emit) {
    log('Cart navigate button click event');
    emit(HomeNavigateToCart());
  }

  FutureOr<void> homeWishListButtonNavigateClickEvent(
      HomeWishListButtonNavigateClickEvent event, Emitter<HomeState> emit) {
    log('Wishlist navigate button click event');
    // when th event is  clicked we need to listen to the action state
    emit(HomeNavigateToWishlist());
  }
}
