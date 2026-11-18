// App móvil que abre el visor 360 (web) dentro de un WebView.
// Dependencia en pubspec.yaml:
//   dependencies:
//     webview_flutter: ^4.10.0
//
// Android: en android/app/src/main/AndroidManifest.xml agrega
//   <uses-permission android:name="android.permission.INTERNET"/>

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// Cambia por la URL HTTPS donde publiques la carpeta tour-demo
// (GitHub Pages, Netlify, el servidor de la inmobiliaria, etc.)
const String tourUrl = 'https://desarrollo7-evolutel.github.io/GyroHouse/';

void main() {
  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: TourPage()),
  );
}

class TourPage extends StatefulWidget {
  const TourPage({super.key});

  @override
  State<TourPage> createState() => _TourPageState();
}

class _TourPageState extends State<TourPage> {
  late final WebViewController _controller;
  bool _cargando = true;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.black)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (_) => setState(() => _cargando = false),
        ),
      )
      ..loadRequest(Uri.parse(tourUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            WebViewWidget(controller: _controller),
            if (_cargando) const Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
