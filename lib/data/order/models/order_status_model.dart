
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/order/entity/order_status_entity.dart';

class OrderStatusModel {
  final String? title;
  final bool? done;
  final Timestamp? createdAt;

  OrderStatusModel({
    required this.title,
    required this.done,
    required this.createdAt,
  });

  factory OrderStatusModel.fromMap(Map<String, dynamic> map) {
    return OrderStatusModel(
      title: map['title'] != null ? map['title'] as String : 'delivered',
      done: map['done'] != null ? map['done'] as bool : true,
      createdAt: map['createdAt'] != null
          ? map['createdAt'] as Timestamp
          : Timestamp.now(),
    );
  }
}

extension OrderStatusXModel on OrderStatusModel {
  OrderStatusEntity toEntity() {
    return OrderStatusEntity(
      title: title,
      done: done,
      createdAt: createdAt,
    );
  }
}
