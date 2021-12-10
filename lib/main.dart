// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/riverpod/greeting_provider.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
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
      home: Home(),
    );
  }
}

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Consumer(
          builder: (context, ref, _) {
            final data = ref.watch(greetingProvider);
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(data.greeting),
                MaterialButton(
                  onPressed: () {
                    ref.read(greetingProvider.notifier).changeState("Damn");
                  },
                  child: Text("Update"),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
