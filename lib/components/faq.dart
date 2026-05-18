import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:shadcn_jaspr/shadcn_jaspr.dart';

class FAQ extends StatelessComponent {
  const FAQ({super.key});

  @override
  Component build(BuildContext context) {
    final faqs = [
      {
        'q': 'What is ShipFlutter?',
        'a':
            'ShipFlutter is an AI-native Flutter recipe library with production-ready app flows, full-stack modules, and prompts. Install ShipFlutter Skills in one command, and your AI coding assistant instantly knows how to generate production-ready Flutter code.'
      },
      {
        'q': 'Is ShipFlutter free?',
        'a':
            'ShipFlutter has a free tier, a Pro tier, and a Max tier. Free — All free recipes covering animations, charts, UI components, and core modules. Pro (\$89, one-time) — Unlocks premium recipes like StoreKit 2 Subscriptions. Max (\$200/mo) — Plus managed services & hosting.'
      },
      {
        'q': 'How does ShipFlutter work with AI tools?',
        'a':
            'ShipFlutter uses Skills — a format that works with Claude Code, Cursor, Windsurf, and 30+ AI tools. It uses MCP (Model Context Protocol), an open standard backed by Anthropic, Google, and Microsoft.'
      },
      {
        'q': 'Can I use ShipFlutter for learning?',
        'a':
            'Absolutely. ShipFlutter is built with the latest Flutter patterns — animations, adaptive UI, payments, camera flows, charts, and more. Every component is self-contained and well-structured.'
      }
    ];

    return Component.element(
      tag: 'section',
      attributes: {'id': 'faqs', 'class': 'py-24 md:py-36 border-t'},
      children: [
        div(
          [
            h2([Component.text('Frequently Asked Questions')],
                classes:
                    'text-4xl font-extrabold tracking-tight sm:text-5xl lg:text-6xl mb-10 sm:mb-14 text-center'),
            ShadAccordion(
              type: AccordionType.single,
              children: [
                for (var i = 0; i < faqs.length; i++)
                  ShadAccordionItem(
                    value: 'item-$i',
                    className:
                        'mb-4 rounded-2xl border bg-background/80 px-5 sm:px-6 shadow-sm transition-colors dark:border-zinc-800 dark:bg-zinc-950/80 dark:shadow-none',
                    children: [
                      ShadAccordionTrigger([Component.text(faqs[i]['q']!)],
                          className:
                              'py-5 sm:py-6 text-left text-lg sm:text-xl font-semibold hover:no-underline'),
                      ShadAccordionContent([
                        p([Component.text(faqs[i]['a']!)],
                            classes:
                                'pb-6 pr-2 text-base sm:text-lg leading-8 text-muted-foreground'),
                      ]),
                    ],
                  ),
              ],
            ),
          ],
          classes: 'container mx-auto px-4 md:px-8 max-w-5xl',
        ),
      ],
    );
  }
}
