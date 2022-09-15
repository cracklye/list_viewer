import 'package:flutter/material.dart';
import 'package:list_viewer_test/bloc/test_bloc_state.dart';

import '../test_definition.dart';
import 'test_widget_base.dart';

class TestPageWidgetMaterial extends ATestPageWidget {
  const TestPageWidgetMaterial({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  State<StatefulWidget> createState() => _TestPageWidgetMaterial();
}

class _TestPageWidgetMaterial extends ATestPageState<TestPageWidgetMaterial> {
  @override
  Widget buildButton(BuildContext context, TestBlocState state, String label,
      Function() onPress) {
    return ElevatedButton(onPressed: onPress, child: Text(label));
  }

  @override
  Widget buildDropdown<T>(BuildContext context, TestBlocState state,
      List<T> options, T? selectedValue, Function(T?) onChanged) {
    return DropdownButton<T>(
      value: selectedValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: onChanged,
      items: options.map<DropdownMenuItem<T>>((T value) {
        return DropdownMenuItem<T>(
          value: value,
          child: Text(value.toString()),
        );
      }).toList(),
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
    return Slider(max: max, min: min, value: value, onChanged: onChange);
  }


}
