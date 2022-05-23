class Pair<T1, T2> {
  final T1 left;
  final T2 right;

  T1 get first {
    return left;
  }

  T2 get second {
    return right;
  }

  Pair(this.left, this.right);
}
