enum Environment {
  dev,
  prod,
  stag,
}

class Flavor {
  Flavor();

  static Environment? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Environment.dev:
        return 'MovieDB DEV';
      case Environment.prod:
        return 'MovieDB';
      case Environment.stag:
        return 'MovieDB staging';
      default:
        return 'title';
    }
  }
}
