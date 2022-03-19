import 'package:flutter/material.dart';

class MaterialPageRouter extends PageRoute with MaterialRouteTransitionMixin {
  MaterialPageRouter({
    required this.builder,
  });

  final WidgetBuilder builder;

  @override
  Widget buildContent(BuildContext context) => builder(context);

  @override
  bool get maintainState => false;
}
