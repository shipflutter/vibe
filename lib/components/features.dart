import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:shadcn_jaspr/shadcn_jaspr.dart';

class Features extends StatelessComponent {
  const Features({super.key});

  @override
  Component build(BuildContext context) {
    return div(
      [
        // Section 1: Describe what you want
        Component.element(
          tag: 'section',
          attributes: {'class': 'py-24 md:py-32 border-b'},
          children: [
            div(
              [
                div(
                  [
                    ShadBadge(
                      [Component.text('AI-Native Flutter')],
                      variant: BadgeVariant.outline,
                      className: 'mb-4 border-primary/20 text-primary',
                    ),
                    h2([
                      Component.text(
                          'Describe what you want.\nWatch AI build it.')
                    ],
                        classes:
                            'text-2xl font-bold tracking-tight sm:text-5xl mb-6'),
                    p([
                      Component.text(
                          'Tell your AI assistant what to build. It searches ShipFlutter recipes, reads the source code, and generates production-ready Flutter — in seconds.')
                    ],
                        classes:
                            'text-base sm:text-lg text-muted-foreground mb-8'),
                    div(
                      [
                        div([
                          for (var i = 0; i < 4; i++)
                            div([
                              img(
                                  src: 'https://i.pravatar.cc/100?u=$i',
                                  alt: 'user')
                            ],
                                classes:
                                    'w-8 h-8 sm:w-10 sm:h-10 rounded-full border-2 border-background bg-muted flex items-center justify-center text-xs font-bold overflow-hidden'),
                        ], classes: 'flex -space-x-2'),
                        p([
                          Component.text('48 recipes available — '),
                          span([Component.text('44 free')],
                              classes: 'text-green-500'),
                        ], classes: 'text-xs sm:text-sm font-medium'),
                      ],
                      classes: 'flex items-center gap-4 mb-8 lg:mb-0',
                    ),
                  ],
                ),
                // Mockup Placeholder
                div(
                  [
                    div([],
                        classes:
                            'absolute inset-0 bg-gradient-to-br from-primary/5 to-transparent'),
                    div([
                      div([],
                          classes:
                              'w-full h-6 sm:h-8 rounded bg-muted animate-pulse'),
                      div([],
                          classes:
                              'w-3/4 h-6 sm:h-8 rounded bg-muted animate-pulse'),
                      div([Component.text('AI Code Generation Mockup')],
                          classes:
                              'w-full flex-1 rounded-lg border border-dashed border-muted-foreground/30 flex items-center justify-center text-xs sm:text-sm text-muted-foreground'),
                    ], classes: 'p-4 sm:p-6 flex flex-col gap-3 sm:gap-4'),
                    div([
                      ShadBadge([Component.text('Live Preview')],
                          variant: BadgeVariant.secondary,
                          className: 'text-[10px] sm:text-xs')
                    ],
                        classes:
                            'absolute bottom-3 right-3 sm:bottom-4 sm:right-4'),
                  ],
                  classes:
                      'relative aspect-video rounded-xl border bg-card shadow-xl sm:shadow-2xl overflow-hidden group dark:border-slate-800 dark:shadow-none',
                ),
              ],
              classes:
                  'container mx-auto px-4 md:px-8 grid gap-12 lg:gap-16 lg:grid-cols-2 items-center',
            ),
          ],
        ),

        // Section 2: Prompt it. Ship it.
        Component.element(
          tag: 'section',
          attributes: {'class': 'py-20 md:py-32 bg-muted/20'},
          children: [
            div(
              [
                h2([Component.text('Prompt it. Ship it.')],
                    classes:
                        'text-2xl font-bold tracking-tight sm:text-5xl mb-6'),
                p([
                  Component.text(
                      'All recipes are ready for ShipFlutter — preview flows, copy prompts, and ship faster.')
                ],
                    classes:
                        'max-w-2xl text-base sm:text-lg text-muted-foreground'),
              ],
              classes:
                  'container mx-auto px-4 md:px-8 flex flex-col items-center text-center mb-12 sm:mb-16',
            ),
            div(
              [
                _featureCard(
                  'Camera & Vision',
                  'Add a camera view with face detection. Use front camera, show landmark overlay in real time.',
                  'camera',
                ),
                _featureCard(
                  'Payments',
                  'Add a subscription paywall. Monthly plan \$8.00/month, annual plan \$48.00/year.',
                  'credit-card',
                ),
                _featureCard(
                  'AI Chat',
                  'Build an AI chat interface. Streaming responses, token by token. Add a thinking indicator.',
                  'message-square',
                ),
                _featureCard(
                  'Auth & Cloud',
                  'Add authentication. Support Apple Sign In and email/password. Use AWS Cognito.',
                  'shield',
                ),
              ],
              classes:
                  'container mx-auto px-4 md:px-8 grid gap-6 sm:gap-8 md:grid-cols-2 lg:grid-cols-4',
            ),
          ],
        ),
      ],
      id: 'features',
    );
  }

  Component _featureCard(String title, String description, String icon) {
    return ShadCard([
      ShadCardHeader([
        ShadCardTitle([Component.text(title)]),
        ShadCardDescription([Component.text(description)]),
      ], className: 'p-5 sm:p-6 pb-3'),
      ShadCardContent([
        div([
          Component.text('Learn more'),
          span([Component.text('→')], classes: 'ml-1')
        ],
            classes:
                'mt-2 flex items-center text-sm font-medium text-primary group-hover:underline')
      ], className: 'px-5 sm:px-6 pb-5 sm:pb-6 pt-0'),
    ],
        className:
            'bg-background hover:border-primary/50 transition-colors group cursor-default h-full rounded-2xl');
  }
}
