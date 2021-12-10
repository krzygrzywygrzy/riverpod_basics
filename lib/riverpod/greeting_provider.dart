import 'package:flutter_riverpod/flutter_riverpod.dart';

class Greeting {
  Greeting(this.greeting);

  final String greeting;
}

class GreetingProvider extends StateNotifier<Greeting> {
  GreetingProvider() : super(Greeting("Nice guitar"));

  changeState(String update) {
    state = Greeting(update);
  }
}

final greetingProvider = StateNotifierProvider<GreetingProvider, Greeting>(
    (ref) => GreetingProvider());
