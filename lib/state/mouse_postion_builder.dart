import 'package:flutter/cupertino.dart';

typedef Build<X, Y> = Widget Function(BuildContext context, X x, Y y);

class MousePositionBuilder<X, Y> extends StatelessWidget {
  const MousePositionBuilder({
    super.key,
    required this.x,
    required this.y,
    required this.builder,
  });
  final ValueNotifier<X> x;
  final ValueNotifier<Y> y;
  final Build<X, Y> builder;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<X>(
      valueListenable: x,
      builder: (_, x, __) {
        return ValueListenableBuilder<Y>(
          valueListenable: y,
          builder: (context, y, __) {
            return builder(context, x, y);
          },
        );
      },
    );
  }
}
