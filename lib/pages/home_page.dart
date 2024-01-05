

import 'package:flutter/material.dart';
import 'package:flutter_application_18/widgets/data_picker_widget.dart';
import 'package:flutter_application_18/widgets/top_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ByteCoin extends ConsumerWidget {
  const ByteCoin({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return  Scaffold(
      body: Stack(
        children: [
          const TopWidgets(),
          Align(
            alignment: Alignment.bottomCenter,
            child: DataPickerWidget())
        ],
      ),
    );
  }
}