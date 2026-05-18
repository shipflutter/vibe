import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:universal_web/web.dart' as web;
import '../components/header.dart';
import '../components/hero.dart';
import '../components/logo_marquee.dart';
import '../components/features.dart';
import '../components/showcase.dart';
import '../components/custom_development.dart';
import '../components/pricing.dart';
import '../components/faq.dart';
import '../components/footer.dart';

class LandingPage extends StatefulComponent {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  static const _themeStorageKey = 'shipflutter-theme';

  bool _isDark = false;

  @override
  void initState() {
    super.initState();

    final savedTheme = web.window.localStorage.getItem(_themeStorageKey);
    if (savedTheme == 'dark' || savedTheme == 'light') {
      _isDark = savedTheme == 'dark';
    } else {
      final hour = DateTime.now().hour;
      _isDark = hour >= 18 || hour < 7;
    }

    _applyTheme();
  }

  void _applyTheme() {
    web.document.documentElement?.classList.toggle('dark', _isDark);
  }

  void _toggleTheme() {
    setState(() {
      _isDark = !_isDark;
    });
    web.window.localStorage
        .setItem(_themeStorageKey, _isDark ? 'dark' : 'light');
    _applyTheme();
  }

  @override
  Component build(BuildContext context) {
    return div(
      [
        Header(isDark: _isDark, onToggleTheme: _toggleTheme),
        main_(
          [
            Hero(),
            LogoMarquee(),
            Features(),
            Showcase(),
            CustomDevelopment(),
            Pricing(),
            FAQ(),
          ],
          classes: 'flex-1 w-full overflow-hidden',
        ),
        Footer(),
      ],
      classes:
          'min-h-screen bg-gradient-to-b from-white via-sky-50/30 to-white dark:from-black dark:via-black dark:to-black text-foreground font-sans selection:bg-primary/20 flex flex-col',
    );
  }
}
