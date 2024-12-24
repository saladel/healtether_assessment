import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/user_provider.dart';

Widget buildSearchBar() {
  return Consumer<UserProvider>(
    builder: (context, provider, child) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          onChanged: provider.searchUsers,
          textAlign: TextAlign.start,
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(
            hintText: 'Find a user',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Colors.teal,
              ),
            ),
          ),
        ),
      );
    },
  );
}