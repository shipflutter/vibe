import 'package:jaspr/jaspr.dart';
import 'package:universal_web/web.dart' as web;

import 'pages/auth_page.dart';
import 'pages/legal_page.dart';
import 'pages/landing_page.dart';

class App extends StatelessComponent {
  const App({super.key});

  Component _pageForPath(String path) {
    final normalized = path.endsWith('/') && path.length > 1
        ? path.substring(0, path.length - 1)
        : path;

    if (normalized.endsWith('/login')) {
      return const LoginPage();
    }
    if (normalized.endsWith('/signup')) {
      return const SignupPage();
    }
    if (normalized.endsWith('/forgot-password')) {
      return const ForgotPasswordPage();
    }
    if (normalized.endsWith('/privacy')) {
      return const PrivacyPage();
    }
    if (normalized.endsWith('/terms')) {
      return const TermsPage();
    }
    return const LandingPage();
  }

  @override
  Component build(BuildContext context) {
    return Component.fragment([
      Document.head(
        title: 'ShipFlutter — Agent builds. You ship.',
        children: [
          Component.element(tag: 'base', attributes: {
            'href': web.window.location.hostname.contains('github.io')
                ? '/vibe/'
                : '/',
          }),
          Component.element(tag: 'link', attributes: {
            'href': 'styles.css',
            'rel': 'stylesheet',
          }),
          Component.element(tag: 'link', attributes: {
            'href':
                'https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap',
            'rel': 'stylesheet',
          }),
        ],
      ),
      _pageForPath(web.window.location.pathname),
    ]);
  }
}
