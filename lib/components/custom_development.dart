import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:shadcn_jaspr/shadcn_jaspr.dart';

class CustomDevelopment extends StatelessComponent {
  const CustomDevelopment({super.key});

  @override
  Component build(BuildContext context) {
    return Component.element(
      tag: 'section',
      attributes: {
        'id': 'services',
        'class': 'flex min-h-screen items-center py-16 md:py-20'
      },
      children: [
        div(
          [
            div(
              [
                ShadBadge(
                  [Component.text('Custom development')],
                  variant: BadgeVariant.secondary,
                  className:
                      'mb-5 rounded-full px-4 py-1.5 text-xs font-semibold uppercase tracking-wider',
                ),
                h2(
                  [Component.text('Custom development')],
                  classes:
                      'text-3xl font-bold tracking-tight sm:text-4xl lg:text-5xl',
                ),
                p(
                  [
                    Component.text(
                        'Need more than recipes? ShipFlutter can help design, build, launch, and maintain your Flutter app with production-ready code.'),
                  ],
                  classes:
                      'mx-auto mt-4 max-w-xl text-sm leading-6 text-muted-foreground sm:text-base sm:leading-7',
                ),
              ],
              classes: 'mx-auto mb-8 max-w-2xl text-center sm:mb-10',
            ),
            div(
              [
                _serviceCard(
                  title: 'Strategy',
                  price: 'Plan',
                  description:
                      'Turn your idea into a focused MVP roadmap with product flows, launch scope, and technical direction.',
                  features: const [
                    'MVP scope and feature map',
                    'UX flow recommendations',
                    'Architecture review',
                  ],
                  cta: 'Email us',
                ),
                _serviceCard(
                  title: 'Build',
                  price: 'Launch',
                  description:
                      'We design and build your Flutter app end-to-end for iOS, Android, and web with backend integrations.',
                  features: const [
                    'Flutter app development',
                    'Auth, payments, and database',
                    'App Store launch support',
                    'Production source code',
                  ],
                  cta: 'Book a custom build',
                  isPopular: true,
                ),
                _serviceCard(
                  title: 'Scale',
                  price: 'Ops',
                  description:
                      'Extend your shipped product with infrastructure, monitoring, AI features, and ongoing development support.',
                  features: const [
                    'Cloud hosting and deployment',
                    'Monitoring and analytics',
                    'AI/API integrations',
                  ],
                  cta: 'Email us',
                ),
              ],
              classes:
                  'mx-auto grid max-w-6xl items-center gap-5 lg:grid-cols-3 lg:gap-6',
            ),
          ],
          classes: 'container mx-auto px-4 md:px-8',
        ),
      ],
    );
  }

  Component _serviceCard({
    required String title,
    required String price,
    required String description,
    required List<String> features,
    required String cta,
    bool isPopular = false,
  }) {
    return ShadCard(
      [
        if (isPopular)
          div(
            [Component.text('MOST POPULAR')],
            classes:
                'absolute left-1/2 top-0 -translate-x-1/2 -translate-y-1/2 rounded-full bg-black px-3 py-1 text-[10px] font-bold uppercase tracking-wider text-white dark:bg-white dark:text-black',
          ),
        ShadCardContent(
          [
            div(
              [
                h3([Component.text(title)],
                    classes: 'text-xl font-bold tracking-tight sm:text-2xl'),
                div(
                  [Component.text(price)],
                  classes:
                      'mt-4 text-2xl font-extrabold tracking-tight sm:text-3xl',
                ),
                p([Component.text(description)],
                    classes:
                        'mt-3 min-h-16 text-sm leading-6 text-muted-foreground'),
                ShadButton(
                  [Component.text(cta)],
                  variant: isPopular ? null : ButtonVariant.outline,
                  className:
                      'mt-6 w-full rounded-full !px-5 !py-2.5 text-sm font-semibold ${isPopular ? 'bg-black text-white shadow-lg shadow-zinc-200 hover:bg-zinc-800 dark:bg-white dark:text-black dark:shadow-none dark:hover:bg-zinc-200' : 'border-zinc-200 bg-white text-black hover:bg-zinc-50 dark:border-zinc-800 dark:bg-black dark:text-white dark:hover:bg-zinc-900'}',
                  onPressed: () {},
                ),
              ],
            ),
            Component.element(
              tag: 'ul',
              attributes: {'class': 'mt-6 space-y-3'},
              children: [
                for (final feature in features)
                  Component.element(
                    tag: 'li',
                    attributes: {
                      'class': 'flex items-start gap-3 text-sm leading-5'
                    },
                    children: [
                      _checkIcon(),
                      Component.text(feature),
                    ],
                  ),
              ],
            ),
          ],
          className: 'flex h-full flex-col p-6 sm:p-7',
        ),
      ],
      className:
          'relative flex h-full max-h-[460px] flex-col bg-white/90 dark:bg-zinc-950/90 ${isPopular ? 'z-10 border border-black shadow-2xl shadow-zinc-200/70 dark:border-white dark:shadow-none lg:scale-[1.02]' : 'border-zinc-200 shadow-sm dark:border-zinc-800'}',
    );
  }

  Component _checkIcon() {
    return div(
      [
        Component.element(
          tag: 'svg',
          attributes: {
            'xmlns': 'http://www.w3.org/2000/svg',
            'width': '14',
            'height': '14',
            'viewBox': '0 0 24 24',
            'fill': 'none',
            'stroke': 'currentColor',
            'stroke-width': '3',
            'stroke-linecap': 'round',
            'stroke-linejoin': 'round',
            'class': 'text-white dark:text-black',
          },
          children: [
            Component.element(
                tag: 'path', attributes: {'d': 'M20 6L9 17l-5-5'}),
          ],
        ),
      ],
      classes:
          'mt-0.5 flex h-5 w-5 shrink-0 items-center justify-center rounded-full bg-black dark:bg-white',
    );
  }
}
