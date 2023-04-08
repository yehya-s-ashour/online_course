import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/notificationsScreenAppBar.dart';
import 'components/notificationsSearchListView.dart';

class notificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
          children: [
            notificationsScreenAppBar(),
            notificationsSearchListView()
          ],
        ),
      ),
    );
  }
}
