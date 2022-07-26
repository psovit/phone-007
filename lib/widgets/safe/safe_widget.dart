import 'package:flutter/material.dart';
import 'package:phone007/utils/app_colors.dart';

class SafeWidget extends StatelessWidget {
  const SafeWidget({Key? key, required this.missionId}) : super(key: key);
  final int missionId;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.file_download)),
              Tab(icon: Icon(Icons.ac_unit)),
            ],
          ),
          backgroundColor: AppColors.red,
          title: const Text('Vault'),
        ),
        body: const TabBarView(
          children: <Widget>[
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
          ],
        ),
      ),
    );
  }
}
