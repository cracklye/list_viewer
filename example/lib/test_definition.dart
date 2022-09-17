import 'package:flutter/material.dart';
import 'package:list_viewer_test/bloc/test_bloc_state.dart';

class TestDefinition {
  final String name;
  final String? description;
  final Widget Function(BuildContext, Map<String, dynamic>, Function(String),
      TestEnvironment environment) buildTestWidget;

  TestDefinition(this.name, this.buildTestWidget, {this.description});

  Widget build(BuildContext context, Map<String, dynamic> params,
      Function(String) log, TestEnvironment environment) {
    return buildTestWidget(context, params, log, environment);
  }
}

class TestLog {
  final TestGroup group;
  final TestDefinition test;
  final String message;
  final DateTime? date;
  TestLog(this.message, this.test, this.group, [this.date]);
}

enum TestPageType { grid, listview, tab, column }

class TestGroup {
  final String name;
  final String? description;

  final List<TestDefinition> tests;
  final TestPageType pageType;
  final Function(Map<String, dynamic>, Function(String, dynamic))?
      buildOptionPanel;
  TestGroup(this.name, this.tests,
      {this.description,
      this.pageType = TestPageType.listview,
      this.buildOptionPanel});

  @override
  String toString() {
    return name;
  }
}
