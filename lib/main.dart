import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theta_360_camera/view/image_button.dart';
import 'package:theta_360_camera/view/info_button.dart';
import 'package:theta_360_camera/view/state_button.dart';

import 'providers/camera_providers.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var responseWidget = ref.watch(responseProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            const Expanded(
                flex: 3,
                child: Row(
                  children: [InfoButton(), StateButton(), ImageButton()],
                )),
            Expanded(
                flex: 2, child: SingleChildScrollView(child: responseWidget)),
          ],
        ),
      ),
    );
  }
}

// final responseProvider = StateProvider<String>((ref) => 'response');