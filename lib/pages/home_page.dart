import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Counter myCounter = BlocProvider.of<Counter>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Cubik'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder(
            bloc: myCounter,
            builder: (context, state) {
              return Text(
                '$state',
                style: const TextStyle(fontSize: 30),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  myCounter.decrement();
                },
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  myCounter.increment();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
