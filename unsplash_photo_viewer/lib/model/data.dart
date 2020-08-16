class SearchResult {
  int total;
  int totalPages;
  List<Photo> photos;

  SearchResult({this.total, this.totalPages, this.photos});

  SearchResult.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    totalPages = json['total_pages'];
    if (json['results'] != null) {
      photos = new List<Photo>();
      json['results'].forEach((v) {
        photos.add(new Photo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['total_pages'] = this.totalPages;
    if (this.photos != null) {
      data['results'] = this.photos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Photo {
  String id;
  String author;
  String name;
  Url urls;

  Photo({this.id, this.name, this.urls});

  Photo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    author = json['user']['name'];
    name = json['description'];
    if (name == null) {
      name = 'Empty name :(';
    }
    urls = json['urls'] != null ? new Url.fromJson(json['urls']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user']['name'] = this.author;
    data['description'] = this.name;
    if (this.urls != null) {
      data['urls'] = this.urls.toJson();
    }
    return data;
  }
}

class Url {
  String small;

  Url({this.small});

  Url.fromJson(Map<String, dynamic> json) {
    small = json['small'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this.small;
    return data;
  }
}
