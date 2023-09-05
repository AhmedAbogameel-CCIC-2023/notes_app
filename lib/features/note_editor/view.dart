import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/core/dimensions/dimensions.dart';
import 'package:note_app/features/home/cubit.dart';
import 'package:note_app/features/note_editor/cubit.dart';
import 'package:note_app/widgets/app_icon_button.dart';
import 'package:note_app/widgets/app_loading_indicator.dart';

import '../../core/models/note.dart';
import '../../widgets/app_app_bar.dart';
import '../../widgets/app_dialog.dart';
import '../../widgets/app_text_field.dart';
import 'controller.dart';

class NoteEditorView extends StatelessWidget {
  const NoteEditorView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteEditorCubit(),
      child: Builder(builder: (context) {
        final cubit = BlocProvider.of<NoteEditorCubit>(context);
        return Scaffold(
          appBar: AppAppBar(
            enableBackButton: true,
            actions: [
              // AppIconButton(
              //   icon: FontAwesomeIcons.eye,
              //   onTap: () {},
              //   padding: EdgeInsets.only(right: 16.width),
              // ),
              BlocBuilder<NoteEditorCubit, NoteEditorStates>(
                builder: (context, state) {
                  if (state is NoteEditorLoading) {
                    return AppLoadingIndicator();
                  }
                  return AppIconButton(
                    icon: FontAwesomeIcons.floppyDisk,
                    onTap: () {
                      if (!cubit.validateInputs()) {
                        return;
                      }
                      AppDialog.show(
                        context,
                        message: "Save changes ?",
                        confirmTitle: "Save",
                        onConfirm: () async {
                          Navigator.pop(context);
                          final note = await cubit.addNote();
                          if (note != null) {
                            BlocProvider.of<HomeCubit>(context).insertNote(note);
                            Navigator.pop(context);
                          }
                        },
                        onCancel: () => Navigator.pop(context),
                      );
                    },
                  );
                },
              ),
              SizedBox(width: 16),
            ],
          ),
          body: Form(
            key: cubit.formKey,
            child: ListView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: EdgeInsets.all(16),
              children: [
                AppTextField(
                  hint: 'Title',
                  cursorHeight: 52,
                  hintFontSize: 48,
                  maxLength: 50,
                  controller: cubit.titleTXController,
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) {
                      return 'Empty field!';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.height),
                AppTextField(
                  hint: "Type Something...",
                  controller: cubit.subtitleTXController,
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) {
                      return 'Empty field!';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
