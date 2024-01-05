
// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_18/models/data_keys.dart';
import 'package:flutter_application_18/providers/all_providers.dart';
import 'package:flutter_application_18/services/api_services.dart';
import 'package:flutter_application_18/ui_helpers/ui_color_helper.dart';
import 'package:flutter_application_18/ui_helpers/ui_title_helper.dart';
import 'package:flutter_application_18/widgets/picker_item_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataPickerWidget extends ConsumerWidget {
  DataPickerWidget({
    super.key,
  });

  int from=0;
  int to=0;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 45,
          child: CupertinoButton( 
            color: UiColorHelper.resultBg,
            onPressed: () {
              ref.read(requestCountProvider.notifier).state++;
              
            }, 
          child:Text(UiTitleHelper.buttonTitle) ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.3,
          child: Row(
            children: [
              ItemPickerWidget(
                selectionOverlay: const CupertinoPickerDefaultSelectionOverlay(
                  capEndEdge: false,
                  capStartEdge: true,
                ),
                onSelectedItemChanged: (value) {
                  ApiServices.from=Coins.values[value].name;
                },
                children: Coins.values.map((e) => Text(e.name)).toList(),
              ),
              ItemPickerWidget(
                selectionOverlay: const CupertinoPickerDefaultSelectionOverlay(
                    capEndEdge: true, capStartEdge: false),
                onSelectedItemChanged: (value) { 
                  ApiServices.to=Currency.values[value].name;
                },
                children: Currency.values.map((e) => Text(e.name)).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
