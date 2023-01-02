import 'package:equatable/equatable.dart';

abstract class BottomNavigationEvent extends Equatable {
  const BottomNavigationEvent();

  @override
  List<Object?> get props => [];
}

class AppStarted extends BottomNavigationEvent {}

class PageTapped extends BottomNavigationEvent {
  PageTapped({
    required this.selectedPage,
  });
  int selectedPage = 0;

  @override
  List<Object?> get props => [selectedPage];
}
