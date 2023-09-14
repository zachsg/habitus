import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'helpers/providers.dart';
import 'services/database.dart';
import 'habitus_app.dart';
import 'services/local_notification_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalNotificationService().setup();

  final SharedPreferences preferences = await SharedPreferences.getInstance();

  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabasePublicKey,
  );

  runApp(
    ProviderScope(
      overrides: [
        prefsProvider.overrideWithValue(preferences),
      ],
      child: const HabitusApp(),
    ),
  );
}
