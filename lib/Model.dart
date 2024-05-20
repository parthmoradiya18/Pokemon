class Model {
  int? id;
  String? pokemon;
  String? type;
  List<String>? abilities;
  int? hitpoints;
  List<String>? evolutions;
  String? location;
  String? imageUrl;

  Model(
      {this.id,
        this.pokemon,
        this.type,
        this.abilities,
        this.hitpoints,
        this.evolutions,
        this.location,
        this.imageUrl});

  Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pokemon = json['pokemon'];
    type = json['type'];
    abilities = json['abilities'].cast<String>();
    hitpoints = json['hitpoints'];
    evolutions = json['evolutions'].cast<String>();
    location = json['location'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pokemon'] = this.pokemon;
    data['type'] = this.type;
    data['abilities'] = this.abilities;
    data['hitpoints'] = this.hitpoints;
    data['evolutions'] = this.evolutions;
    data['location'] = this.location;
    data['image_url'] = this.imageUrl;
    return data;
  }
}