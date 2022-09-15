import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_viewer_test/bloc/test_bloc.dart';
import 'package:list_viewer_test/bloc/test_bloc_event.dart';
import 'package:list_viewer_test/bloc/test_bloc_state.dart';

import '../test_definition.dart';

abstract class ATestPageWidget extends StatefulWidget {
  const ATestPageWidget({Key? key}) : super(key: key);
}

abstract class ATestPageState<P extends ATestPageWidget> extends State<P> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestBloc, TestBlocState>(builder: (context, state) {
      return Row(
        children: [
          buildOptionPanel(context, state),
          buildComponentTest(context, state),
          buildTestScripts(context, state),
        ],
      );
    });
  }

  Widget buildListEntryTestLog(BuildContext context, TestLog log, int index);

  Widget buildTestScripts(
    BuildContext context,
    TestBlocState state,
  ) {
    return SizedBox(
        width: 300,
        child: Text("Need to implement log in the bloc")
        // ListView.builder(
        //   controller: ScrollController(),
        //   shrinkWrap: true,
        //   itemBuilder: (context, index) =>
        //       buildListEntryTestLog(context, log[index], index),
        //   itemCount: log.length,
        // )
        //Text(log.toString())

        );
  }

  double componentWidth = 500;
  //TestGroup? selectedGroup;
  //List<TestLog> log = [];
  Map<String, dynamic> parameters = {};

  void setParameters(String key, dynamic paramValue) {
    parameters.update(key, (value) => paramValue, ifAbsent: () => paramValue);
    setState(() {
      parameters = parameters;
    });
  }

  Widget buildButton(BuildContext context, TestBlocState state, String label,
      Function() onPress);
  Widget buildSlider(BuildContext context, TestBlocState state, double min,
      double max, double value, Function(double) onChange);

  Widget buildOptionPanel(BuildContext context, TestBlocState state) {
    //Build the widget
    List<Widget> allWidgets = [
      buildTestComboBox(context, state),
      buildButton(
        context,
        state,
        "Clear Log",
        () {
          setState(() {
           // log = [];
          });
        },
      ),
      buildButton(context, state, 'Select First', () {
        BlocProvider.of<TestBloc>(context).add(TestBlocEventSelectTestCase());

        // setState(() {
        //   selectedGroup = state.tests[0];
        // });
      }),
      Text('Width ${componentWidth.toInt()}'),
      buildSlider(
          context,
          state,
          50.0,
          1000.0,
          componentWidth,
          (value) => setState(() {
                componentWidth = value;
              }))
    ];
    if (state.selectedGroup != null &&
        state.selectedGroup!.buildOptionPanel != null) {
      allWidgets.addAll(
          state.selectedGroup!.buildOptionPanel!(parameters, setParameters));
    }

    //final Orientation orientation = MediaQuery.of(context).orientation;
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: allWidgets,
        ));
  }

  List<Widget> getAllTestWidgets(
      BuildContext context, TestBlocState state, TestGroup group) {
    List<Widget> rtn = [];

    for (var test in group.tests) {
      rtn.add(doGenerate(context, state, group, test, parameters,
          (message) => addToLog(message, test, group)));
    }
    return rtn;
  }

  // Widget doGenerate(BuildContext context, TestBlocState state, TestGroup group,
  //     TestDefinition test, Map<String, dynamic> params, Function(String) log);

  Widget doGenerate(
      BuildContext context,
      TestBlocState state,
      TestGroup group,
      TestDefinition test,
      Map<String, dynamic> params,
      Function(String p1) log) {
    return test.buildTestWidget!(
        context,
        parameters,
        (message) => addToLog(message, test, group),
        state.testEnvironment ?? TestEnvironment.fluent);
  }

  void addToLog(message, TestDefinition test, TestGroup group) {
    // log.insert(0, TestLog(message, test, group));
    // setState(() {
    //   log = log;
    // });
  }

  Widget buildComponentTest(
    BuildContext context,
    TestBlocState state,
  ) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
                //color: Colors.red,
                ),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: SizedBox(
            height: double.infinity,
            width: componentWidth,
            child: state.selectedGroup != null
                ? buildSelectedTestType(context, state, state.selectedGroup!)
                : const Text("No group selected")));
  }

  Widget buildSelectedTestType(
      BuildContext context, TestBlocState state, TestGroup group) {
    if (group.pageType == TestPageType.grid) {
      return buildGridView(context, state, group);
    } else if (group.pageType == TestPageType.listview) {
      return buildListView(context, state, group);
    } else if (group.pageType == TestPageType.column) {
      return buildColumn(context, state, group);
    }
    return const Text("Unhandled type");
  }

  Widget buildGridView(
      BuildContext context, TestBlocState state, TestGroup group) {
    List<Widget> items = getAllTestWidgets(context, state, group);

    return GridView.count(
      crossAxisCount: 3,
      children: items,
    );
  }

  Widget buildListView(
      BuildContext context, TestBlocState state, TestGroup group) {
    return ListView(
      shrinkWrap: true,
      children: getAllTestWidgets(context, state, group),
    );
  }

  Widget buildColumn(
      BuildContext context, TestBlocState state, TestGroup group) {
    return Column(
      children: getAllTestWidgets(context, state, group),
    );
  }

  Widget buildDropdown<T>(BuildContext context, TestBlocState state,
      List<T> options, T? selectedValue, Function(T?) onChanged);

  Widget buildTestComboBox(
    BuildContext context,
    TestBlocState state,
  ) {
    return buildDropdown<TestGroup>(
        context,
        state,
        state.tests,
        state.selectedGroup,
        (value) => BlocProvider.of<TestBloc>(context)
            .add(TestBlocEventSelectTestCase(testGroup: value))
        // setState(() {
        //       selectedGroup = value;
        //     })
        );
  }
}
