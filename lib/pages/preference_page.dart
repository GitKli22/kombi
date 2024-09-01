// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../components/my_app_bar.dart';
import '../components/preference_button.dart';
import '../components/my_cart_button.dart';

class PreferencePage extends StatelessWidget {
  const PreferencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const MyAppBar(
        title: 'Preference',
        actions: [
          MyCartButton(),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(25.0),
        children: [
          // Title
          Text(
            "Mes préferences",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 32,
            ),
          ),
          SizedBox(height: 10),
          // Preference buttons
          buildPreferenceSection(
            context,
            preferences: [
              'Restauration',
              'Shopping',
              'Grillade',
              'Cinéma',
              'Sport',
              'Musique',
              'Voyage',
              'Lecture',
              'Art',
            ],
          ),
        ],
      ),
    );
  }

  Widget buildPreferenceSection(BuildContext context, {required List<String> preferences}) {
    return Row(
      children: preferences.map((preference) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 4.0), // Vertical margin for spacing between buttons
              child: PreferenceButton(
                onTap: () {
                  // Navigate to a different screen
                  Navigator.pushNamed(context, '/your_next_screen');
                },
                widget: Center(
                  child: Text(
                    preference,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
    );
  }
}
