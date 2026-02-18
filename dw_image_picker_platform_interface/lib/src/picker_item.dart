class DWPickerItem {
  const DWPickerItem({
    required this.path,
    required this.id,
    required this.name,
    required this.mimeType,
    required this.size,
    required this.width,
    required this.height,
    required this.type,
    this.duration,
    this.thumbnail,
  });

  final String path;
  final String id;
  final String name;
  final String mimeType;
  final int size;
  final int width;
  final int height;
  final String type;
  final double? duration;
  final String? thumbnail;

  static String _decodePath(dynamic pathValue) {
    if (pathValue == null || pathValue is! String) {
      return pathValue?.toString() ?? '';
    }
    final path = pathValue;
    try {
      return Uri.decodeFull(path);
    } catch (_) {
      // Android/content URIs can have invalid percent-encoding (e.g. with some locales)
      return path;
    }
  }

  factory DWPickerItem.fromMap(Map<dynamic, dynamic> json) => DWPickerItem(
        path: DWPickerItem._decodePath(json['path']),
        id: DWPickerItem._decodePath(json['id']),
        name: json['name'],
        mimeType: json['mimeType'],
        size: json['size'],
        width: json['width'],
        height: json['height'],
        duration: json['duration'],
        thumbnail: json['thumbnail'] != null
            ? DWPickerItem._decodePath(json['thumbnail'])
            : null,
        type: json['type'],
      );

  Map<dynamic, dynamic> toMap() {
    final data = <dynamic, dynamic>{};
    data['path'] = path;
    data['id'] = id;
    data['name'] = name;
    data['mimeType'] = mimeType;
    data['size'] = size;
    data['width'] = width;
    data['height'] = height;
    data['duration'] = duration;
    data['thumbnail'] = thumbnail;
    data['type'] = type;
    return data;
  }
}