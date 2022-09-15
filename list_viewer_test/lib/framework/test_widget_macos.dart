import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:list_viewer_test/bloc/test_bloc_state.dart';
import 'package:macos_ui/macos_ui.dart';

import '../test_definition.dart';
import 'test_widget_base.dart';

class TestPageWidgetMacos extends ATestPageWidget {
  const TestPageWidgetMacos({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TestPageWidgetMacos();
}

class _TestPageWidgetMacos extends ATestPageState<TestPageWidgetMacos> {
  @override
  Widget buildButton(BuildContext context, TestBlocState state, String label,
      Function() onPress) {
    return PushButton(
      child: Text(label),
      buttonSize: ButtonSize.large,
      onPressed: onPress,
    );
  }

  @override
  Widget buildListEntryTestLog(BuildContext context, TestLog log, int index) {
    //  return ListTile(
    //   title: Text(log.message),
    //   subtitle: Text(log.test.name),
    // );

    return MacosListTile(
      leading: const Icon(CupertinoIcons.lightbulb),
      title: Text(
        log.message,
        style: MacosTheme.of(context).typography.headline,
      ),
      subtitle: Text(
        log.test.name,
        style: MacosTheme.of(context).typography.subheadline.copyWith(
              color: MacosColors.systemGrayColor,
            ),
      ),
    );
  }

  @override
  Widget buildSlider(BuildContext context, TestBlocState state, double min,
      double max, double value, Function(double p1) onChange) {
    return SizedBox(
        // The default width is 200.
        // The slider does not have its own widget, so you have to add it yourself.
        // The slider always try to be as big as possible
        width: 200,
        child: Text("Test")
        // Slider(
        //   max: max, min: min,
        //   value: value,
        //   onChanged: onChange,
        //   // Label is the text displayed above the slider when the user is interacting with it.
        //   label: '${value.toInt()}',
        // ),
        );
  }

  @override
  Widget buildDropdown<T>(BuildContext context, TestBlocState state,
      List<T> options, T? selectedValue, Function(T? p1) onChanged) {
    return MacosPopupButton<T>(
      value: selectedValue,
      onChanged: onChanged,
      items: options.map<MacosPopupMenuItem<T>>((T value) {
        return MacosPopupMenuItem<T>(
          value: value,
          child: Text(value.toString()),
        );
      }).toList(),
    );

    // return SizedBox(
    //     width: 200,
    //     child: Combobox<T>(
    //       placeholder: Text('Selected list item'),
    //       isExpanded: true,
    //       items: options
    //           .map((e) => ComboboxItem<T>(
    //                 value: e,
    //                 child: Text(e.toString()),
    //               ))
    //           .toList(),
    //       value: selectedValue,
    //       onChanged: onChanged,
    //     ));
  }

  @override
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
}
