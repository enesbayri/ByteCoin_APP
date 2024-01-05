

import 'package:flutter/cupertino.dart';

class ItemPickerWidget extends StatelessWidget {
  final Widget? selectionOverlay;
  final Function onSelectedItemChanged;
  final List<Widget> children;
  const ItemPickerWidget({
    super.key,
    required this.selectionOverlay,
    required this.onSelectedItemChanged,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CupertinoPicker(
          itemExtent: 30,
          magnification: 1.2,
          squeeze: 1.3,
          selectionOverlay: selectionOverlay,
          onSelectedItemChanged: (value) {
            onSelectedItemChanged(value);
          },
          children: children),
    );
  }
}
