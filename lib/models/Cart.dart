import 'package:ecommerce/models/catalog.dart';

class CartModel {
  static final cartModel = CartModel._internal();

  CartModel._internal();
  factory CartModel() => cartModel;

  late CatalogModel _catalog;
  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  // Get Item in the Cart
  List<Item> get items => _itemIds.map((e) => _catalog.getById(e)).toList();

  // Get Total Price

  num get totalPrice =>
      items.fold(0, (totalValue, current) => totalValue + current.price);

//Add Item
  void add(Item item) {
    print(catalog);
    _itemIds.add(item.id);
  }

  // Remove Item

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
