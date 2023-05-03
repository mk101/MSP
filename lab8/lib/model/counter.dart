
class Counter {
  int _value = 0;

  Counter([this._value = 0]);

  int get value => _value;

  void increment() {
    _value += 1;
  }

  void reset() {
    _value = 0;
  }
}