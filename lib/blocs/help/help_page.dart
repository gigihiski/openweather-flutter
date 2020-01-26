/**
 * Bookmark Page
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherforecast/blocs/help/help_bloc.dart';
import 'package:weatherforecast/blocs/help/help_state.dart';

// Components
import 'package:weatherforecast/components/app_bar.dart';

import 'package:webview_flutter/webview_flutter.dart';

class HelpPage extends StatelessWidget {
  static String tag = 'help-page';

  var customAppBar = OWAppBar(title: "");
  WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
      return JavascriptChannel(
          name: 'Toaster',
          onMessageReceived: (JavascriptMessage message) {
            Scaffold.of(context).showSnackBar(
              SnackBar(content: Text(message.message)),
            );
          });
    }

    return Scaffold(
        appBar: customAppBar,
        body: Stack(
          children: <Widget>[
            BlocBuilder<HelpBloc, HelpState>(builder: (context, state) {
              if (state is HelpLoaded) {
                return WebView(
                    javascriptMode: JavascriptMode.unrestricted,
                    onWebViewCreated:
                        (WebViewController webViewController) async {
                      _controller = webViewController;
                      _controller.loadUrl(state.htmlData);
                    },
                    javascriptChannels: <JavascriptChannel>[
                      _toasterJavascriptChannel(context),
                    ].toSet(),
                    navigationDelegate: (NavigationRequest request) {
                      return NavigationDecision.navigate;
                    },
                    onPageFinished: (String url) {
                      print('Page finished loading: $url');
                    });
              }
              return Center(child: CircularProgressIndicator());
            })
          ],
        ));
  }
}
