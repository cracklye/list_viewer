import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart' as c;

import 'package:flutter/material.dart' as m;
import 'package:flutter/widgets.dart' as w;

class WOUEButton extends StatelessWidget {
  const WOUEButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (WOUEBase.isFluent(context)) {
      return Button(child: Text("Test"), onPressed: () => print("Test"));
    }
    //var a =  context.dependOnInheritedWidgetOfExactType<m.Scaffold>();
    try{
    var a = m.Theme.of(context);
    var b = c.CupertinoTheme.of(context);
    var d = FluentTheme.of(context);
    
    } catch(e){
      print(e);
    }


    c.CupertinoContextMenu; 

    
    return Text("Not handled");
  }
}

class WOUEBase {
  static bool isFluent(BuildContext context) {
    if (FluentTheme.maybeOf(context) == null) {
      return false;
    }
    return true;
  }
   static bool isMaterial(BuildContext context) {
    
    
    // if (CupertinoTheme.has(context) == null) {
    //   return false;

    // }
    return true;
  }
}
