import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/footer.dart';

class LegalPage extends StatelessComponent {
  const LegalPage({
    super.key,
    required this.title,
    required this.updated,
    required this.sections,
  });

  final String title;
  final String updated;
  final List<LegalSection> sections;

  @override
  Component build(BuildContext context) {
    return div(
      [
        Component.element(
          tag: 'header',
          attributes: {
            'class':
                'sticky top-0 z-50 w-full border-b border-primary/10 bg-white/90 backdrop-blur supports-[backdrop-filter]:bg-white/75 dark:border-zinc-800 dark:bg-black/90 dark:supports-[backdrop-filter]:bg-black/75'
          },
          children: [
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
                a([Component.text('Back to home')],
                    href: '/',
                    classes:
                        'text-sm font-medium text-muted-foreground hover:text-primary transition-colors'),
              ],
              classes:
                  'container flex h-16 items-center justify-between mx-auto px-4 md:px-8',
            ),
          ],
        ),
        main_([
          section(
            [
              h1([Component.text(title)],
                  classes: 'text-4xl font-bold tracking-tight sm:text-5xl'),
              p([Component.text(updated)],
                  classes: 'mt-4 text-base text-muted-foreground'),
              div(
                [
                  for (final legalSection in sections)
                    section(
                      [
                        h2([Component.text(legalSection.heading)],
                            classes:
                                'text-xl font-semibold tracking-tight text-foreground sm:text-2xl'),
                        for (final paragraph in legalSection.paragraphs)
                          p([Component.text(paragraph)],
                              classes:
                                  'mt-4 text-base leading-7 text-muted-foreground sm:text-[17px] sm:leading-8'),
                      ],
                      classes: 'border-t pt-8 first:border-t-0 first:pt-0',
                    ),
                ],
                classes: 'mt-12 space-y-10',
              ),
            ],
            classes: 'container mx-auto max-w-3xl px-4 py-16 md:px-8 md:py-24',
          ),
        ], classes: 'flex-1 w-full overflow-hidden bg-white dark:bg-black'),
        Footer(),
      ],
      classes:
          'min-h-screen bg-white text-foreground font-sans selection:bg-primary/20 flex flex-col dark:bg-black',
    );
  }
}

class LegalSection {
  const LegalSection(
    this.heading,
    this.paragraphs,
  );

  final String heading;
  final List<String> paragraphs;
}

class PrivacyPage extends StatelessComponent {
  const PrivacyPage({super.key});

  @override
  Component build(BuildContext context) {
    return const LegalPage(
      title: 'Privacy Policy',
      updated: 'Last updated May 18, 2026',
      sections: [
        LegalSection('Information we collect', [
          'ShipFlutter may collect account details, contact information, usage events, and technical data needed to operate the product, improve recipes, and support customers.',
          'We do not sell personal information. Data is used to provide the service, communicate with you, prevent abuse, and understand product performance.',
        ]),
        LegalSection('How we use information', [
          'We use information to deliver ShipFlutter skills, process purchases, respond to support requests, and improve product quality.',
          'Aggregated or anonymized usage data may be used for analytics, roadmap planning, and service reliability.',
        ]),
        LegalSection('Third-party services', [
          'ShipFlutter may rely on trusted providers for hosting, payments, analytics, email, and customer support. These providers process information only as needed to support the service.',
        ]),
        LegalSection('Your choices', [
          'You can contact us to request access, correction, or deletion of personal information where legally required.',
          'You can also unsubscribe from non-essential communications at any time.',
        ]),
        LegalSection('Contact', [
          'For privacy questions, contact ShipFlutter at wei@signerlabs.com.',
        ]),
      ],
    );
  }
}

class TermsPage extends StatelessComponent {
  const TermsPage({super.key});

  @override
  Component build(BuildContext context) {
    return const LegalPage(
      title: 'Terms of Service',
      updated: 'Last updated February 15, 2026',
      sections: [
        LegalSection('Introduction', [
          'These Terms of Service apply to your use of the ShipFlutter website, showcase app, and open-source component library. By using ShipFlutter, you agree to these terms. If you do not agree, do not use the service.',
        ]),
        LegalSection('1. License', [
          'ShipFlutter is a free open-source project made available under the MIT License. You may use, copy, modify, publish, distribute, sublicense, and sell copies of the software as long as you follow the MIT License conditions.',
        ]),
        LegalSection('2. Use of the Service', [
          'You may use ShipFlutter for lawful purposes, including browsing documentation, downloading components, using them in your projects, modifying and redistributing them under the MIT License, and previewing components in the showcase app.',
          'You agree not to misuse the service, disrupt availability, or use ShipFlutter in a way that violates laws or third-party rights.',
        ]),
        LegalSection('3. Disclaimer of Warranties', [
          'ShipFlutter is provided "as is" and "as available" without warranties of any kind. We do not guarantee merchantability, fitness for a particular purpose, non-infringement, accuracy, completeness, security, or suitability for any specific use.',
        ]),
        LegalSection('4. Limitation of Liability', [
          'To the fullest extent permitted by law, ShipFlutter is not liable for indirect, incidental, special, consequential, or punitive damages, including lost profits, lost revenue, or damages related to your use of or inability to use the service.',
          'This includes damages related to bugs, inaccuracies, unauthorized access to data, service interruptions, or third-party conduct.',
        ]),
        LegalSection('5. Intellectual Property', [
          'The ShipFlutter component library is MIT-licensed. The ShipFlutter name, logo, branding, website design, and related materials belong to ShipFlutter and may not be used without written permission.',
        ]),
        LegalSection('6. User Accounts', [
          'Some features may require an account. You are responsible for protecting your credentials and for all activity under your account.',
        ]),
        LegalSection('7. Modifications to the Service', [
          'We may change, suspend, or discontinue any part of ShipFlutter at any time without notice. We are not liable for changes, suspension, or discontinuation of the service.',
        ]),
        LegalSection('8. Changes to These Terms', [
          'We may update these terms from time to time. Updates will be posted on this page with a revised date. Continued use of ShipFlutter after changes means you accept the updated terms.',
        ]),
        LegalSection('9. Governing Law', [
          'These terms are governed by the laws of Delaware, USA, excluding conflict-of-law rules.',
        ]),
        LegalSection('10. Contact Us', [
          'Questions about these terms can be sent to fighttech.vn@gmail.com.',
          // 'Address:VietNam.',
        ]),
      ],
    );
  }
}
