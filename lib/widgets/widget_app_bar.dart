import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:welitonsousa_mobile/controllers/controller_posts_blog.dart';
import 'package:welitonsousa_mobile/models/model_posts_blog.dart';
import 'package:welitonsousa_mobile/widgets/wiget_post_item.dart';

class CustomAppBar {
  static final CustomAppBar _instance = CustomAppBar();

  static PreferredSizeWidget material(
      {@required String title, @required BuildContext context}) {
    //BuildContext context = CustomSnackBar.instance.key.currentContext;
    return AppBar(
      title: Text(title),
      centerTitle: true,
      actions: [_instance._searchAction(context)],
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
        selectedValueWidgetFn: (e) => Container(),
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
