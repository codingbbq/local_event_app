import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Category {
  final int categoryId;
  final String name;
  final IconData icon;

  Category({
    this.categoryId,
    this.name,
    this.icon
  });
}

final allCategory = Category(
  categoryId: 0,
  name: 'All',
  icon: Icons.search
);

final musicCategory = Category(
  categoryId: 1,
  name: 'Music',
  icon: Icons.music_note
);

final meetUpCategory = Category(
  categoryId: 2,
  name: 'Meetup',
  icon: Icons.location_on
);

final golfCategory = Category(
  categoryId: 3,
  name: 'Golf',
  icon: Icons.golf_course
);

final birthDayCategory = Category(
  categoryId: 4,
  name: 'Birthday',
  icon: Icons.cake
);

final List<Category> categories = [
  allCategory,
  musicCategory,
  meetUpCategory,
  golfCategory,
  birthDayCategory
];