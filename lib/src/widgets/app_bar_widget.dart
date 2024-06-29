import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:palm_code/resources/theme.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    this.title,
    this.showDivider = true,
    this.actions,
    this.showBackButton = true,
    this.customLeading = false,
    this.customTitleWidget,
    this.leading,
  });

  final String? title;
  final bool showDivider;
  final List<Widget>? actions;
  final bool showBackButton;
  final Widget? leading;
  final Widget? customTitleWidget;
  final bool customLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      elevation: 0,
      leading: customLeading
          ? leading
          : (Navigator.canPop(context) &&
                  !(ModalRoute.of(context)?.isFirst ?? true))
              ? leading ??
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () => Navigator.of(context).pop(),
                  )
              : null,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Visibility(
          visible: showDivider,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              color: Theme.of(context).borderDivider,
              height: 1.0,
            ),
          ),
        ),
      ),
      titleSpacing: customLeading && Navigator.canPop(context) ? 0.0 : 15,
      toolbarHeight: 48,
      automaticallyImplyLeading: false,
      actions: actions,
      title: customTitleWidget ??
          Text(
            title ?? "",
            textAlign: TextAlign.start,
            style: Theme.of(context).display4,
          ),
      iconTheme: IconThemeData(color: Theme.of(context).contentPrimary),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: customTitleWidget != null
          ? Theme.of(context).backgroundLightest
          : Theme.of(context).backgroundApp,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48);
}
