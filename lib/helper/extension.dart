extension ListUtils<T> on List<T> {
  num sumBy(num f(T element)) {
    num sum = 0;
    for (var item in this) {
      sum += f(item);
    }
    return sum;
  }

  T? find(bool f(T element)) {
    for (var item in this) {
      if (f(item)) {
        return item;
      }
    }
    return null;
  }
}
