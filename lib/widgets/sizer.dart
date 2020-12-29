import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

typedef void OnWidgetSizeChange(Size size);
typedef void OnWidgetPositionChange(Offset size);

class MeasureSize extends StatefulWidget {
  final Widget child;
  final OnWidgetSizeChange onChange;
  final OnWidgetPositionChange onWidgetPositionChange;

  const MeasureSize({
    Key key,
    @required this.onChange,
    @required this.child,
    this.onWidgetPositionChange,
  }) : super(key: key);

  @override
  _MeasureSizeState createState() => _MeasureSizeState();
}

class _MeasureSizeState extends State<MeasureSize> {
  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback(postFrameCallback);
    return Container(
      key: widgetKey,
      child: widget.child,
    );
  }

  var widgetKey = GlobalKey();
  var oldSize;
  void postFrameCallback(_) {
    var context = widgetKey.currentContext;
    if (context == null) return;
    final RenderBox render = context.findRenderObject();
    var newSize = context.size;
    var newPos = render.localToGlobal(Offset.zero);
    if (oldSize == newSize) return;

    oldSize = newSize;
    widget.onChange(newSize);
    if (widget.onWidgetPositionChange != null)
      widget.onWidgetPositionChange(newPos);
  }
}
