// ignore: avoid_classes_with_only_static_members
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phone007/screens/home.dart';
import 'package:phone007/screens/missions/introduction.dart';

// ignore: avoid_classes_with_only_static_members
class RouterHelper {
  static GoRouter router = GoRouter(
    errorBuilder: (_, __) => const Material(
      child: Center(child: CircularProgressIndicator()),
    ),
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (
          BuildContext context,
          GoRouterState state,
        ) =>
            Home(),
        routes: <GoRoute>[
          GoRoute(
            path: 'mission-intro/:missionId',
            builder: (_, GoRouterState state) {
              final int missionId =
                  int.parse(state.pathParameters['missionId']!);
              return Introduction(missionId: missionId);
            },
          ),
        ],
      ),
    ],
  );
}
