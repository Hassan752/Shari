// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  const Category({
    required this.name,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [
        name,
        imageUrl,
      ];

  static Category fromSnapshot(DocumentSnapshot snap) {
    Category category = Category(
      name: snap['name'],
      imageUrl: snap['imageUrl'],
    );
    return category;
  }

  static List<Category> category = [
    Category(
        name: 'Clothes',
        imageUrl:
            'https://images.pexels.com/photos/5242824/pexels-photo-5242824.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
    Category(
        name: 'Devices',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSqvIx4t-5jb5nskYf3Jhl-aZcEkoiGl964g&usqp=CAU'),
    Category(
        name: 'Accessories',
        imageUrl:
            'https://images.pexels.com/photos/1460838/pexels-photo-1460838.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
  ];
}
