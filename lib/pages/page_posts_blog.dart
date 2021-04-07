import 'package:welitonsousa_mobile/controllers/controller_posts_blog.dart';
import 'package:welitonsousa_mobile/widgets/widget_loading.dart';
import '../models/model_posts_blog.dart';
import 'package:flutter/material.dart';

class PagePostsBlog extends StatelessWidget {
  PagePostsBlog() {
    print('iniciou');
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ControllerPostsBlog.instance,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          appBar: _appBar(),
          body: _body(),
        );
      },
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: Text('Blog'),
    );
  }

  Widget _body() {
    int counterPosts = ControllerPostsBlog.instance.postsBlog?.length ?? 0;

    if (ControllerPostsBlog.instance.postsBlog == null) {
      ControllerPostsBlog.instance.getPostsBlog();
    }
    if (ControllerPostsBlog.instance.isLoading) {
      return Loading.show();
    }

    return RefreshIndicator(
      onRefresh: ControllerPostsBlog.instance.getPostsBlog,
      child: ListView.builder(
        itemCount: counterPosts,
        itemBuilder: (BuildContext context, int index) {
          List<ModelPost> posts = ControllerPostsBlog.instance.postsBlog;
          return ListTile(
            title: Text(posts[index].data.title),
          );
        },
      ),
    );
  }
}
