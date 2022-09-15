import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart' as c;

import 'package:flutter/material.dart' as m;
import 'package:flutter/widgets.dart' as w;
import 'package:list_viewer_test/bloc/test_bloc_state.dart';
import 'package:list_viewer_test/widgets/woue_base.dart';

class WOUEButton extends StatelessWidget {
  const WOUEButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (WOUEBase.isFluent(context)) {
      return Button(child: Text("Test"), onPressed: () => print("Test"));
    }
    //var a =  context.dependOnInheritedWidgetOfExactType<m.Scaffold>();
    try {
      var a = m.Theme.of(context);
      var b = c.CupertinoTheme.of(context);
      var d = FluentTheme.of(context);
    } catch (e) {
      print(e);
    }

    c.CupertinoContextMenu;

    return Text("Not handled");
  }
}

