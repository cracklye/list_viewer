import 'package:flutter/widgets.dart';
import 'package:list_viewer_test/widgets/woue_base.dart';
import 'package:list_viewer_test/widgets/woue_button.dart';


class WOUEDebug extends StatelessWidget {
  const WOUEDebug({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        ' isFluent ${WOUEBase.isFluent(context)}\n isMaterial ${WOUEBase.isMaterial(context)}\n' +
            ' isMacos ${WOUEBase.isMacos(context)} \n isCupertino ${WOUEBase.isCupertino(context)}');
  }
}
