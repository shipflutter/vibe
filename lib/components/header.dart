import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:shadcn_jaspr/shadcn_jaspr.dart';

class Header extends StatelessComponent {
  const Header({super.key, required this.isDark, required this.onToggleTheme});

  final bool isDark;
  final void Function() onToggleTheme;

  @override
  Component build(BuildContext context) {
    return Component.element(
      tag: 'header',
      attributes: {
        'class':
            'sticky top-0 z-50 w-full border-b border-blue-100/80 bg-white/90 backdrop-blur supports-[backdrop-filter]:bg-white/75 dark:border-slate-800 dark:bg-slate-950/90 dark:supports-[backdrop-filter]:bg-slate-950/75'
      },
      children: [
        div(
          [
            div(
              [
                a(
                  [
                    img(
                        src: 'logo.png',
                        alt: 'ShipFlutter logo',
                        classes: 'h-7 w-7 rounded-lg'),
                    span([Component.text('ShipFlutter')],
                        classes:
                            'font-bold text-lg md:text-xl tracking-tighter'),
                  ],
                  href: '/',
                  classes: 'flex items-center space-x-2 shrink-0',
                ),
                Component.element(
                  tag: 'nav',
                  attributes: {'class': 'hidden md:flex gap-6'},
                  children: [
                    a([Component.text('Features')],
                        href: '#features',
                        classes:
                            'text-sm font-medium transition-colors hover:text-primary'),
                    a([Component.text('Pricing')],
                        href: '#pricing',
                        classes:
                            'text-sm font-medium transition-colors hover:text-primary'),
                    a([Component.text('FAQs')],
                        href: '#faqs',
                        classes:
                            'text-sm font-medium transition-colors hover:text-primary'),
                  ],
                ),
              ],
              classes: 'flex items-center gap-4 md:gap-10',
            ),
            div(
              [
                a(
                  [Component.text('Login')],
                  href: '/login',
                  classes:
                      'text-sm font-medium hidden sm:block hover:underline underline-offset-4',
                ),
                ShadButton(
                  [
                    Component.element(
                      tag: 'svg',
                      attributes: {
                        'xmlns': 'http://www.w3.org/2000/svg',
                        'width': '15',
                        'height': '15',
                        'viewBox': '0 0 24 24',
                        'fill': 'none',
                        'stroke': 'currentColor',
                        'stroke-width': '2',
                        'stroke-linecap': 'round',
                        'stroke-linejoin': 'round',
                      },
                      children: isDark
                          ? [
                              Component.element(tag: 'circle', attributes: {
                                'cx': '12',
                                'cy': '12',
                                'r': '4',
                              }),
                              Component.element(
                                  tag: 'path', attributes: {'d': 'M12 2v2'}),
                              Component.element(
                                  tag: 'path', attributes: {'d': 'M12 20v2'}),
                              Component.element(
                                  tag: 'path', attributes: {'d': 'M2 12h2'}),
                              Component.element(
                                  tag: 'path', attributes: {'d': 'M20 12h2'}),
                              Component.element(
                                  tag: 'path',
                                  attributes: {'d': 'm4.93 4.93 1.41 1.41'}),
                              Component.element(
                                  tag: 'path',
                                  attributes: {'d': 'm17.66 17.66 1.41 1.41'}),
                              Component.element(
                                  tag: 'path',
                                  attributes: {'d': 'm6.34 17.66-1.41 1.41'}),
                              Component.element(
                                  tag: 'path',
                                  attributes: {'d': 'm19.07 4.93-1.41 1.41'}),
                            ]
                          : [
                              Component.element(tag: 'path', attributes: {
                                'd': 'M12 3a6 6 0 0 0 9 9 9 9 0 1 1-9-9Z',
                              }),
                            ],
                    ),
                  ],
                  variant: ButtonVariant.outline,
                  size: ButtonSize.sm,
                  className:
                      'rounded-full !p-2 min-h-9 min-w-9 border-blue-200 bg-white/70 hover:bg-blue-50 dark:border-zinc-700 dark:bg-black dark:hover:bg-zinc-900',
                  onPressed: onToggleTheme,
                ),
                ShadButton(
                  [Component.text('Get Started')],
                  size: ButtonSize.sm,
                  className:
                      'rounded-full !px-4 !py-2 min-h-9 bg-blue-600 hover:bg-blue-700 text-white shadow-sm dark:shadow-none',
                  onPressed: () {},
                ),
              ],
              classes: 'flex items-center gap-2 md:gap-4',
            ),
          ],
          classes:
              'container flex h-16 items-center justify-between mx-auto px-4 md:px-8',
        ),
      ],
    );
  }
}
