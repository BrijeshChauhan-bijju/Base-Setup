import 'package:flutter/material.dart';

showAppModalBottomSheet(
  BuildContext context, {
  required List<Widget> children,
  double initialChildSize = 0.8,
  double minChildSize = 0.2,
  double maxChildSize = 0.8,
  bool wantScrollBar = true,
  Color? sheetColor,
  bool showBottomSheetFullScreen = false,
  bool showPullContainer = true,
  bool isDraggable = true,
}) {
  showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
    ),
    isScrollControlled: showBottomSheetFullScreen ? true : isDraggable,
    isDismissible: isDraggable,
    enableDrag: isDraggable,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
        color: sheetColor ?? Colors.white,
      ),
      child: isDraggable
          ? DraggableScrollableSheet(
              initialChildSize: initialChildSize,
              minChildSize: minChildSize,
              maxChildSize: maxChildSize,
              expand: false,
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    children: [
                      _pullContainer(showPullContainer, context),
                      wantScrollBar
                          ? Expanded(
                              child: Scrollbar(
                                controller: scrollController,
                                thumbVisibility: true,
                                radius: Radius.circular(8),
                                thickness: 4,
                                child: ListView(
                                  controller: scrollController,
                                  children: children,
                                ),
                              ),
                            )
                          : Expanded(
                              child: ListView(
                                controller: scrollController,
                                children: children,
                              ),
                            ),
                    ],
                  ),
                );
              },
            )
          : Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                children: [
                  _pullContainer(showPullContainer, context),
                  wantScrollBar
                      ? Expanded(
                          child: ListView(
                            children: children,
                          ),
                        )
                      : Expanded(
                          child: ListView(
                            children: children,
                          ),
                        ),
                ],
              ),
            ),
    ),
  );
}

Widget _pullContainer(bool showPullContainer, BuildContext context) {
  return showPullContainer
      ? Container(
          margin: EdgeInsets.only(
            top: 10,
            bottom: 20,
            left: MediaQuery.of(context).size.width * 0.4,
            right: MediaQuery.of(context).size.width * 0.4,
          ),
          height: 4,
          width: 64,
          decoration: BoxDecoration(
            color: const Color(0xffDDDDDD),
            borderRadius: BorderRadius.circular(10),
          ),
        )
      : SizedBox.shrink();
}
