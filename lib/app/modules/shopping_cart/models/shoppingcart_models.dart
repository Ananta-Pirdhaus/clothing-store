class ShoppingCartModels {
  String title;
  String price;
  bool isCheckOut;
  String id;
  String userId;
  ShoppingCartModels({
    required this.title,
    required this.price,
    required this.isCheckOut,
    required this.id,
    required this.userId,
  });
  ShoppingCartModels.fromJson(Map<String, dynamic> json, String tempId)
      : title = json['title'],
        price = json['price'],
        isCheckOut = json['isCheckOut'],
        userId = json['userId'],
        id = tempId;

  Map<String, dynamic> toJson() => {
        'title': title,
        'price': price,
        'isCheckOut': isCheckOut,
        'userId': userId,
      };
}
