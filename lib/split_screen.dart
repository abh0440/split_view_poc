// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split_view/split_view.dart';
import 'package:split_view_poc/home/bloc/home_bloc.dart';
import 'package:split_view_poc/home/home.dart';

class SplitScreen extends StatefulWidget {
  const SplitScreen({super.key});

  @override
  State<SplitScreen> createState() => _SplitScreenState();
}

class _SplitScreenState extends State<SplitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.splitViewStatus == SplitViewStatus.split) {
            return SplitView(
              viewMode: SplitViewMode.Vertical,
              indicator: const SplitIndicator(viewMode: SplitViewMode.Vertical),
              activeIndicator: const SplitIndicator(
                viewMode: SplitViewMode.Vertical,
                isActive: true,
              ),
              controller:
                  SplitViewController(limits: [null, WeightLimit(max: 0.5)]),
              onWeightChanged: (w) => print("Vertical $w"),
              children: [
                Container(
                  color: Colors.purple,
                  child: state.child,
                ),
                Container(
                  color: Colors.yellow,
                  child: const Home(),
                ),
              ],
            );
          } else if (state.splitViewStatus == SplitViewStatus.normal) {
            return const Home();
          }
          return const SizedBox();
        },
      ),
    );
  }
}
