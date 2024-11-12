enum Environment { stage, production }

enum ApiType { get, post, delete }

enum BaseStateStatus { initial, loading, success, failure }

enum UnderMaintenanceType {
  none(0),
  text(1),
  image(2);

  final int type;

  const UnderMaintenanceType(this.type);
}

enum UpdateMaintenanceType {
  maintenance,
  none,
  force,
  optional;
  const UpdateMaintenanceType();
}

