class Profile {
  List<HardSkills> hardSkills = [];
  List<String> about = [];
  List<Projects> projects = [];
  List<String> softSkills = [];
  List<String> formation = [];

  Profile(
      {this.hardSkills,
      this.about,
      this.projects,
      this.softSkills,
      this.formation});

  Profile.fromJson(Map<String, dynamic> json) {
    if (json['hardSkills'] != null) {
      hardSkills = [];
      json['hardSkills'].forEach((v) {
        hardSkills.add(new HardSkills.fromJson(v));
      });
    }
    about = json['about'].cast<String>();
    if (json['projects'] != null) {
      projects = [];
      json['projects'].forEach((v) {
        projects.add(new Projects.fromJson(v));
      });
    }
    softSkills = json['softSkills'].cast<String>();
    formation = json['formation'].cast<String>();
  }
}

class HardSkills {
  List<String> itens;
  String title;

  HardSkills({this.itens, this.title});

  HardSkills.fromJson(Map<String, dynamic> json) {
    itens = json['itens'].cast<String>();
    title = json['title'];
  }
}

class Projects {
  String title;
  String description;
  String link;

  Projects({this.title, this.description, this.link});

  Projects.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    link = json['link'];
  }
}
