
import 'package:flutter/material.dart';
import 'package:flutter_application_18/providers/all_providers.dart';
import 'package:flutter_application_18/services/api_services.dart';
import 'package:flutter_application_18/ui_helpers/ui_color_helper.dart';
import 'package:flutter_application_18/ui_helpers/ui_textstyle_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResultWidget extends ConsumerWidget {
  const ResultWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    var coin=ref.watch(futureCoinProvider);
    return Container(
      width: MediaQuery.of(context).size.width * 0.76,
      decoration: BoxDecoration(
          color: UiColorHelper.resultBg,
          borderRadius: BorderRadius.circular(36)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(radius: 30,backgroundColor: Theme.of(context).scaffoldBackgroundColor, foregroundImage: AssetImage("assets/icons/${ApiServices.from}.png"),),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: coin.when(data: (data) => Text(
                data.toString(),
                style: UiTextStyleHelper.resultTextStyle,
              ) , error:(error, stackTrace)   {
                debugPrint(stackTrace.toString());
                return Center(
                child: Text(
                  "ByteCoin",
                  style: UiTextStyleHelper.resultTextStyle,
                ));}, loading:() => const Center(child:CircularProgressIndicator()), )
              )
            ),
          
        ],
      ),
    );
  }
}
