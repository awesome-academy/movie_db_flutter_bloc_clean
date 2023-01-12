mixin UseCase<T, P> {
  Future<T> call({required final P params});
}
