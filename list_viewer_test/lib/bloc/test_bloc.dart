import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_viewer_test/bloc/test_bloc_event.dart';
import 'package:list_viewer_test/bloc/test_bloc_state.dart';
import 'package:list_viewer_test/bloc/test_case.dart';
import 'package:list_viewer_test/test_definition.dart';
import 'package:list_viewer_test/widgets/woue_base.dart';
import 'package:list_viewer_test/widgets/woue_button.dart';

class TestBloc extends Bloc<TestBlocEvent, TestBlocState> {
  TestBloc(List<TestGroup> tests, TestEnvironment env)
      : super(TestBlocState(tests, env)) {
    on<TestBlocEventSelectEnvironment>(_onTestBlocEventSelectEnvironment);
    on<TestBlocEventSelectTestCase>(_onTestBlocEventSelectTestCase);
  }

  Future<void> _onTestBlocEventSelectEnvironment(
      TestBlocEventSelectEnvironment event, Emitter<TestBlocState> emit) async {
    emit(state.copy(testEnvironment: event.environment));
    WOUEBase.environment = event.environment;
  }

  Future<void> _onTestBlocEventSelectTestCase(
      TestBlocEventSelectTestCase event, Emitter<TestBlocState> emit) async {
    if (state.selectedGroup == null && event.testGroup == null) {
      emit(state.copy(selectedGroup: state.tests[0]));
    }
    if (event.testGroup != null) {
      emit(state.copy(selectedGroup: event.testGroup));
    }
  }
}
