import 'package:welitonsousa_mobile/models/model_posts_blog.dart';
import 'package:welitonsousa_mobile/widgets/widget_post.dart';
import 'package:flutter/material.dart';

class PagePost extends StatefulWidget {
  @override
  _PagePostState createState() => _PagePostState();
}

class _PagePostState extends State<PagePost> {
  @override
  Widget build(BuildContext context) {
    Map args = ModalRoute.of(context).settings.arguments;
    final ModelPost post = args["post"];

    return Scaffold(
      body: _body(post: post),
      appBar: _appBar(post.data.title),
    );
  }

  Widget _appBar(String title) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
    );
  }

  Widget _body({ModelPost post}) {
    return ListView.builder(
      padding: EdgeInsets.only(left: 20, top: 20, right: 20),
      itemCount: post.data.fullDescription.length,
      itemBuilder: (BuildContext context, int index) {
        List<FullDescription> full = post.data.fullDescription;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _firstWidgets(index, post),
            full[index].title != null && full[index].title != ""
                ? WidgetsPost.text(full[index].title, size: 25, space: 25)
                : Container(),
            full[index].description != null
                ? WidgetsPost.text(full[index].description, space: 15)
                : Container(),
            full[index].code != null && full[index].code != ""
                ? WidgetsPost.fullCode(full[index].code, context)
                : Container(),
            full[index].image != null && full[index].image != ""
                ? WidgetsPost.image(full[index].image)
                : Container(),
            _endWidgets(index, post),
          ],
        );
      },
    );
  }

  Widget _firstWidgets(int index, ModelPost post) {
    return index == 0
        ? Column(
            children: [
              WidgetsPost.image(post.data.image),
              WidgetsPost.text(post.data.title,
                  size: 30, textAlign: TextAlign.center),
              WidgetsPost.text(post.data.smallDescription, size: 25),
              Divider(height: 60)
            ],
          )
        : Container();
  }

  Widget _endWidgets(int index, ModelPost post) {
    return Column(
      children: [
        index + 1 == post.data.fullDescription.length
            ? Container(height: 100)
            : Container(),
        index + 1 == post.data.fullDescription.length &&
                post.data.imageExample != null &&
                post.data.imageExample != ""
            ? WidgetsPost.image(post.data.imageExample)
            : Container(),
      ],
    );
  }
}
