import 'package:saint_roche_atomic_design/hamburger/model/ham_model.dart';
import 'package:saint_roche_atomic_design/hamburger/model/ham_type.dart';

const double RECARGO = 0.05;

class HamburgerController {
  final List<HamburgerModel> hamburgers = [
    for(var ham in HamType.values)
      HamburgerModel(hamburger: ham)
  ];

  void increaseQty(HamburgerModel ham) {
    ham.quantity++;
  }

  void decreaseQty(HamburgerModel ham) {
    if (ham.quantity > 0) {
      ham.quantity--;
    }
  }

  double get total {
    double hamTotal = 0;
    for(int i=0; i<hamburgers.length; i++) {
      hamTotal += hamburgers[i].total;
    }
    return hamTotal;
  }

  double get charge {
    return total * RECARGO;
  }

  String allHamburgersZero() {
    for(int i=0; i<hamburgers.length; i++){
      if(hamburgers[i].quantity != 0) {
        return "";
      }
    }

    return "Agregue por lo menos una hamburguesa";
  }
}