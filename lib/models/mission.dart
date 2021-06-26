import 'package:flutter_redux_setup/models/enums.dart';

class Mission {
  Mission(this.id, this.title, this.image, this.status);
  final int id;
  final String title;
  final String image;
  final MissionStatus status;
}
