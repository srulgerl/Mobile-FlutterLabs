class IBottle {
  void open() {}
  factory IBottle() {
    return CokeBottle();
  }
}

class CokeBottle implements IBottle {
  @override
  void open() {
    print("Coke bottle is opened");
  }
}

void main() {
  IBottle bottle = IBottle();
  bottle.open();
}
