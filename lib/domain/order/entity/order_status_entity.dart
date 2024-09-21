class OrderStatusEntity {
  final String? title;
  final bool? done;
  final String? createdAt;

  OrderStatusEntity({
    required this.title,
    required this.done,
    required this.createdAt,
  });
}

final List<OrderStatusEntity> orderStatusList = [
  OrderStatusEntity(
    title: 'Order Placed',
    createdAt: '2024-01-01',
    done: true,
  ),
  OrderStatusEntity(
    title: 'Order Confirmed',
    createdAt: '2024-01-01',
    done: true,
  ),
  OrderStatusEntity(
    title: 'Shipped',
    createdAt: '2024-01-01',
    done: true,
  ),
  OrderStatusEntity(
    title: 'Delivered',
    createdAt: '2024-01-01',
    done: false,
  ),
];
