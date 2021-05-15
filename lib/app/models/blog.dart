class Blog {
  List<Article> data;

  Blog({this.data});

  Blog.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Article>[];
      json['data'].forEach((v) {
        data.add(Article.fromJson(v));
      });
    }
  }
}

class Article {
  int id;
  String title;
  String body;
  int authorId;
  String image;
  String links;

  Article({
    this.id,
    this.title,
    this.body,
    this.authorId,
    this.image,
    this.links,
  });

  Article.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    authorId = json['author_id'];
    image = json['image'];
    links = json['links'];
  }
}
