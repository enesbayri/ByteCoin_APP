
import 'dart:async';

import 'package:flutter/material.dart';

class StreamSayac extends StatelessWidget {
  const StreamSayac({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Stream ve Provider Deneme"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder(
              stream: MyCounterStream.stream,
              initialData: 0,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return Text(snapshot.data.toString());
              },
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder(
              stream: MyCounterStream.stream,
              initialData: 0,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return Text(snapshot.data.toString());
              },
            ),
          ],
        ),
      ),
      floatingActionButton:const ActionButtons()
    );
  }
  
}

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
      FloatingActionButton(
      mini: true,
      isExtended: true,
      onPressed: () {
        MyCounterStream.addData();
      },
      tooltip: 'Increment',
      child: const Icon(Icons.exposure_plus_1_outlined),
    ),
    FloatingActionButton(
      onPressed: () {
        MyCounterStream.minusData();
      },
      tooltip: 'Increment',
      child: const Icon(Icons.exposure_minus_1_outlined),
    ),
    FloatingActionButton(
      onPressed: () {
        MyCounterStream.resetData();
      },
      tooltip: 'Increment',
      child: const Icon(Icons.restart_alt_rounded),
    ),
    ],);
  }
}



class MyCounterStream{
  static StreamController<int> controller=StreamController<int>.broadcast();
  static Stream<int> get stream=>controller.stream;
  static Sink<int> get mySink=>controller.sink;

  static int getData=0;

  static void addData(){
    mySink.add(++getData);
  }

  static void minusData(){
    mySink.add(--getData);
  }
  static void resetData(){
    getData=0;
    mySink.add(getData);
  }

}

