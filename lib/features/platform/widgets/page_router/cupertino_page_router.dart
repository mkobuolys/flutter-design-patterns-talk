import 'package:flutter/cupertino.dart';

class CupertinoPageRouter extends PageRoute with CupertinoRouteTransitionMixin {
  CupertinoPageRouter({
    required this.builder,
  });

  final WidgetBuilder builder;

  @override
  Widget buildContent(BuildContext context) => builder(context);

  @override
  bool get maintainState => false;

  @override
  String get title => '';
}
