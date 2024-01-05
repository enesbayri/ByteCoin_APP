import 'package:flutter/material.dart';
import 'package:flutter_application_18/ui_helpers/ui_textstyle_helper.dart';
import 'package:flutter_application_18/ui_helpers/ui_title_helper.dart';
import 'package:flutter_application_18/widgets/result_widget.dart';

class TopWidgets extends StatelessWidget {
  const TopWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height*0.08,
      left: (MediaQuery.of(context).size.width-(MediaQuery.of(context).size.width * 0.76))/2,
      child: Column(
        children: [
          Text(
            UiTitleHelper.mainTitle,
            style: UiTextStyleHelper.mainTitleTextStyle,
          ),
          const SizedBox(height: 10,),
          const ResultWidget(),
        ],
      ),
    );
  }
}
