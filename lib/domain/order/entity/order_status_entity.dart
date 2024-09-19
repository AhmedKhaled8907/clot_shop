import 'package:cloud_firestore/cloud_firestore.dart';

class OrderStatusEntity {
  final String? code;
  final bool? done;
  final Timestamp? createdAt;

  OrderStatusEntity({
    required this.code,
    required this.done,
    required this.createdAt,
  });
}
