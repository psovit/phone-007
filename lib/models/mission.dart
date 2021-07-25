import 'package:flutter_redux_setup/models/enums.dart';

class Mission {
  Mission(
    this.id,
    this.title,
    this.image,
    this.backgroundImage,
    this.status,
    this.description,
    this.questionText,
    this.answer, {
    this.hasChatMessages = true,
    this.hasGallery = true,
    this.hasInternetBrowser = false,
    this.hasNotes = false,
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
  final String questionText;
  final String answer;
  final bool hasNotes;
}
