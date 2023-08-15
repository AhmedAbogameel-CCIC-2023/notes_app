import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/core/dimensions/dimensions.dart';

import '../../core/route_utils/route_utils.dart';
import '../../widgets/app_app_bar.dart';
import '../../widgets/app_icon_button.dart';
import '../../widgets/app_text.dart';
import '../note_editor/view.dart';

class NoteDetailsView extends StatelessWidget {
  const NoteDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        actions: [
          AppIconButton(
            icon: FontAwesomeIcons.penToSquare,
            onTap: () => RouteUtils.push(
              context: context,
              view: NoteEditorView(),
            ),
          ),
          SizedBox(width: 16),
        ],
        enableBackButton: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          AppText(
            title: 'Title',
            fontSize: 36,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 16.height),
          AppText(
            title: 'Subtitle',
            fontSize: 24,
          ),
        ],
      ),
    );
  }
}
