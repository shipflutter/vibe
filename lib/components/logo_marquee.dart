import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

class LogoMarquee extends StatelessComponent {
  const LogoMarquee({super.key});

  @override
  Component build(BuildContext context) {
    final tools = [
      'Claude Code',
      'ChatGPT',
      'Gemini',
      'Cursor',
      'Windsurf',
      'GitHub Copilot',
      'DeepSeek',
      'Qwen',
      'Kimi',
      'Xcode'
    ];

    return Component.element(
      tag: 'section',
      attributes: {'class': 'py-12 border-y bg-muted/30 overflow-hidden'},
      children: [
        div(
          [
            p([Component.text('Works with your favorite AI tools')],
                classes:
                    'text-center text-sm font-medium text-muted-foreground mb-8 uppercase tracking-widest'),
            div(
              [
                for (var tool in tools)
                  div(
                    [
                      // Small dot for bullet-like feel or logo placeholder
                      div([],
                          classes: 'w-1.5 h-1.5 rounded-full bg-primary/50'),
                      Component.text(tool),
                    ],
                    classes:
                        'flex items-center gap-1.5 font-semibold text-sm sm:text-lg',
                  ),
              ],
              classes:
                  'flex flex-wrap items-center justify-center gap-x-6 gap-y-6 sm:gap-x-12 sm:gap-y-8 opacity-70 grayscale hover:grayscale-0 transition-all duration-500',
            ),
          ],
          classes: 'container mx-auto px-4 md:px-8',
        ),
      ],
    );
  }
}
