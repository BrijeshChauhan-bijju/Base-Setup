import 'package:flutter_bloc/flutter_bloc.dart';
import 'bottom_navigation_event.dart';

class BottomNavigationBloc extends Bloc<BottomNavigationEvent, int> {
  BottomNavigationBloc() : super(0) {
    on<PageTapped>(
      (event, emit) async {
        emit(event.selectedPage);
      },
    );
  }
}
