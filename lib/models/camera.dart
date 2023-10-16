class Camera {
  String url;
  String name;
  String model;
  int resolution;

  Camera(this.url, this.name, this.model, this.resolution);

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'name': name,
      'model': model,
      'resolution': resolution,
    };
  }
}
