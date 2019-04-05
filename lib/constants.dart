enum Environment { DEV, STAGING, PROD }

class Constants {
  static Map<String, dynamic> _config;

  static void setEnvironment(Environment env) {
    switch (env) {
      case Environment.DEV:
        _config = _Config.debugConstants;
        break;
      case Environment.STAGING:
        _config = _Config.qaConstants;
        break;
      case Environment.PROD:
        _config = _Config.prodConstants;
        break;
    }
  }

  static get SERVER {
    return _config[_Config.SERVER];
  }

  static get WHERE_AM_I {
    return _config[_Config.WHERE_AM_I];
  }
}

class _Config {
  static const SERVER = "SERVER_URL";
  static const WHERE_AM_I = "WHERE_AM_I";

  static Map<String, dynamic> debugConstants = {
    SERVER: "http://13.232.216.221:8081/api/",
    WHERE_AM_I: "local",
  };

  static Map<String, dynamic> qaConstants = {
    SERVER: "https://staging1.example.com/",
    WHERE_AM_I: "staging",
  };

  static Map<String, dynamic> prodConstants = {
    SERVER: "https://itsallwidgets.com/",
    WHERE_AM_I: "prod"
  };
}