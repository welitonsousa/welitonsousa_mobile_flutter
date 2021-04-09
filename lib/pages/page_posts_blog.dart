import 'package:welitonsousa_mobile/controllers/controller_posts_blog.dart';
import 'package:welitonsousa_mobile/models/model_posts_blog.dart';
import 'package:welitonsousa_mobile/pages/page_drawer.dart';
import 'package:welitonsousa_mobile/widgets/widget_loading.dart';
import 'package:welitonsousa_mobile/widgets/wiget_post_item.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:flutter/material.dart';

class PagePostsBlog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ControllerPostsBlog.instance,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          appBar: _appBar(context),
          body: _body(),
          drawer: PageDrawer(),
        );
      },
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: Text('Blog'),
      actions: [_searchAction(context)],
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

  Widget _searchAction(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      width: 60,
      child: SearchableDropdown.single(
        closeButton: "Cancelar",
        searchHint: "Pesquisar",
        displayClearIcon: false,
        isExpanded: true,
        underline: Container(),
        items: _itemsSeach(context),
        onChanged: (value) {},
        selectedValueWidgetFn: (e) {
          print('object');
          Container();
        },
        icon: Icon(Icons.search, color: Theme.of(context).secondaryHeaderColor),
        searchFn: (String keyword, items) => _indexsSearchs(keyword),
      ),
    );
  }

  List<DropdownMenuItem> _itemsSeach(BuildContext context) {
    List<DropdownMenuItem> items = [];
    ControllerPostsBlog.instance.postsBlog?.forEach(
      (element) {
        items.add(
          DropdownMenuItem(
            child: Post.item(
              title: element.data.title,
              subtitle: element.data.smallDescription,
              image: element.data.image,
              onTap: () {
                Navigator.popAndPushNamed(context, 'post',
                    arguments: {"post": element});
              },
            ),
          ),
        );
      },
    );
    return items;
  }

  List<int> _indexsSearchs(String filter) {
    List<int> items = [];
    List<ModelPost> posts = ControllerPostsBlog.instance.postsBlog ?? [];
    int counter = posts.length;

    for (int i = 0; i < counter; i++) {
      if (posts[i].data.title.toLowerCase().contains(filter.toLowerCase())) {
        items.add(i);
      }
    }
    return items;
  }
}
