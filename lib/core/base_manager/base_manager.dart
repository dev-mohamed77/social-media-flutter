import 'dart:async';

import 'package:rxdart/subjects.dart';
import 'package:socailmedia/core/base_manager/common/state_flow.dart';

abstract class BaseManager extends BaseManagerInputs with BaseManagerOutputs {
  // shared variables and functions that will be usesd through any base manager

  final StreamController _inputStateStreamController =
      BehaviorSubject<FlowState>();

  @override
  Sink get inputState => _inputStateStreamController.sink;

  @override
  Stream<FlowState> get outputState =>
      _inputStateStreamController.stream.map((flowState) => flowState);

  @override
  void dispose() {
    _inputStateStreamController.close();
  }
}

abstract class BaseManagerInputs {
  dispose();
  strat();

  Sink get inputState;
}

abstract class BaseManagerOutputs {
  Stream<FlowState> get outputState;
}
