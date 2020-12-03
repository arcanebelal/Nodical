import 'package:flutter/material.dart';

/// This will become our User

class NodicalUser {
  final String uid;
  final String name;
  final String imageUrl;

  NodicalUser({
    this.uid,
    this.name,
    this.imageUrl,
  });

  String getUserId() {
    return uid;
  }
}
