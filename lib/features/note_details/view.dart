import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/core/dimensions/dimensions.dart';
import 'package:note_app/widgets/app_loading_indicator.dart';

import '../../core/route_utils/route_utils.dart';
import '../../widgets/app_app_bar.dart';
import '../../widgets/app_icon_button.dart';
import '../../widgets/app_text.dart';
import '../home/cubit.dart';
import '../note_editor/view.dart';
import 'cubit.dart';

class NoteDetailsView extends StatelessWidget {
  const NoteDetailsView({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteDetailsCubit(id: id)..getNoteDetails(),
      child: BlocBuilder<NoteDetailsCubit, NoteDetailsStates>(
        builder: (context, state) {
          final cubit = BlocProvider.of<NoteDetailsCubit>(context);
          return Scaffold(
            appBar: AppAppBar(
              actions: [
                if (state is NoteDetailsInit)
                AppIconButton(
                  icon: FontAwesomeIcons.penToSquare,
                  onTap: () async {
                    RouteUtils.push(
                      BlocProvider.value(
                        value: BlocProvider.of<HomeCubit>(context),
                        child: NoteEditorView(
                          note: cubit.note,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(width: 16),
              ],
              enableBackButton: true,
            ),
            body: Builder(
              builder: (context) {
                if (state is NoteDetailsLoading) {
                  return AppLoadingIndicator();
                }
                final note = cubit.note!;
                return ListView(
                  padding: EdgeInsets.all(16),
                  children: [
                    AppText(
                      title: note.title,
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 16.height),
                    AppText(
                      title: note.subtitle,
                      fontSize: 24,
                    ),
                  ],
                );
              }
            ),
          );
        },
      ),
    );
  }
}
