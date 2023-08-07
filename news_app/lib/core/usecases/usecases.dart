//Simple call to bussiness logic

abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}
