class MutualFund {
  String _name, _cost;
  MutualFund({name, cost}) {
    this._name = name;
    this._cost = cost;
  }

  String getName() {
    return _name;
  }

  String getCost() {
    return _cost;
  }
}
