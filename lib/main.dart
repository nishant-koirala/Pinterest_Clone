import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:test/features/auth/counter/counter_screen.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://ganelpsmijmclwxyaqye.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdhbmVscHNtaWptY2x3eHlhcXllIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzg0NjAxNTAsImV4cCI6MjA1NDAzNjE1MH0.N1-Er14lGIENDs-ORnGW_x9DeFPyxxyix0FZWbj7jec',
  );

  runApp(ProviderScope(child: Myapp()));
}

// Get a reference your Supabase client
final supabase = Supabase.instance.client;

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterScreen(),
    );
  }
}
