import 'package:list_viewer_test/bloc/test_case.dart';
import 'package:list_viewer_test/test_definition.dart';

enum TestEnvironment { yaru, fluent, material, cuppachino, macos }

class TestBlocState {
  final List<TestGroup> tests;
  final TestEnvironment? testEnvironment;
  final TestGroup? selectedGroup;
  final TestDefinition? selectedTest;

  TestBlocState(this.tests, this.testEnvironment,
      {this.selectedTest, this.selectedGroup});

  TestBlocState copy(
      {TestEnvironment? testEnvironment,
      TestDefinition? selectedTest,
      TestGroup? selectedGroup}) {
    return TestBlocState(
      tests,
      testEnvironment ?? this.testEnvironment,
      selectedTest: selectedTest ?? this.selectedTest,
      selectedGroup: selectedGroup ?? this.selectedGroup,
    );
  }
}
