import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:shadcn_jaspr/shadcn_jaspr.dart';

class Showcase extends StatelessComponent {
  const Showcase({super.key});

  @override
  Component build(BuildContext context) {
    final apps = [
      {
        'name': 'FoodieMap',
        'desc': 'Local Food Explorer',
        'badges': ['map', 'auth', 'camera']
      },
      {
        'name': 'SmileMax',
        'desc': 'Glow Up Coach',
        'badges': ['camera', 'auth', 'subs']
      },
      {
        'name': 'Fullpack',
        'desc': 'Packing & Outfit',
        'badges': ['onboarding', 'settings']
      },
      {
        'name': 'Brushmo',
        'desc': 'Oral Health Companion',
        'badges': ['camera', 'auth']
      },
      {
        'name': 'Lifebang',
        'desc': 'Pro Cleaner',
        'badges': ['settings', 'subs']
      },
      {
        'name': 'UtilityMax',
        'desc': 'Financial Simulator',
        'badges': ['charts', 'subs']
      },
    ];

    return Component.element(
      tag: 'section',
      attributes: {'class': 'py-20 md:py-32 border-y bg-muted/10'},
      children: [
        div(
          [
            div(
              [
                ShadBadge([Component.text('Shipped by Makers')],
                    variant: BadgeVariant.secondary, className: 'mb-4'),
                h2([Component.text('From Prompt to App Store')],
                    classes:
                        'text-2xl font-bold tracking-tight sm:text-5xl mb-6'),
                p([
                  Component.text(
                      'These apps are live on the App Store — built with ShipFlutter recipes and AI-powered development.')
                ],
                    classes:
                        'max-w-2xl text-base sm:text-lg text-muted-foreground'),
              ],
              classes: 'flex flex-col items-center text-center mb-12 sm:mb-16',
            ),
            div(
              [
                for (var app in apps)
                  _appCard(app['name'] as String, app['desc'] as String,
                      app['badges'] as List<String>),
              ],
              classes: 'grid gap-4 sm:gap-6 sm:grid-cols-2 lg:grid-cols-3',
            ),
            div(
              [
                ShadButton(
                  [Component.text('View All in App Store')],
                  variant: ButtonVariant.outline,
                  className:
                      'rounded-full !px-5 !py-2.5 min-h-10 text-sm sm:text-base',
                  onPressed: () {},
                ),
              ],
              classes: 'mt-12 sm:mt-16 flex justify-center',
            ),
          ],
          classes: 'container mx-auto px-4 md:px-8',
        ),
      ],
    );
  }

  Component _appCard(String name, String description, List<String> badges) {
    return ShadCard([
      div(
        [
          // App Icon Placeholder
          div([Component.text(name[0])],
              classes:
                  'w-12 h-12 sm:w-16 sm:h-16 rounded-xl sm:rounded-2xl bg-gradient-to-br from-primary/20 to-primary/5 flex items-center justify-center text-xl sm:text-2xl font-bold border shrink-0'),
          div(
            [
              h3([Component.text(name)],
                  classes: 'font-bold text-lg sm:text-xl'),
              p([Component.text(description)],
                  classes: 'text-xs sm:text-sm text-muted-foreground'),
              div(
                [
                  for (var badge in badges)
                    span([Component.text(badge)],
                        classes:
                            'px-1.5 py-0.5 rounded-full bg-muted text-[8px] sm:text-[10px] font-medium uppercase tracking-wider'),
                ],
                classes: 'flex flex-wrap gap-1.5 pt-1.5',
              ),
            ],
            classes: 'flex-1 space-y-0.5 sm:space-y-1',
          ),
        ],
        classes: 'flex items-start gap-3 sm:gap-4 p-4 sm:p-6',
      ),
    ], className: 'overflow-hidden hover:shadow-lg transition-shadow');
  }
}
