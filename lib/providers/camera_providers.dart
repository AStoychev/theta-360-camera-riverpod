import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final responseProvider = StateProvider<Widget>((ref) => const Text('response'));
