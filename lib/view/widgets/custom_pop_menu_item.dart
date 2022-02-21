import 'package:flutter/material.dart';

class CustomPopMenuItem<T> extends PopupMenuItem<T> {
  final Widget child;
  final Function onPressed;

  CustomPopMenuItem({required this.child, required this.onPressed})
      : super(child: child);

  @override
  PopupMenuItemState<T, PopupMenuItem<T>> createState() {
    return CustomPopMenuItemState();
  }
}

class CustomPopMenuItemState<T, PopMenuItem>
    extends PopupMenuItemState<T, CustomPopMenuItem<T>> {
  @override
  void handleTap() {
    widget.onPressed();
  }
}
