import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:shadcn_jaspr/shadcn_jaspr.dart';

class Pricing extends StatelessComponent {
  const Pricing({super.key});

  @override
  Component build(BuildContext context) {
    return Component.element(
      tag: 'section',
      attributes: {'id': 'pricing', 'class': 'py-20 md:py-32'},
      children: [
        div(
          [
            div(
              [
                h2([Component.text('Simple, transparent pricing')],
                    classes:
                        'text-2xl font-bold tracking-tight sm:text-5xl mb-6'),
                p([
                  Component.text(
                      'Pro recipes include full backend implementation, App Store compliance templates, and battle-tested pitfall guides.')
                ],
                    classes:
                        'max-w-2xl text-base sm:text-lg text-muted-foreground'),
              ],
              classes: 'flex flex-col items-center text-center mb-12 sm:mb-16',
            ),
            div(
              [
                _pricingCard(
                  'Free',
                  '\$0',
                  'Open-source components for everyone.',
                  [
                    '100+ UI Components',
                    '60+ Animation Components',
                    'MIT License'
                  ],
                  'Get Started',
                  variant: ButtonVariant.outline,
                ),
                _pricingCard(
                  'Pro',
                  '\$89',
                  'Lifetime access, one-time payment.',
                  [
                    'All Free features',
                    '30+ Full-Stack Modules',
                    'Deployment Guides',
                    'Compliance Templates',
                    'All Future Pro Recipes'
                  ],
                  'Get Lifetime Access',
                  isPopular: true,
                ),
                _pricingCard(
                  'Max',
                  '\$200',
                  'Monthly managed service & hosting.',
                  [
                    'Everything in Pro',
                    'Consulting & Coaching',
                    'App Store Hosting',
                    'AWS Hosting & Ops',
                    'Founder Slack Access'
                  ],
                  'Subscribe to Max',
                  priceSuffix: '/mo',
                ),
              ],
              classes: 'grid gap-6 sm:gap-8 lg:grid-cols-3 mb-16 px-4 sm:px-0',
            ),

            // Founder Services
            div(
              [
                h3([Component.text('Founder Services')],
                    classes: 'text-xl sm:text-2xl font-bold mb-4'),
                p([
                  Component.text(
                      'We build and ship for you in 4 weeks. iOS + Android + Web, full source code + ops.')
                ], classes: 'text-sm sm:text-base text-muted-foreground mb-8'),
                ShadButton(
                  [Component.text('Contact for Quote →')],
                  className:
                      'rounded-full !px-5 !py-2.5 min-h-10 text-sm sm:text-base',
                  onPressed: () {},
                ),
              ],
              classes:
                  'rounded-2xl border bg-gradient-to-r from-primary/10 via-background to-primary/10 p-6 sm:p-8 md:p-12 text-center max-w-4xl mx-auto mx-4 sm:mx-auto',
            ),
          ],
          classes: 'container mx-auto px-4 md:px-8',
        ),
      ],
    );
  }

  Component _pricingCard(
      String name, String price, String desc, List<String> features, String cta,
      {bool isPopular = false,
      ButtonVariant? variant,
      String priceSuffix = ''}) {
    return ShadCard([
      if (isPopular)
        div([Component.text('Most Popular')],
            classes:
                'absolute top-0 right-4 sm:right-8 -translate-y-1/2 rounded-full bg-primary px-3 py-1 text-[8px] sm:text-[10px] font-bold text-primary-foreground uppercase tracking-wider'),
      div(
        [
          h3([Component.text(name)],
              classes: 'font-bold text-xl sm:text-2xl mb-2'),
          div([
            span([Component.text(price)],
                classes: 'text-3xl sm:text-4xl font-extrabold'),
            if (priceSuffix.isNotEmpty)
              span([Component.text(priceSuffix)],
                  classes: 'text-sm sm:text-base text-muted-foreground'),
          ], classes: 'flex items-baseline gap-1 mb-4'),
          p([Component.text(desc)],
              classes: 'text-xs sm:text-sm text-muted-foreground'),
        ],
        classes: 'mb-6 sm:mb-8',
      ),
      Component.element(
        tag: 'ul',
        attributes: {'class': 'mb-6 sm:mb-8 space-y-3 sm:space-y-4 flex-1'},
        children: [
          for (var feature in features)
            Component.element(tag: 'li', attributes: {
              'class': 'flex items-center gap-2 sm:gap-3 text-xs sm:text-sm'
            }, children: [
              div([
                Component.element(
                  tag: 'svg',
                  attributes: {
                    'xmlns': 'http://www.w3.org/2000/svg',
                    'width': '10',
                    'height': '10',
                    'viewBox': '0 0 24 24',
                    'fill': 'none',
                    'stroke': 'currentColor',
                    'stroke-width': '3',
                    'stroke-linecap': 'round',
                    'stroke-linejoin': 'round',
                    'class': 'text-primary'
                  },
                  children: [
                    Component.element(
                        tag: 'path', attributes: {'d': 'M20 6L9 17l-5-5'}),
                  ],
                ),
              ], classes: 'rounded-full bg-primary/20 p-1 shrink-0'),
              Component.text(feature),
            ]),
        ],
      ),
      ShadButton(
        [Component.text(cta)],
        variant: variant,
        className:
            'w-full rounded-full !px-5 !py-2.5 min-h-10 text-sm sm:text-base ${isPopular ? 'bg-black text-white hover:bg-zinc-800 shadow-lg shadow-zinc-200 dark:bg-white dark:text-black dark:hover:bg-zinc-200 dark:shadow-none' : ''}',
        onPressed: () {},
      ),
    ],
        className:
            'relative flex flex-col p-6 sm:p-8 ${isPopular ? 'border-primary shadow-xl dark:shadow-none dark:border-primary/70 scale-100 sm:scale-105 z-10' : 'bg-background'}');
  }
}
