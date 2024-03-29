import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<SplitScreenEvent>((event, emit) {
      emit(state.copyWith(
        splitViewStatus: event.splitViewStatus,
        child: event.child,
      ));
    });
  }
}
