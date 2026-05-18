import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:shadcn_jaspr/shadcn_jaspr.dart';
import 'package:universal_web/web.dart' as web;

class Header extends StatefulComponent {
  const Header({super.key, required this.isDark, required this.onToggleTheme});

  final bool isDark;
  final void Function() onToggleTheme;

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  bool _isMenuOpen = false;

  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
    });
    _syncBodyScroll();
  }

  void _closeMenu() {
    setState(() {
      _isMenuOpen = false;
    });
    _syncBodyScroll();
  }

  void _syncBodyScroll() {
    web.document.body?.style.overflow = _isMenuOpen ? 'hidden' : '';
  }

  @override
  Component build(BuildContext context) {
    return Component.fragment([
      Component.element(
        tag: 'header',
        attributes: {
          'class':
              'sticky top-0 z-50 w-full border-b border-primary/10 bg-white/90 backdrop-blur supports-[backdrop-filter]:bg-white/75 dark:border-slate-800 dark:bg-slate-950/90 dark:supports-[backdrop-filter]:bg-slate-950/75'
        },
        children: [
          div(
            [
              div(
                [
                  _brandLink(),
                  Component.element(
                    tag: 'nav',
                    attributes: {'class': 'hidden md:flex gap-6'},
                    children: [
                      _navLink('Features', '#features'),
                      _navLink('Services', '#services'),
                      _navLink('Pricing', '#pricing'),
                      _navLink('FAQs', '#faqs'),
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
                  _themeButton(),
                  ShadButton(
                    [Component.text('Get Started')],
                    size: ButtonSize.sm,
                    className:
                        'hidden rounded-full !px-4 !py-2 min-h-9 bg-primary hover:bg-primary/90 text-white shadow-sm dark:shadow-none sm:inline-flex',
                    onPressed: () {},
                  ),
                  ShadButton(
                    [_sidebarIcon()],
                    variant: ButtonVariant.ghost,
                    size: ButtonSize.sm,
                    className:
                        'inline-flex rounded-full !p-2 min-h-9 min-w-9 md:hidden',
                    onPressed: _toggleMenu,
                  ),
                ],
                classes: 'flex items-center gap-2 md:gap-4',
              ),
            ],
            classes:
                'container flex h-16 items-center justify-between mx-auto px-4 md:px-8',
          ),
        ],
      ),
      if (_isMenuOpen) _mobileMenu(),
    ]);
  }

  Component _brandLink() {
    return a(
      [
        img(
            src: 'logo.png',
            alt: 'ShipFlutter logo',
            classes: 'h-7 w-7 rounded-lg'),
        span([Component.text('ShipFlutter')],
            classes: 'font-bold text-lg md:text-xl tracking-tighter'),
      ],
      href: '/',
      classes: 'flex items-center space-x-2 shrink-0',
    );
  }

  Component _navLink(String label, String href) {
    return a([Component.text(label)],
        href: href,
        classes: 'text-sm font-medium transition-colors hover:text-primary');
  }

  Component _themeButton() {
    return ShadButton(
      [_themeIcon()],
      variant: ButtonVariant.outline,
      size: ButtonSize.sm,
      className:
          'rounded-full !p-2 min-h-9 min-w-9 border-primary/20 bg-white/70 hover:bg-primary/5 dark:border-zinc-700 dark:bg-black dark:hover:bg-zinc-900',
      onPressed: component.onToggleTheme,
    );
  }

  Component _mobileMenu() {
    return div(
      [
        div(
          [
            div(
              [
                a(
                  [
                    img(
                        src: 'logo.png',
                        alt: 'ShipFlutter logo',
                        classes: 'h-6 w-6 rounded-md'),
                    span([Component.text('ShipFlutter')],
                        classes:
                            'text-sm font-medium text-neutral-600 dark:text-neutral-200'),
                  ],
                  href: '/',
                  classes: 'flex items-center gap-2',
                ),
                ShadButton(
                  [_closeIcon()],
                  variant: ButtonVariant.ghost,
                  size: ButtonSize.sm,
                  className: 'rounded-full !p-2 min-h-9 min-w-9',
                  onPressed: _closeMenu,
                ),
              ],
              classes: 'flex items-center justify-between',
            ),
            div(
              [
                _mobileNavLink('Features', '/#features'),
                _mobileNavLink('Services', '/#services'),
                _mobileNavLink('Pricing', '/#pricing'),
                _mobileNavLink('FAQs', '/#faqs'),
              ],
              classes: 'my-10 flex flex-col gap-6',
            ),
          ],
        ),
        div(
          [
            div(
              [
                a(
                  [Component.text('Login')],
                  href: '/login',
                  classes:
                      'text-sm font-medium text-neutral-600 dark:text-neutral-400',
                ),
                ShadButton(
                  [_themeIcon()],
                  variant: ButtonVariant.ghost,
                  size: ButtonSize.sm,
                  className:
                      'rounded-full !p-2 min-h-9 min-w-9 text-neutral-600 dark:text-neutral-400',
                  onPressed: component.onToggleTheme,
                ),
                a(
                  [_githubIcon(), Component.text('GitHub')],
                  href: 'https://github.com/shipflutter/skills',
                  target: Target.blank,
                  attributes: {'rel': 'noopener noreferrer'},
                  classes:
                      'inline-flex h-9 items-center gap-1.5 rounded-md border border-neutral-200 bg-background px-3 text-sm font-medium transition-colors hover:bg-accent hover:text-accent-foreground dark:border-neutral-700 dark:bg-input/30 dark:hover:bg-input/50',
                ),
              ],
              classes: 'flex flex-wrap items-center justify-end gap-4',
            ),
          ],
        ),
      ],
      classes:
          'fixed inset-0 z-[60] flex h-dvh w-screen flex-col justify-between overflow-hidden bg-white px-4 py-1.5 text-foreground dark:bg-black md:hidden',
    );
  }

  Component _mobileNavLink(String label, String href) {
    return a(
      [Component.text(label)],
      href: href,
      classes: 'text-2xl font-medium text-neutral-600 dark:text-neutral-400',
    );
  }

  Component _sidebarIcon() {
    return Component.element(
      tag: 'svg',
      attributes: {
        'xmlns': 'http://www.w3.org/2000/svg',
        'width': '24',
        'height': '24',
        'viewBox': '0 0 24 24',
        'fill': 'none',
        'stroke': 'currentColor',
        'stroke-width': '2',
        'stroke-linecap': 'round',
        'stroke-linejoin': 'round',
        'class': 'size-4',
      },
      children: [
        Component.element(tag: 'path', attributes: {
          'd':
              'M4 4m0 2a2 2 0 0 1 2 -2h12a2 2 0 0 1 2 2v12a2 2 0 0 1 -2 2h-12a2 2 0 0 1 -2 -2z'
        }),
        Component.element(tag: 'path', attributes: {'d': 'M9 4l0 16'}),
      ],
    );
  }

  Component _closeIcon() {
    return Component.element(
      tag: 'svg',
      attributes: {
        'xmlns': 'http://www.w3.org/2000/svg',
        'width': '24',
        'height': '24',
        'viewBox': '0 0 24 24',
        'fill': 'none',
        'stroke': 'currentColor',
        'stroke-width': '2',
        'stroke-linecap': 'round',
        'stroke-linejoin': 'round',
        'class': 'size-5',
      },
      children: [
        Component.element(tag: 'path', attributes: {'d': 'M18 6l-12 12'}),
        Component.element(tag: 'path', attributes: {'d': 'M6 6l12 12'}),
      ],
    );
  }

  Component _themeIcon() {
    return Component.element(
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
      children: component.isDark
          ? [
              Component.element(tag: 'circle', attributes: {
                'cx': '12',
                'cy': '12',
                'r': '4',
              }),
              Component.element(tag: 'path', attributes: {'d': 'M12 2v2'}),
              Component.element(tag: 'path', attributes: {'d': 'M12 20v2'}),
              Component.element(tag: 'path', attributes: {'d': 'M2 12h2'}),
              Component.element(tag: 'path', attributes: {'d': 'M20 12h2'}),
              Component.element(
                  tag: 'path', attributes: {'d': 'm4.93 4.93 1.41 1.41'}),
              Component.element(
                  tag: 'path', attributes: {'d': 'm17.66 17.66 1.41 1.41'}),
              Component.element(
                  tag: 'path', attributes: {'d': 'm6.34 17.66-1.41 1.41'}),
              Component.element(
                  tag: 'path', attributes: {'d': 'm19.07 4.93-1.41 1.41'}),
            ]
          : [
              Component.element(tag: 'path', attributes: {
                'd': 'M12 3a6 6 0 0 0 9 9 9 9 0 1 1-9-9Z',
              }),
            ],
    );
  }

  Component _githubIcon() {
    return Component.element(
      tag: 'svg',
      attributes: {
        'xmlns': 'http://www.w3.org/2000/svg',
        'width': '24',
        'height': '24',
        'viewBox': '0 0 24 24',
        'fill': 'none',
        'stroke': 'currentColor',
        'stroke-width': '2',
        'stroke-linecap': 'round',
        'stroke-linejoin': 'round',
        'class': 'size-4',
      },
      children: [
        Component.element(tag: 'path', attributes: {
          'd':
              'M9 19c-4.3 1.4 -4.3 -2.5 -6 -3m12 5v-3.5c0 -1 .1 -1.4 -.5 -2c2.8 -.3 5.5 -1.4 5.5 -6a4.6 4.6 0 0 0 -1.3 -3.2a4.2 4.2 0 0 0 -.1 -3.2s-1.1 -.3 -3.5 1.3a12.3 12.3 0 0 0 -6.2 0c-2.4 -1.6 -3.5 -1.3 -3.5 -1.3a4.2 4.2 0 0 0 -.1 3.2a4.6 4.6 0 0 0 -1.3 3.2c0 4.6 2.7 5.7 5.5 6c-.6 .6 -.6 1.2 -.5 2v3.5'
        }),
      ],
    );
  }
}
