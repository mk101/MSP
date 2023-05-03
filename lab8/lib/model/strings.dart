
class Strings {
  final _list = <String>[];

  String get strings => _list.join(', ');

  void add(String str) {
    _list.add(str.toLowerCase().trim());
  }

  void pop() {
    _list.removeLast();
  }
}