import 'package:flutter/material.dart';

import '../data/note_model.dart';
import '../di/service_locator.dart';
import '../repository/note_repository.dart';

// acts as the ViewModel, holds the UI state and the methods that change it
class NoteProvider extends ChangeNotifier {
  final NoteRepository _repository = getIt<NoteRepository>();
  List<Note> _notes = [];
  bool _isLoading = false;

  List<Note> get notes => _notes;
  bool get isLoading => _isLoading;

  Future<void> fetchNotes() async {
    _isLoading = true;
    notifyListeners(); // notify the UI to show a loading indicator
    _notes = await _repository.getNotes();
    _isLoading = false;
    notifyListeners(); // notify the UI with the new data
  }

  Future<void> addNote(Note note) async {
    await _repository.insertNote(note);
    await fetchNotes(); // refresh the list
  }

  Future<void> updateNote(Note note) async {
    await _repository.updateNote(note);
    await fetchNotes(); // refresh the list
  }

  Future<void> deleteNote(int id) async {
    await _repository.deleteNote(id);
    await fetchNotes(); // refresh the list
  }
}