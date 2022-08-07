import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/Data/count_data.dart';
import 'package:flutter_practice/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Consumer(
              builder: (context, ref, child) => Text(ref.watch(titleProvider))),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Consumer(
                builder: (context, ref, child) => Text(
                  ref.watch(messageProvider),
                ),
              ),
              Consumer(
                builder: (context, ref, child) => Text(
                  ref.watch(countDataProvider.state).state.count.toString(),
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Consumer(
                    builder: (context, ref, child) => FloatingActionButton(
                      onPressed: () {
                        CountData countData =
                            ref.read(countDataProvider.state).state;
                        ref.read(countDataProvider.state).state =
                            countData.copyWith(
                                count: countData.count - 1,
                                countDown: countData.countDown + 1);
                      },
                      child: const Icon(CupertinoIcons.minus),
                    ),
                  ),
                  Consumer(
                    builder: (context, ref, child) => FloatingActionButton(
                      onPressed: () {
                        CountData countData =
                            ref.read(countDataProvider.state).state;
                        ref.read(countDataProvider.state).state =
                            countData.copyWith(
                                count: countData.count + 1,
                                countUp: countData.countUp + 1);
                      },
                      child: const Icon(CupertinoIcons.plus),
                    ),
                  ),
                ],
              ),
              Consumer(
                builder: (context, ref, child) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      ref
                          .watch(countDataProvider.state)
                          .state
                          .countDown
                          .toString(),
                    ),
                    Text(
                      ref
                          .watch(countDataProvider.state)
                          .state
                          .countUp
                          .toString(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Consumer(
          builder: (context, ref, child) => FloatingActionButton(
            onPressed: () {
              ref.read(countDataProvider.state).state = CountData(
                count: 0,
                countDown: 0,
                countUp: 0,
              );
            },
            child: const Icon(CupertinoIcons.refresh),
          ),
        ),
      ),
    );
  }
}
