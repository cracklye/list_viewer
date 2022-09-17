import 'package:flutter/widgets.dart';

class TestStatefulWrapper<T> extends StatefulWidget {
  final T? initialValue;
  final Map<String, dynamic> params;
  final Function(String) log;
  final Widget Function(
    BuildContext,
    Map<String, dynamic>,
    Function(String),
    T?,
    Function(T?),
  ) buildFunction;

  const TestStatefulWrapper(
      {Key? key,
      this.initialValue,
      required this.buildFunction,
      required this.log,
      required this.params})
      : super(key: key);

  @override
  State<TestStatefulWrapper<T>> createState() => _TestStatefulWrapperState<T>();
}

class _TestStatefulWrapperState<T> extends State<TestStatefulWrapper<T>> {
  T? value;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return widget.buildFunction(
        context,
        widget.params,
        widget.log,
        value,
        (newvalue) => setState(() {
              value = newvalue;
            }));
  }
}
