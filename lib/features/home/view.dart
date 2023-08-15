import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/core/dimensions/dimensions.dart';

import '../../core/route_utils/route_utils.dart';
import '../../widgets/app/create_your_first_note_vector.dart';
import '../../widgets/app/note_card.dart';
import '../../widgets/app_app_bar.dart';
import '../../widgets/app_icon_button.dart';
import '../note_editor/view.dart';
import '../search/view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: "Notes",
        actions: [
          AppIconButton(
            icon: FontAwesomeIcons.magnifyingGlass,
            onTap: () => RouteUtils.push(
              context: context,
              view: SearchView(),
            ),
          ),
          SizedBox(width: 12.width),
          AppIconButton(
            icon: FontAwesomeIcons.circleInfo,
            onTap: () {},
          ),
          SizedBox(width: 16.width),
        ],
      ),
      body: CreateYourFirstNoteVector(),
      // body: ListView.builder(
      //   padding: EdgeInsets.all(16),
      //   itemCount: 10,
      //   itemBuilder: (context, index) {
      //     return NoteCard();
      //   },
      // ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          FontAwesomeIcons.plus,
          size: 24.height,
        ),
        onPressed: () => RouteUtils.push(
          context: context,
          view: NoteEditorView(),
        ),
      ),
    );
  }
}
