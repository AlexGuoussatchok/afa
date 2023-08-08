class Camera {
  int? id; // Auto-incremented primary key
  String? brand;
  String? model;
  String? cameraClass;
  String? cameraType;
  String? lensesMount;
  String? serialNumber;

  Camera({
    this.id,
    this.brand,
    this.model,
    this.cameraClass,
    this.cameraType,
    this.lensesMount,
    this.serialNumber,
  });

  // Convert a Camera object to a map for database operations
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'brand': brand,
      'model': model,
      'cameraClass': cameraClass,
      'cameraType': cameraType,
      'lensesMount': lensesMount,
      'serialNumber': serialNumber,
    };
  }

  // Create a Camera object from a map
  factory Camera.fromMap(Map<String, dynamic> map) {
    return Camera(
      id: map['id'],
      brand: map['brand'],
      model: map['model'],
      cameraClass: map['cameraClass'],
      cameraType: map['cameraType'],
      lensesMount: map['lensesMount'],
      serialNumber: map['serialNumber'],
    );
  }
}
