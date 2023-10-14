part of 'home_bloc.dart';

sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishListButtonClickEvent extends HomeEvent {
  final ProductModel clickedProduct;
  HomeProductWishListButtonClickEvent({required this.clickedProduct});
}

class HomeProductCartButtonClickEvent extends HomeEvent {
  final ProductModel clickedProduct;
  HomeProductCartButtonClickEvent({required this.clickedProduct});
}

class HomeWishListButtonNavigateClickEvent extends HomeEvent {}

class HomeCartButtonNavigateClickEvent extends HomeEvent {}
class HomeProductWishlistedItem extends HomeActionState{}
class HomeProductCartedItem extends HomeActionState{}
