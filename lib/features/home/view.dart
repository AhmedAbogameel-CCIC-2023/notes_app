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
import 'home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = HomeController();

  @override
  void initState() {
    controller.getCachedNotes();
    super.initState();
  }

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
      body: Builder(
        builder: (context) {
          if (controller.notes.isEmpty) {
            return CreateYourFirstNoteVector();
          }
          return ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: controller.notes.length,
            itemBuilder: (context, index) {
              return NoteCard(
                note: controller.notes[index],
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          FontAwesomeIcons.plus,
          size: 24.height,
        ),
        onPressed: () async {
          final result = await RouteUtils.push(
            context: context,
            view: NoteEditorView(),
          );
          if (result != null) {
            controller.notes.insert(0, result);
            setState(() {});
          }
        },
      ),
    );
  }
}
