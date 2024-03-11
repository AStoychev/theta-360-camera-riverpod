import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/camera_providers.dart';

class ImageButton extends ConsumerWidget {
  const ImageButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
        onPressed: () async {
          try {
            await dotenv.load();
            String apiUrl = dotenv.env['IMAGE']!;
            ref.read(responseProvider.notifier).state = Image.network(apiUrl);
          } catch (error) {
            print('ERROR: $error');
          }
        },
        child: const Text('image'));
  }
}
