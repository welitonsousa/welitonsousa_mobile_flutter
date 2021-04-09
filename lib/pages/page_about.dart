import 'package:flutter/material.dart';
import 'package:welitonsousa_mobile/controllers/controller_about_profile.dart';
import 'package:welitonsousa_mobile/models/model_profile_about.dart';
import 'package:welitonsousa_mobile/pages/page_drawer.dart';
import 'package:welitonsousa_mobile/widgets/widget_app_bar.dart';
import 'package:welitonsousa_mobile/widgets/widget_buttom_sheet.dart';
import 'package:welitonsousa_mobile/widgets/widget_loading.dart';

class PageAbout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ControllerAbountProfile.instance,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          appBar: CustomAppBar.material(title: 'Sobre', context: context),
          drawer: PageDrawer(),
          body: _body(),
        );
      },
    );
  }

  Widget _body() {
    int counter = ControllerAbountProfile.instance.counterItems;
    if (ControllerAbountProfile.instance.profile == null) {
      ControllerAbountProfile.instance.getProfile();
    }
    if (ControllerAbountProfile.instance.isLoading) {
      return Loading.show();
    }

    return RefreshIndicator(
      key: ControllerAbountProfile.instance.refreshKey,
      onRefresh: ControllerAbountProfile.instance.getProfile,
      child: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: counter,
        itemBuilder: (BuildContext context, int index) {
          Profile profile = ControllerAbountProfile.instance.profile;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 200,
                child: ClipOval(
                  child: Image.asset('assets/images/profile.jpg'),
                ),
              ),
              Text('Weliton Sousa', style: TextStyle(fontSize: 20)),
              Container(height: 20),
              card(children: items(profile.formation), title: 'Formações'),
              card(children: items(profile.softSkills), title: 'SoftSkills'),
              card(children: items(profile.about), title: 'Vivencias'),
              ListTile(
                title: Text('HardSkills'),
                trailing: Icon(Icons.keyboard_arrow_down),
                onTap: () => showHard(context, profile.hardSkills),
              ),
            ],
          );
        },
      ),
    );
  }

  void showHard(BuildContext context, List<HardSkills> hardSkills) {
    ButtomSheet.showMenuBottomSheet(
      context: context,
      title: 'HardSkills',
      options: hardSkills
          .map((e) => card(children: items(e.itens), title: e.title))
          .toList(),
    );
  }

  Widget card({
    @required List<Widget> children,
    @required String title,
    bool expanded = false,
  }) {
    return Container(
      constraints: new BoxConstraints(minHeight: 50),
      child: ExpansionTile(
        initiallyExpanded: expanded,
        title: Text(title),
        children: children,
      ),
    );
  }

  List<Widget> items(List<String> list) {
    List<Widget> items = list
        .map((e) => ListTile(
              visualDensity: VisualDensity.compact,
              title: Text(e),
              leading: Icon(Icons.arrow_right_alt),
            ))
        .toList();
    return items;
  }
}
