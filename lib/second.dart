import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split_view_poc/home/bloc/home_bloc.dart';
import 'package:split_view_poc/split_screen.dart';

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.read<HomeBloc>().add(
                      SplitScreenEvent(
                        splitViewStatus: SplitViewStatus.split,
                        child: const Second(),
                      ),
                    );
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SplitScreen()),
                );
              },
              child: const Text('Start split screen'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<HomeBloc>().add(
                      SplitScreenEvent(
                        splitViewStatus: SplitViewStatus.normal,
                        child: const SizedBox(),
                      ),
                    );
              },
              child: const Text('End split screen'),
            ),
            Expanded(
                child: ListView.separated(
              itemCount: 100,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) => Text('$index'),
            )),
          ],
        ),
      ),
    );
  }
}
