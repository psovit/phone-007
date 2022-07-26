import 'package:phone007/models/enums.dart';

class Mission {
  Mission(
    this.id,
    this.title,
    this.image,
    this.backgroundImage,
    this.status,
    this.description,
    this.questionText,
    this.possibleAnswers, {
    this.hasChatMessages = true,
    this.hasGallery = true,
    this.hasInternetBrowser = false,
    this.hasNotes = false,
    this.screenLocked = false,
    this.lockScreenView,
    this.hasSafe = false,
  });
  final int id;
  final String title;
  final String image;
  final String backgroundImage;
  final String description;
  final MissionStatus status;
  final bool hasChatMessages;
  final bool hasGallery;
  final bool hasInternetBrowser;
  final bool hasSafe;
  final String questionText;
  final List<String> possibleAnswers;
  final bool hasNotes;
  bool screenLocked;
  final LockScreenView? lockScreenView;

  void unlockScreen() => screenLocked = false;
}

class LockScreenView {
  LockScreenView(this.hintText, this.validCode);
  final String hintText;
  final String validCode;
}
