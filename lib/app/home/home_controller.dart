class BlocHome {
  static const percents = [10, 20, 30, 40];

  String _bill = '0';
  int friends = 2;
  int currectPercent = percents[0];

  String get getBill => (double.tryParse(_bill) / 100).toStringAsFixed(2);

  set setBill(value) {
    if (_bill.length < 6) _bill = _bill + value;
  }

  get tips {
    return ((double.tryParse(_bill) / 100) * (currectPercent / 100))
        .toStringAsFixed(2);
  }

  resetBill() {
    _bill = '0';
  }

  backBill() {
    if (_bill.length > 1) _bill = _bill.substring(0, _bill.length - 1);
  }
}
