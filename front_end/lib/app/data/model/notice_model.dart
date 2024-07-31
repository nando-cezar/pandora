
class NoticeModel {
  String? uid;
  String? url;
  String? title;
  String? image;
  String? date;


  NoticeModel({
    required this.uid,
    required this.url,
    required this.title,
    required this.image,
    required this.date,
  });

  NoticeModel.fromJson(dynamic data) {
    uid = data['uid'].toString();
    url = data['url'].toString();
    title = data['title'].toString();
    image = data['image'].toString();
    date = data['date'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, Object>{};

    void addIfPresent(String fieldName, Object? value) {
      if (value != null) {
        json[fieldName] = value;
      }
    }

    addIfPresent('uid', uid);
    addIfPresent('url', url);
    addIfPresent('title', title);
    addIfPresent('image', image);
    addIfPresent('date', date);

    return json;
  }
}