part of 'home_bloc.dart';

enum SplitViewStatus { normal, split }

class HomeState extends Equatable {
  final SplitViewStatus splitViewStatus;
  final Widget child;

  const HomeState({
    this.splitViewStatus = SplitViewStatus.normal,
    this.child = const SizedBox(),
  });

  HomeState copyWith({
    SplitViewStatus? splitViewStatus,
    Widget? child,
  }) {
    return HomeState(
      splitViewStatus: splitViewStatus ?? this.splitViewStatus,
      child: child ?? this.child,
    );
  }

  @override
  List<Object> get props => [splitViewStatus, child];
}
