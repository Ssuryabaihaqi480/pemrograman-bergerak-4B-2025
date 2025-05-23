class ModelPrestasi {
  int? id;
  String? name;
  String? lokal;
  String? regional;
  String? nasional;
  String? internasional;

  ModelPrestasi(
    this.id,
    this.name,
    this.lokal,
    this.regional,
    this.nasional,
    this.internasional,
  );

  ModelPrestasi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lokal = json['lokal'];
    regional = json['regional'];
    nasional = json['nasional'];
    internasional = json['internasional'];
  }
}
