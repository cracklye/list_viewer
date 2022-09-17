import 'package:flex_test/flex_test.dart';
import 'package:flutter/material.dart';
import 'package:woue_components/woue_components.dart';

var allTests = [
  woue_components,
  unitListViewer,
  sampleTest2,
  sampleGrid,
  sampleColumn,
  sampleListView,
  sampleTab
];

var unitListViewer = TestGroup("Sample Test 1", [
  TestDefinition("Normal Folder",
      (context, params, log, environment) => Text("Test $environment")),
  TestDefinition(
      "Test Button",
      (context, params, log, environment) => ElevatedButton(
          child: Text("Test $environment"),
          onPressed: () => log("Sample message"))),
]);

var sampleTest2 = TestGroup("Sample Test 2", [
  TestDefinition("Normal Folder",
      (context, params, log, environment) => Text("Test $environment")),
  TestDefinition("Normal Folder2",
      (context, params, log, environment) => Text("Test $environment")),
  TestDefinition("Normal Folder3",
      (context, params, log, environment) => Text("Test $environment")),
  TestDefinition("Normal Folder4",
      (context, params, log, environment) => Text("Test $environment")),
]);

var sampleGrid = TestGroup("Grid Test", pageType: TestPageType.grid, [
  TestDefinition("Normal Folder",
      (context, params, log, environment) => Text("Test $environment")),
  TestDefinition("Normal Folder2",
      (context, params, log, environment) => Text("Test $environment")),
  TestDefinition("Normal Folder3",
      (context, params, log, environment) => Text("Test $environment")),
  TestDefinition("Normal Folder4",
      (context, params, log, environment) => Text("Test $environment")),
]);

var sampleColumn = TestGroup("Column Test", pageType: TestPageType.column, [
  TestDefinition("Normal Folder",
      (context, params, log, environment) => Text("Test $environment")),
  TestDefinition("Normal Folder2",
      (context, params, log, environment) => Text("Test $environment")),
  TestDefinition("Normal Folder3",
      (context, params, log, environment) => Text("Test $environment")),
  TestDefinition("Normal Folder4",
      (context, params, log, environment) => Text("Test $environment")),
]);

var sampleListView =
    TestGroup("List View Test", pageType: TestPageType.listview, [
  TestDefinition("Normal Folder",
      (context, params, log, environment) => Text("Test $environment")),
  TestDefinition("Normal Folder2",
      (context, params, log, environment) => Text("Test $environment")),
  TestDefinition("Normal Folder3",
      (context, params, log, environment) => Text("Test $environment")),
  TestDefinition("Normal Folder4",
      (context, params, log, environment) => Text("Test $environment")),
]);
var sampleTab = TestGroup("Tab Test", pageType: TestPageType.tab, [
  TestDefinition("Normal Folder",
      (context, params, log, environment) => Text("Test $environment")),
  TestDefinition("Normal Folder2",
      (context, params, log, environment) => Text("Test $environment")),
  TestDefinition("Normal Folder3",
      (context, params, log, environment) => Text("Test $environment")),
  TestDefinition("Normal Folder4",
      (context, params, log, environment) => Text("Test $environment")),
]);

var woue_components = TestGroup("WOUE Components", [
  TestDefinition(
      "WOUEDebug", (context, params, log, environment) => WoueDebug()),
  TestDefinition(
      "WOEButton", (context, params, log, environment) => WoueButton()),
  TestDefinition("WOUELabel",
      (context, params, log, environment) => WoueShowDesignFramework()),
]);
