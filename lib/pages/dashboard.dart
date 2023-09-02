import 'package:conning_tower/constants.dart';
import 'package:conning_tower/generated/l10n.dart';
import 'package:conning_tower/pages/opreation_schedule.dart';
import 'package:conning_tower/pages/photo_gallery.dart';
import 'package:conning_tower/pages/port_info.dart';
import 'package:conning_tower/routes/cupertino_picker_view.dart';
import 'package:conning_tower/widgets/web_info_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard(
      {super.key, required this.notifyParent});

  final VoidCallback notifyParent;

  @override
  ConsumerState createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      // debugPrint(
      //     "dashboard space: W:${constraints.maxWidth} H:${constraints.maxHeight}");

      List<String> titles = [
        S.of(context).PhotoAlbum,
        S.of(context).WebInfo,
      ];

      if (kIsOpenSource) {
        titles.add("提督室");
        titles.add("遠征");
      }

      List<Widget> items = <Widget>[
        for (var i in titles)
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              i,
              style:
                  constraints.maxWidth < 500 ? TextStyle(fontSize: 14) : null,
            ),
          )
      ];

      List<Widget> children = [
        const PhotoGallery(),
        const WebInfoList(),
      ];

      if (kIsOpenSource) {
        children.add(const PortInfo());
        children.add(const OperationPage());
      }


      return CupertinoPickerView(
        items: items,
        wideStyle: constraints.maxWidth >= 500,
        children: children,
      );
    });
  }
}