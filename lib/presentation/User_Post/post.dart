class Post{


  final int userId;
  final String title;
  final String description;

  Post({
    required this.userId,
    required this.title,
    required this.description
});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['id'],
      title: json['title'],
      description: json['body'],
    );
  }
}
