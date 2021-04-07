class ModelPost {
  String id;
  Data data;

  ModelPost({
    this.id,
    this.data,
  });

  ModelPost.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  String title;
  String imageExample;
  String smallDescription;
  Repo repo;
  Date date;
  String image;
  String dateShow;
  List<FullDescription> fullDescription;

  Data({
    this.title,
    this.imageExample,
    this.smallDescription,
    this.repo,
    this.date,
    this.image,
    this.dateShow,
    this.fullDescription,
  });

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'] ?? null;
    imageExample = json['imageExample'] ?? null;
    smallDescription = json['smallDescription'] ?? null;

    repo = json['repo']['link'] != null
        ? Repo.fromJson(json["repo"])
        : new Repo(link: "", title: "");

    date = json['date'] != null ? new Date.fromJson(json['date']) : null;
    image = json['image'] ?? null;
    dateShow = json['dateShow'] ?? null;

    if (json['fullDescription'] != null) {
      fullDescription = [];
      json['fullDescription'].forEach((v) {
        fullDescription.add(new FullDescription.fromJson(v));
      });
    }
  }
}

class Repo {
  String link;
  String title;

  Repo({this.link, this.title});

  Repo.fromJson(Map<String, dynamic> json) {
    link = json['link'] ?? null;
    title = json['title'] ?? null;
  }
}

class Date {
  int iSeconds;
  int iNanoseconds;

  Date({this.iSeconds, this.iNanoseconds});

  Date.fromJson(Map<String, dynamic> json) {
    iSeconds = json['_seconds'];
    iNanoseconds = json['_nanoseconds'];
  }
}

class FullDescription {
  String description;
  String title;
  String code;
  String lang;

  FullDescription({this.description, this.title, this.code, this.lang});

  FullDescription.fromJson(Map<String, dynamic> json) {
    description = json['description'] ?? null;
    title = json['title'] ?? null;
    code = json['code'] ?? null;
    lang = json['lang'] ?? null;
  }
}
