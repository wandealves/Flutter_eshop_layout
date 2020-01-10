import 'package:eshop/ui/widgets/shared/progress-indicator.widget.dart';
import 'package:flutter/widgets.dart';

class Loader extends StatelessWidget {
  final object;
  final Function callback;

  const Loader({Key key, this.object, this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (object == null) {
      return Center(
        child: GenericProgressIndicator(),
      );
    }

    if (object.length == 0) {
      return Center(
        child: Text("Nenhum item encontrado"),
      );
    }
    return callback();
  }
}
