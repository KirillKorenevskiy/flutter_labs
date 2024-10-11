import 'entity.dart';

class OfficeWorker implements Iterable<Employee> {
  List<Employee> _employees = [];

  OfficeWorker(List<Employee> employees) {
    _employees = employees;
  }

  @override
  Iterator<Employee> get iterator {
    return _employees.iterator;
  }

  @override
  Iterable<Employee> take(int count) {
    var taken = 0;
    var takenEmployees = <Employee>[];
    for (var employee in _employees) {
      if (taken == count) {
        break;
      }
      takenEmployees.add(employee);
      taken++;
    }
    return takenEmployees;
  }

  @override
  bool any(bool Function(Employee element) test) {
    throw UnimplementedError();
  }

  @override
  Iterable<R> cast<R>() {
    throw UnimplementedError();
  }

  @override
  bool contains(Object? element) {
    throw UnimplementedError();
  }

  @override
  Employee elementAt(int index) {
    throw UnimplementedError();
  }

  @override
  bool every(bool Function(Employee element) test) {
    throw UnimplementedError();
  }

  @override
  Iterable<T> expand<T>(Iterable<T> Function(Employee element) toElements) {
    throw UnimplementedError();
  }

  @override
  Employee firstWhere(bool Function(Employee element) test,
      {Employee Function()? orElse}) {
    throw UnimplementedError();
  }

  @override
  T fold<T>(
      T initialValue, T Function(T previousValue, Employee element) combine) {
    throw UnimplementedError();
  }

  @override
  Iterable<Employee> followedBy(Iterable<Employee> other) {
    throw UnimplementedError();
  }

  @override
  void forEach(void Function(Employee element) action) {}

  @override
  bool get isEmpty => throw UnimplementedError();

  @override
  bool get isNotEmpty => throw UnimplementedError();

  @override
  String join([String separator = ""]) {
    throw UnimplementedError();
  }

  @override
  Employee get last => throw UnimplementedError();

  @override
  Employee lastWhere(bool Function(Employee element) test,
      {Employee Function()? orElse}) {
    throw UnimplementedError();
  }

  @override
  int get length => throw UnimplementedError();

  @override
  Iterable<T> map<T>(T Function(Employee e) toElement) {
    throw UnimplementedError();
  }

  @override
  Employee reduce(Employee Function(Employee value, Employee element) combine) {
    throw UnimplementedError();
  }

  @override
  Employee get single => throw UnimplementedError();

  @override
  Employee singleWhere(bool Function(Employee element) test,
      {Employee Function()? orElse}) {
    throw UnimplementedError();
  }

  @override
  Iterable<Employee> skip(int count) {
    throw UnimplementedError();
  }

  @override
  Iterable<Employee> skipWhile(bool Function(Employee value) test) {
    throw UnimplementedError();
  }

  @override
  Iterable<Employee> takeWhile(bool Function(Employee value) test) {
    throw UnimplementedError();
  }

  @override
  List<Employee> toList({bool growable = true}) {
    throw UnimplementedError();
  }

  @override
  Set<Employee> toSet() {
    throw UnimplementedError();
  }

  @override
  Iterable<Employee> where(bool Function(Employee element) test) {
    throw UnimplementedError();
  }

  @override
  Iterable<T> whereType<T>() {
    throw UnimplementedError();
  }

  @override
  Employee get first => throw UnimplementedError();
}
