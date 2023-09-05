import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/core/app_colors/app_colors.dart';
import 'package:note_app/core/caching_utils/caching_utils.dart';
import 'package:note_app/core/dimensions/dimensions.dart';
import 'package:note_app/features/home/cubit.dart';
import 'package:note_app/features/home/states.dart';
import 'package:note_app/features/login/view.dart';
import 'package:note_app/widgets/app_loading_indicator.dart';

import '../../core/route_utils/route_utils.dart';
import '../../widgets/app/create_your_first_note_vector.dart';
import '../../widgets/app/note_card.dart';
import '../../widgets/app_app_bar.dart';
import '../../widgets/app_icon_button.dart';
import '../note_editor/view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getNotes(),
      child: Scaffold(
        appBar: AppAppBar(
          title: "Notes",
          actions: [
            AppIconButton(
              icon: FontAwesomeIcons.magnifyingGlass,
              onTap: () {},
              // onTap: () => RouteUtils.push(
              //   SearchView(notes: controller.notes),
              // ),
            ),
            SizedBox(width: 12.width),
            AppIconButton(
              icon: FontAwesomeIcons.arrowRightFromBracket,
              onTap: () async {
                await CachingUtils.deleteUser();
                RouteUtils.pushAndPopAll(LoginView());
              },
            ),
            SizedBox(width: 16.width),
          ],
        ),
        body: BlocBuilder<HomeCubit, HomeStates>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return AppLoadingIndicator();
            }
            final cubit = BlocProvider.of<HomeCubit>(context);
            if (cubit.notes.isEmpty) {
              return CreateYourFirstNoteVector();
            }
            final notes = cubit.notes;
            return RefreshIndicator(
              onRefresh: cubit.getNotes,
              color: AppColors.white,
              child: ListView.builder(
                padding: EdgeInsets.all(16),
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return NoteCard(
                    note: notes[index],
                    onDismiss: () => cubit.deleteNote(notes[index]),
                  );
                },
              ),
            );
          },
        ),
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              child: Icon(
                FontAwesomeIcons.plus,
                size: 24.height,
              ),
              onPressed: () async {
                await RouteUtils.push(
                  BlocProvider.value(
                    value: BlocProvider.of<HomeCubit>(context),
                    child: NoteEditorView(),
                  ),
                );
              },
            );
          }
        ),
      ),
    );
  }
}
