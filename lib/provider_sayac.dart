// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProviderSayac extends StatelessWidget {
  const ProviderSayac({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Stream ve Provider Deneme"),
      ),
      body: const CounterDisplay(),
      floatingActionButton: const ActionButtons()
    );
  }
  
}

class CounterDisplay extends ConsumerWidget {
  const CounterDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    Counter counter=ref.watch(counterProvider);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
          ),
          Text(counter.toString(),style:Theme.of(context).textTheme.headlineLarge,)
          
        ],
      ),
    );
  }
}

class ActionButtons extends ConsumerWidget {
  const ActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
      FloatingActionButton(
      mini: true,
      isExtended: true,
      onPressed: () {
        ref.read(counterProvider.notifier).arttir();
      },
      tooltip: 'Increment',
      child: const Icon(Icons.exposure_plus_1_outlined),
    ),
    FloatingActionButton(
      onPressed: () {
        ref.read(counterProvider.notifier).azalt();
      },
      tooltip: 'Increment',
      child: const Icon(Icons.exposure_minus_1_outlined),
    ),
    FloatingActionButton(
      onPressed: () {
        ref.read(counterProvider.notifier).resetle();
      },
      tooltip: 'Increment',
      child: const Icon(Icons.restart_alt_rounded),
    ),
    ],);
  }
}


class Counter {
  int count;
  Counter({this.count=0});

  @override
  String toString() => '$count';
}

class CounterManagment extends StateNotifier<Counter>{

  CounterManagment():super(Counter());

  void arttir(){
    state=Counter(count: state.count+1);
  }
  void azalt(){
    state=Counter(count: state.count-1);
  }
  void resetle(){
    state=Counter();
  }
}


final counterProvider=StateNotifierProvider<CounterManagment,Counter>((ref) => CounterManagment());