import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_project/features/home/models/home_product_model.dart';
import 'package:bloc_project/features/home/ui/home.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeProductCartButtonClickEvent>( homeProductCartButtonClickEvent  );
    on<HomeProductWishListButtonClickEvent>(homeProductWishListButtonClickEvent);
    on<HomeCartButtonNavigateClickEvent>(homeCartButtonNavigateClickEvent );
    on<HomeWishListButtonNavigateClickEvent>( homeWishListButtonNavigateClickEvent);

    
  }

  FutureOr<void> homeProductWishListButtonClickEvent(HomeProductWishListButtonClickEvent event, Emitter<HomeState> emit) {
    log('Wish list button click event');
  }

  FutureOr<void> homeProductCartButtonClickEvent(HomeProductCartButtonClickEvent event, Emitter<HomeState> emit) {
    log('Cart button click event');
  }


  FutureOr<void> homeCartButtonNavigateClickEvent(HomeCartButtonNavigateClickEvent event, Emitter<HomeState> emit) {
   log('Cart navigate button click event');
   emit(HomeNavigateToCart());
  }

  FutureOr<void> homeWishListButtonNavigateClickEvent(HomeWishListButtonNavigateClickEvent event, Emitter<HomeState> emit) {
   log('Wishlist navigate button click event');
   // when th event is  clicked we need to listen to the action state 
   emit(HomeNavigateToWishlist());
  }
}
