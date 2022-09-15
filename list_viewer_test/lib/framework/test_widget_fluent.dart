import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:list_viewer_test/bloc/test_bloc_state.dart';

import '../test_definition.dart';
import 'test_widget_base.dart';

class TestPageWidgetFluent extends ATestPageWidget {
  const TestPageWidgetFluent({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TestPageWidgetFluent();
}

class _TestPageWidgetFluent extends ATestPageState<TestPageWidgetFluent> {
  @override
  Widget buildButton(BuildContext context, TestBlocState state, String label,
      Function() onPress) {
    return FilledButton(
      onPressed: onPress,
      child: Text(label),
    );
  }

  @override
  Widget buildListEntryTestLog(BuildContext context, TestLog log, int index) {
    return ListTile(
      title: Text(log.message),
      subtitle: Text(log.test.name),
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
      child: Slider(
        max: max, min: min,
        value: value,
        onChanged: onChange,
        // Label is the text displayed above the slider when the user is interacting with it.
        label: '${value.toInt()}',
      ),
    );
  }

  @override
  Widget buildDropdown<T>(BuildContext context, TestBlocState state,
      List<T> options, T? selectedValue, Function(T? p1) onChanged) {
    return SizedBox(
        width: 200,
        child: Combobox<T>(
          placeholder: Text('Selected list item'),
          isExpanded: true,
          items: options
              .map((e) => ComboboxItem<T>(
                    value: e,
                    child: Text(e.toString()),
                  ))
              .toList(),
          value: selectedValue,
          onChanged: onChanged,
        ));
  }
}
