import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:palm_code/resources/theme.dart';
import 'package:palm_code/src/navigation/navigation_service.dart';
import 'package:palm_code/src/web/web_store.dart';
import 'package:palm_code/src/widgets/circular_progress_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

// import 'package:webview_flutter_android/webview_flutter_android.dart'
//     as webview_flutter_android;

class WebPage extends StatefulWidget {
  final String? url;
  const WebPage({super.key, required this.url});

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  late WebStore _webStore;
  late NavigationService _navigationService;

  late final WebViewController _controller;

  @override
  void initState() {
    _webStore = GetIt.instance.get<WebStore>()..init();
    _navigationService = GetIt.instance.get<NavigationService>();
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);
    // #enddocregion platform_features
    final webUrlCode =
        RegExp(r"[\d\s]+").firstMatch(widget.url ?? "")?.group(0);
    final finalWebUrl =
        "https://www.gutenberg.org/cache/epub/$controller/pg$webUrlCode-images.html";

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            _webStore.webState = WebState.success;
          },
          onWebResourceError: (WebResourceError error) {
            _webStore.webState = WebState.error;
          },
        ),
      )
      ..loadRequest(Uri.parse(finalWebUrl));

    _controller = controller;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 1,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Observer(
              builder: (_) {
                return Text(
                  _webStore.title!,
                  style: const TextStyle(color: Colors.black),
                );
              },
            ),
          ],
        ),
        leading: Row(
          children: [
            GestureDetector(
              onTap: () async {
                if (await _controller.canGoBack()) {
                  await _controller.goBack();
                } else {
                  _navigationService.pop();
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Theme.of(context).contentPrimary,
                ),
              ),
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          Observer(
            builder: (_) {
              return WebViewWidget(
                controller: _controller,
              );
            },
          ),
          Observer(
            builder: (_) {
              return Conditional.single(
                context: context,
                conditionBuilder: (BuildContext context) =>
                    _webStore.webState == WebState.loading,
                widgetBuilder: (BuildContext context) => const Center(
                  child: CircularProgressWidget(),
                ),
                fallbackBuilder: (BuildContext context) => const SizedBox(),
              );
            },
          ),
        ],
      ),
    );
  }
}
