
import 'package:contact_app_null_safety/data/models/contact_details.dart';

class Contact {
  final int? id;
  final ContactDetails? recipent;
  bool favourite;
  bool hide;
  final String? note;
  final String? createdAt;

  Contact({this.id, this.recipent,required this.favourite,required this.hide, this.note, this.createdAt});

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
        id: json['id'] as int,
        recipent: ContactDetails.fromJson(json['recipent']),
        favourite: json['favourite'] as bool,
        hide: json['hide'] as bool,
        createdAt: json['createdAt'] as String
    );
  }


}
