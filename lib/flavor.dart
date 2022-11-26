enum FlavorType {
  DEV,
  STG,
  PRD,
}

class Flavor {
  Flavor._internal();
  static final Flavor _instance = Flavor._internal();
  static Flavor get instance => _instance;

  FlavorType _flavor = FlavorType.DEV;
  set setFlavor(FlavorType flavor) => _flavor = flavor;
  FlavorType get value => _flavor;
  bool _isPhysicalDevice = true;
  set setPhysicalDevice(bool value) => _isPhysicalDevice = value;

  bool get isPhysicalDevice {
    switch (value) {
      case FlavorType.DEV:
        return _isPhysicalDevice;
      case FlavorType.STG:
        return true;
      case FlavorType.PRD:
        return true;
      default:
        return true;
    }
  }

  String get api {
    switch (_flavor) {
      case FlavorType.DEV:
        return 'https://a.zencillo.net/ZS_APICapturadorConsolidador/v1/post_command';
      case FlavorType.PRD:
        return 'https://a.zencillo.net/ZS_APICapturadorConsolidador/v1/post_command';
      case FlavorType.STG:
        return 'https://a.zencillo.net/ZS_APICapturadorConsolidador/v1/post_command';
    }
  }
}
