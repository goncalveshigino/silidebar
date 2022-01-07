import 'package:bloc/bloc.dart';
import 'package:shoes_app/pages/home/home_page.dart';
import 'package:shoes_app/pages/home/order_page.dart';
import 'package:shoes_app/pages/product/account_page.dart';

enum NavigationEvents {
  HomePageChickedEvent,
  AcccountPageChickedEvent,
  OrderPageChickedEvent
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {

  // @override
  // NavigationStates get initialState => HomePage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
     
     switch(event){
      case NavigationEvents.HomePageChickedEvent:
       yield HomePage();
       break;
      case NavigationEvents.AcccountPageChickedEvent:
       yield AccountPage();
       break;
      case NavigationEvents.OrderPageChickedEvent:
       yield OrderPage();
       break;
     }
  }
}
