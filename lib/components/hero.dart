import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:shadcn_jaspr/shadcn_jaspr.dart';

class Hero extends StatelessComponent {
  const Hero({super.key});

  @override
  Component build(BuildContext context) {
    return Component.element(
      tag: 'section',
      attributes: {
        'class':
            'relative overflow-hidden pt-14 pb-14 sm:pt-20 sm:pb-16 md:pt-28 md:pb-24'
      },
      children: [
        // Background effects
        div(
          [
            div([],
                classes:
                    'absolute left-1/2 top-0 h-[800px] w-[800px] -translate-x-1/2 -translate-y-1/2 [background:radial-gradient(50%_50%_at_50%_50%,rgba(120,119,198,0.1)_0,rgba(120,119,198,0)_100%)]'),
          ],
          classes: 'absolute inset-0 -z-10',
        ),
        div(
          [
            ShadBadge(
              [Component.text('One command. Works everywhere.')],
              variant: BadgeVariant.secondary,
              className:
                  'mb-5 sm:mb-6 px-3 py-1 rounded-full bg-blue-50 text-blue-700 border border-blue-100 dark:bg-blue-950/40 dark:text-blue-300 dark:border-blue-900 text-[10px] sm:text-xs font-semibold tracking-wider uppercase',
            ),
            h1(
              [
                span([Component.text('Agent builds.')], classes: 'block'),
                span([Component.text('You ship.')],
                    classes:
                        'bg-gradient-to-r from-blue-600 via-sky-500 to-cyan-400 bg-clip-text text-transparent'),
              ],
              classes:
                  'max-w-4xl text-4xl font-extrabold tracking-tight sm:text-6xl lg:text-7xl mb-5 sm:mb-6 leading-[1.05]',
            ),
            p(
              [
                Component.text(
                    'One command installs production-ready Flutter skills for Claude Code, Cursor, Copilot, Gemini, and 30+ AI tools.'),
              ],
              classes:
                  'max-w-2xl text-base sm:text-lg md:text-xl text-muted-foreground mb-8 sm:mb-10 px-1',
            ),

            // CLI Command Box
            div(
              [
                div(
                  [
                    Component.element(tag: 'code', attributes: {
                      'class': 'text-primary truncate mr-2'
                    }, children: [
                      Component.text('npx skills add shipflutter/skills')
                    ]),
                    ShadButton(
                      [
                        Component.element(
                          tag: 'svg',
                          attributes: {
                            'xmlns': 'http://www.w3.org/2000/svg',
                            'width': '16',
                            'height': '16',
                            'viewBox': '0 0 24 24',
                            'fill': 'none',
                            'stroke': 'currentColor',
                            'stroke-width': '2',
                            'stroke-linecap': 'round',
                            'stroke-linejoin': 'round',
                          },
                          children: [
                            Component.element(tag: 'rect', attributes: {
                              'width': '14',
                              'height': '14',
                              'x': '8',
                              'y': '8',
                              'rx': '2',
                              'ry': '2'
                            }),
                            Component.element(tag: 'path', attributes: {
                              'd':
                                  'M4 16c-1.1 0-2-.9-2-2V4c0-1.1.9-2 2-2h10c1.1 0 2 .9 2 2'
                            }),
                          ],
                        ),
                      ],
                      variant: ButtonVariant.ghost,
                      size: ButtonSize.sm,
                      className:
                          'h-8 w-8 p-0 opacity-50 hover:opacity-100 transition-opacity shrink-0',
                      onPressed: () {},
                    ),
                  ],
                  classes:
                      'flex items-center justify-between rounded-xl border border-blue-100 bg-white p-3 sm:p-4 font-mono text-[11px] sm:text-sm shadow-lg shadow-blue-100/60 backdrop-blur overflow-hidden dark:border-slate-800 dark:bg-slate-900/80 dark:shadow-none',
                ),
                div([
                  Component.text(
                      'Works with Claude Code, Cursor, Copilot, Gemini, and 30+ more AI tools.')
                ],
                    classes:
                        'mt-3 text-[10px] sm:text-xs text-muted-foreground px-2'),
              ],
              classes: 'relative w-full max-w-lg mb-10 group px-4 sm:px-0',
            ),

            div(
              [
                ShadButton(
                  [Component.text('Get Started Free')],
                  size: ButtonSize.lg,
                  className:
                      'w-full sm:w-auto rounded-full !px-7 !py-3.5 min-h-12 text-base bg-blue-600 hover:bg-blue-700 text-white shadow-lg shadow-blue-200 dark:shadow-none',
                  onPressed: () {},
                ),
                ShadButton(
                  [Component.text('View on App Store')],
                  variant: ButtonVariant.outline,
                  size: ButtonSize.lg,
                  className:
                      'w-full sm:w-auto rounded-full !px-7 !py-3.5 min-h-12 text-base border-blue-200 bg-white hover:bg-blue-50 dark:border-slate-700 dark:bg-slate-900 dark:hover:bg-slate-800',
                  onPressed: () {},
                ),
              ],
              classes:
                  'flex flex-col sm:flex-row items-center justify-center gap-4 w-full px-4 sm:px-0',
            ),
          ],
          classes:
              'container mx-auto px-4 md:px-8 flex flex-col items-center text-center',
        ),
      ],
    );
  }
}
