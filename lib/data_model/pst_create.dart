class PostCreate{
  String? name;
  String? job;

  static toJson(PostCreate postCreate) => {
    "name":postCreate.name,
    "job": postCreate.job
  };
}