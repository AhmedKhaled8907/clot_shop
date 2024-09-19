
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/order/entity/order_status_entity.dart';

class OrderStatusModel {
  final String? code;
  final bool? done;
  final Timestamp? createdAt;

  OrderStatusModel({
    required this.code,
    required this.done,
    required this.createdAt,
  });

  factory OrderStatusModel.fromMap(Map<String, dynamic> map) {
    return OrderStatusModel(
      code: map['code'] != null ? map['code'] as String : '84584',
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
      code: code,
      done: done,
      createdAt: createdAt,
    );
  }
}
