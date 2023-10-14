part of 'home_bloc.dart';

sealed class HomeState {}

//states are of two types:
// 1. that will build the ui
// 2. actionable state
final class HomeInitial extends HomeState {}

abstract class HomeActionState extends HomeState {}

// the data is loading or being fetched from the api
// loading indicator
class HomeLoadingState extends HomeState {}

// successfully fetched the data and now you are displaying it on the home screen
class HomeSuccessState extends HomeState {
  List<ProductModel> product;
  HomeSuccessState({required this.product});
}

// some error has occur
class HomeErrorState extends HomeState {}

// when you want to navigate to  wishlist page and it is a action state
class HomeNavigateToWishlist extends HomeActionState {}

class HomeNavigateToCart extends HomeActionState {}
