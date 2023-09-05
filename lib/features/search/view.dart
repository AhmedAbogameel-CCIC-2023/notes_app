import 'package:flutter/material.dart' hide SearchController;
import 'package:note_app/core/dimensions/dimensions.dart';
import 'package:note_app/widgets/app_app_bar.dart';

import '../../core/models/note.dart';
import '../../widgets/app/no_search_result.dart';
import '../../widgets/app/note_card.dart';
import '../../widgets/app/search_text_field.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SearchTextField(
              onChanged: (v) {},
            ),
            SizedBox(height: 32.height),
            Expanded(
              child: Builder(
                builder: (context) {
                  // if (controller.filteredNotes.isEmpty) {
                  //   return NoSearchResultVector();
                  // }
                  // return ListView.builder(
                  //   itemCount: controller.filteredNotes.length,
                  //   itemBuilder: (context, index) {
                  //     return NoteCard(
                  //       note: controller.filteredNotes[index],
                  //       onTap: () {},
                  //     );
                  //   },
                  // );
                  return SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
