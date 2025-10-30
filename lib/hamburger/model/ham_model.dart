import 'package:saint_roche_atomic_design/hamburger/model/ham_type.dart';

class HamburgerModel {
  final HamType hamburger;
  int quantity;

  HamburgerModel({required this.hamburger, this.quantity = 0});

  double get total => hamburger.price * quantity;
}