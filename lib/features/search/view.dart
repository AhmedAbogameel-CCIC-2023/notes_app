import 'package:flutter/material.dart';
import 'package:note_app/core/dimensions/dimensions.dart';
import 'package:note_app/widgets/app_app_bar.dart';

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
            SearchTextField(),
            SizedBox(height: 32.height),
            Expanded(
              child: NoSearchResultVector(),
            ),
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: 20,
            //     itemBuilder: (context, index) {
            //       return NoteCard();
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
