import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/core/dimensions/dimensions.dart';
import 'package:note_app/core/route_utils/route_utils.dart';

import '../../core/app_colors/app_colors.dart';
import '../../features/note_details/view.dart';
import '../app_text.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key});

  EdgeInsets get _cardMargin => EdgeInsets.only(bottom: 24.height);

  BorderRadius get _radius => BorderRadius.circular(12);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {},
      background: Container(
        margin: _cardMargin,
        width: double.infinity,
        alignment: Alignment.center,
        child: Icon(FontAwesomeIcons.trash),
        decoration: BoxDecoration(
          color: AppColors.red,
          borderRadius: _radius,
        ),
      ),
      child: Padding(
        padding: _cardMargin,
        child: InkWell(
          borderRadius: _radius,
          onTap: () => RouteUtils.push(
            context: context,
            view: NoteDetailsView(),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.width,
              vertical: 16.height,
            ),
            width: double.infinity,
            alignment: Alignment.center,
            child: AppText(
              title:
                  "Book Review : The Design of Everyday Things by Don Norman",
              color: AppColors.black,
              fontSize: 24,
            ),
            decoration: BoxDecoration(
              borderRadius: _radius,
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}
