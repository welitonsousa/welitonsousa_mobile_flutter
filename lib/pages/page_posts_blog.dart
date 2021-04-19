import 'package:welitonsousa_mobile/controllers/controller_posts_blog.dart';
import 'package:welitonsousa_mobile/models/model_posts_blog.dart';
import 'package:welitonsousa_mobile/pages/page_drawer.dart';
import 'package:welitonsousa_mobile/widgets/widget_app_bar.dart';
import 'package:welitonsousa_mobile/widgets/widget_loading.dart';
import 'package:welitonsousa_mobile/widgets/wiget_post_item.dart';
import 'package:flutter/material.dart';

class PagePostsBlog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ControllerPostsBlog.instance,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          appBar: CustomAppBar.material(title: 'Blog', context: context),
          body: _body(),
          drawer: PageDrawer(),
        );
      },
    );
  }

  Widget _body() {
    int counterPosts = ControllerPostsBlog.instance.postsBlog?.length ?? 0;

    if (ControllerPostsBlog.instance.postsBlog == null) {
      ControllerPostsBlog.instance.getPostsBlog();
    }
    if (ControllerPostsBlog.instance.isLoading) {
      return Loading.show();
      String a;
    }

    return RefreshIndicator(
      key: ControllerPostsBlog.instance.refreshKey,
      onRefresh: ControllerPostsBlog.instance.getPostsBlog,
      child: ListView.builder(
        itemCount: counterPosts,
        itemBuilder: (BuildContext context, int index) {
          List<ModelPost> posts = ControllerPostsBlog.instance.postsBlog;
          return Post.item(
            title: posts[index].data.title,
            subtitle: posts[index].data.smallDescription,
            image: posts[index].data.image,
            onTap: () {
              Navigator.pushNamed(context, 'post',
                  arguments: {"post": posts[index]});
            },
          );
        },
      ),
    );
  }
}
