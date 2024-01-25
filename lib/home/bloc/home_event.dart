part of 'home_bloc.dart';

class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SplitScreenEvent extends HomeEvent {
  final Widget child;
  final SplitViewStatus splitViewStatus;

  SplitScreenEvent({
    required this.child,
    required this.splitViewStatus,
  });
}
