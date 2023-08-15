import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/core/dimensions/dimensions.dart';
import 'package:note_app/widgets/app_icon_button.dart';

import '../../widgets/app_app_bar.dart';
import '../../widgets/app_dialog.dart';
import '../../widgets/app_text_field.dart';

class NoteEditorView extends StatelessWidget {
  const NoteEditorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        enableBackButton: true,
        actions: [
          AppIconButton(
            icon: FontAwesomeIcons.eye,
            onTap: () {},
            padding: EdgeInsets.only(right: 16.width),
          ),
          AppIconButton(
            icon: FontAwesomeIcons.floppyDisk,
            onTap: () => AppDialog.show(
              context,
              message: "Save changes ?",
              confirmTitle: "Save",
              onConfirm: () {},
              onCancel: () {
                AppDialog.show(
                  context,
                  message: "Are your sure you want discard your changes ?",
                  confirmTitle: "Keep",
                  onConfirm: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  onCancel: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }
                );
              },
            ),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: EdgeInsets.all(16),
        children: [
          AppTextField(
            hint: "Title",
            cursorHeight: 52,
            hintFontSize: 48,
          ),
          SizedBox(height: 16.height),
          AppTextField(
            hint: "Type Something...",
          ),
        ],
      ),
    );
  }
}
