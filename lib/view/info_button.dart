import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../providers/camera_providers.dart';

class InfoButton extends ConsumerWidget {
  const InfoButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
        onPressed: () async {
          try {
            await dotenv.load();
            String apiUrl = dotenv.env['API_URL_ONE']!;
            var response = await http.get(Uri.parse(apiUrl));
            final responceMap = jsonDecode(response.body);
            const encoder = JsonEncoder.withIndent('  ');
            final formattedResponse = encoder.convert(responceMap);
            ref.read(responseProvider.notifier).state = Text(formattedResponse);
            // ref.read(responseProvider.notifier).state =
            //     response.body.toString();
          } catch (error) {
            print('ERROR: $error');
          }
        },
        child: const Text('info'));
  }
}
