import 'package:test_project/features/bought_bid_items/presentation/models/item_enum.dart';

class BoughtBidItemsModel {
  final String title;
  final String image;
  final String? description;
  final double price;
  final ItemEnum status;
  final int quantity;

  BoughtBidItemsModel({
    required this.title,
    required this.image,
    this.description,
    required this.price,
    required this.status,
    required this.quantity,
  });
}
