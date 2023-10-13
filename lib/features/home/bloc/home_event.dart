part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}
class HomeProductWishListButtonClickEvent extends HomeEvent{
  
}
class HomeProductCartButtonClickEvent extends HomeEvent{
 
}
class HomeWishListButtonNavigateClickEvent extends HomeEvent{

}
class HomeCartButtonNavigateClickEvent extends HomeEvent{

}

