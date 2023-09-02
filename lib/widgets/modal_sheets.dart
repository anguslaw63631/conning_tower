import 'package:conning_tower/generated/l10n.dart';
import 'package:conning_tower/widgets/dailog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModalFit extends StatelessWidget {
  final List<Widget> children;

  const ModalFit({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      ),
    );
  }
}

class ComplexModal extends StatelessWidget {
  final Widget child;

  const ComplexModal({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: WillPopScope(
        onWillPop: () async {
          bool shouldClose = true;
          await showAdaptiveDialog(context,
              title: Text(S.of(context).TextShouldClose),
              content: null,
              actions: [
                AdaptiveDialogAction(
                  child: Text(S.current.TextNo),
                  onPressed: () {
                    shouldClose = false;
                    Navigator.of(context).pop();
                  },
                ),
                AdaptiveDialogAction(
                  child: Text(S.current.TextYes),
                  onPressed: () {
                    shouldClose = true;
                    Navigator.of(context).pop();
                  },
                ),
              ]);
          return shouldClose;
        },
        child: child,
      ),
    );
  }
}