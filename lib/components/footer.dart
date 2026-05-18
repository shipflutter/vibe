import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

class Footer extends StatelessComponent {
  const Footer({super.key});

  @override
  Component build(BuildContext context) {
    return Component.element(
      tag: 'footer',
      attributes: {'class': 'border-t bg-muted/50 py-12 md:py-24'},
      children: [
        div(
          [
            div(
              [
                div(
                  [
                    a([Component.text('ShipFlutter')],
                        href: '/',
                        classes: 'font-bold text-xl tracking-tighter'),
                    p([
                      Component.text(
                          'Give your AI the tools to build real Flutter apps — one command to install, zero setup required.')
                    ], classes: 'text-sm text-muted-foreground max-w-xs'),
                  ],
                  classes: 'space-y-4 col-span-full lg:col-span-1 mb-8 lg:mb-0',
                ),
                _footerColumn('Product', [
                  {'name': 'Features', 'href': '#features'},
                  {'name': 'Pricing', 'href': '#pricing'},
                  {'name': 'FAQs', 'href': '#faqs'},
                ]),
                _footerColumn('Company', [
                  {
                    'name': 'GitHub',
                    'href': 'https://github.com/shipflutter/skills'
                  },
                  {'name': 'Contact', 'href': 'mailto:wei@signerlabs.com'},
                ]),
                _footerColumn('Social', [
                  {'name': 'X (Twitter)', 'href': 'https://x.com/DevJohnWayne'},
                  {
                    'name': 'Threads',
                    'href': 'https://www.threads.com/@developer_mrz'
                  },
                  {
                    'name': 'GitHub',
                    'href': 'https://github.com/shipflutter/skills'
                  },
                ]),
              ],
              classes: 'grid gap-8 sm:gap-12 grid-cols-2 lg:grid-cols-4 mb-12',
            ),
            div(
              [
                p([Component.text('© 2026 ShipFlutter. All rights reserved.')],
                    classes: 'text-center md:text-left'),
                div(
                  [
                    a([Component.text('Privacy Policy')],
                        href: '/privacy', classes: 'hover:underline'),
                    a([Component.text('Terms of Service')],
                        href: '/terms', classes: 'hover:underline'),
                  ],
                  classes: 'flex gap-6 justify-center md:justify-end',
                ),
              ],
              classes:
                  'flex flex-col md:flex-row justify-between items-center gap-6 pt-12 border-t text-sm text-muted-foreground',
            ),
          ],
          classes: 'container mx-auto px-4 md:px-8',
        ),
      ],
    );
  }

  Component _footerColumn(String title, List<Map<String, String>> links) {
    return div(
      [
        h4([Component.text(title)],
            classes:
                'text-sm font-bold uppercase tracking-wider text-foreground'),
        Component.element(
          tag: 'ul',
          attributes: {'class': 'space-y-2'},
          children: [
            for (var link in links)
              Component.element(tag: 'li', children: [
                a(
                  [Component.text(link['name']!)],
                  href: link['href']!,
                  classes:
                      'text-sm text-muted-foreground hover:text-primary transition-colors',
                ),
              ]),
          ],
        ),
      ],
      classes: 'space-y-4',
    );
  }
}
