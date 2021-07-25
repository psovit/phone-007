import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_setup/models/exports.dart';
import 'package:flutter_redux_setup/redux/app_state.dart';
import 'package:flutter_redux_setup/utils/app_colors.dart';
import 'package:flutter_redux_setup/widgets/notes_detail.dart';
import 'package:redux/redux.dart';

class NotesList extends StatelessWidget {
  const NotesList({required this.missionId});
  final int missionId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notes',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: StoreConnector<AppState, NotesView?>(
        converter: (Store<AppState> store) {
          return store.state.notesState.getNotesForMission(missionId);
        },
        builder: (_, NotesView? notesView) {
          if (notesView == null) {
            return const Center(child: CircularProgressIndicator());
          }
          if (notesView.notes.isEmpty) {
            return const Center(
              child: Text(
                'No notes here.',
                style: TextStyle(fontSize: 22),
              ),
            );
          }
          return Container(
            padding: const EdgeInsets.all(12.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 1.9,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: notesView.notes.length,
              itemBuilder: (BuildContext ctx, int index) {
                final NoteItemView noteItemView = notesView.notes[index];
                final Widget imageChild = Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                    color: AppColors.gray16,
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        noteItemView.title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        noteItemView.body,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push<dynamic>(
                      MaterialPageRoute<dynamic>(
                        builder: (BuildContext context) => NotesDetail(
                          noteItemView,
                        ),
                      ),
                    );
                  },
                  child: imageChild,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
