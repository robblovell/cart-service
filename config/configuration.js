// Generated by CoffeeScript 1.10.0
(function() {
  var config;

  config = {
    env: process.env.NODE_ENV || 'local',
    db: process.env.DB || "mongodb://localhost:27017",
    port: process.env.PORT || '3000',
    host: process.env.HOST || 'localhost',
    basepath: "/",
    scheme: process.env.SCHEME || 'https',
    insightsKey: "",
    segementKey: "",
    timeout: 15000,
    version: "0.0.1",
    company: "BuildDirect",
    author: "Robb Lovell",
    title: "Cart Service",
    description: "Cart Service",
    database: "cart"
  };

  switch (config.env) {
    case 'develop':
      config.db = process.env.DB;
      config.basepath = "/";
      config.host = process.env.HOST;
      config.schemes = ['http'];
      break;
    case 'staging':
      config.db = process.env.DB;
      config.basepath = "/";
      config.host = process.env.HOST;
      config.schemes = ['https'];
      break;
    case 'production':
      config.db = process.env.DB;
      config.basepath = "/";
      config.host = process.env.HOST;
      config.schemes = ['https'];
      break;
    default:
      config.db = "mongodb://localhost:27017/" + config.database;
      config.basepath = "/";
      config.host = "localhost:3000";
      config.schemes = ['http'];
  }

  console.log("configuration: " + JSON.stringify(config));

  module.exports = config;

}).call(this);

//# sourceMappingURL=configuration.js.map