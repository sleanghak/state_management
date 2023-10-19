import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'dart:async';
part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(counter: 0));

  Stream<CounterState> napEventToState(
    CounterEvent event,
  ) async* {
    if (event is CounterIncrementEvent) {
      yield CounterState(counter: state.counter + 1);
    }
  }
}
