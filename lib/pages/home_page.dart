import 'package:belajar_bloc/bloc/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Counter myCounter = context.read<Counter>();
    ThemeBloc myThemes = context.read<ThemeBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Cubik'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MultiBlocListener(
            listeners: [
              BlocListener<Counter, int>(
                listener: (context, state) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(seconds: 1),
                      content: Text("Kamu melewati angka 10"),
                    ),
                  );
                },
                listenWhen: (previous, current) {
                  if (current == 10) {
                    return true;
                  } else {
                    return false;
                  }
                },
              ),
              BlocListener<ThemeBloc, bool>(
                listener: (context, state) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(seconds: 1),
                      content: Text("Dark Mode Aktif"),
                    ),
                  );
                },
                listenWhen: (previous, current) {
                  if (current == false) {
                    return true;
                  } else {
                    return false;
                  }
                },
              )
            ],
            child: BlocBuilder(
              bloc: myCounter,
              builder: (context, state) {
                return Text(
                  '$state',
                  style: const TextStyle(fontSize: 30),
                );
              },
            ),
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
      floatingActionButton: FloatingActionButton(onPressed: () {
        myThemes.changeTheme();
      }, child: BlocBuilder<ThemeBloc, bool>(
        builder: (context, state) {
          return myThemes.state == true
              ? const Icon(Icons.dark_mode)
              : const Icon(Icons.light_mode);
        },
      )),
    );
  }
}
