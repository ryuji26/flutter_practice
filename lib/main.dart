import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/Data/count_data.dart';
import 'package:flutter_practice/provider.dart';
import 'package:flutter_practice/view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  ViewModel _viewModel = ViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.setRef(ref);
  }

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
                  _viewModel.count,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Consumer(
                    builder: (context, ref, child) => FloatingActionButton(
                      onPressed: _viewModel.onDecrease,
                      child: const Icon(CupertinoIcons.minus),
                    ),
                  ),
                  Consumer(
                    builder: (context, ref, child) => FloatingActionButton(
                      onPressed: _viewModel.onIncrease,
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
                      _viewModel.countDown,
                    ),
                    Text(
                      _viewModel.countUp,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Consumer(
          builder: (context, ref, child) => FloatingActionButton(
            onPressed: _viewModel.onReset,
            child: const Icon(CupertinoIcons.refresh),
          ),
        ),
      ),
    );
  }
}
