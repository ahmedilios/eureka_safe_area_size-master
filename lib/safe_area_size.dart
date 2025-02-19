import 'package:flutter/material.dart';

class SafeAreaSizeInheritor extends InheritedWidget {
  final BoxConstraints constraints;

  const SafeAreaSizeInheritor({
    this.constraints,
    Widget child,
  }) : super(child: child);

  static SafeAreaSizeInheritor of(BuildContext context) {
    final SafeAreaSizeInheritor provider =
        context.inheritFromWidgetOfExactType(SafeAreaSizeInheritor)
            as SafeAreaSizeInheritor;

    if (provider == null) {
      throw FlutterError(
        """
        SafeAreaSizeInheritor.of() called with a context that does not contain a SafeAreaSizeInheritor instance.
        No ancestor could be found starting from the context that was passed to SafeAreaSizeInheritor.of().
        This can happen if the context you use comes from a widget above the SafeAreaSizeInheritor.
        The context used was: $context
        """,
      );
    }
    return provider;
  }

  @override
  bool updateShouldNotify(SafeAreaSizeInheritor old) =>
      this.constraints != old.constraints;
}
