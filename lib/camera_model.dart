class Camera {
  final int? id; // Auto-incremented unique identifier
  final String brand;
  final String model;
  final String cameraClass;
  final String cameraType;
  final String lensesMount;
  final String serialNumber;

  Camera({
    this.id, // Auto-incremented unique identifier
    required this.brand,
    required this.model,
    required this.cameraClass,
    required this.cameraType,
    required this.lensesMount,
    required this.serialNumber,
  });

  // Convert Camera object to a map
  Map<String, dynamic> toMap() {
    return {
      'id': id, // Auto-incremented unique identifier
      'brand': brand,
      'model': model,
      'class': cameraClass,
      'type': cameraType,
      'mount': lensesMount,
      'serialNumber': serialNumber,
    };
  }

  // Create Camera object from a map
  static Camera fromMap(Map<String, dynamic> map) {
    return Camera(
      id: map['id'],
      brand: map['brand'],
      model: map['model'],
      cameraClass: map['class'],
      cameraType: map['type'],
      lensesMount: map['mount'],
      serialNumber: map['serialNumber'],
    );
  }
}
