import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:shadcn_jaspr/shadcn_jaspr.dart';

import '../components/footer.dart';

class AuthPage extends StatelessComponent {
  const AuthPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.primaryAction,
    required this.fields,
    required this.footerText,
    required this.footerAction,
    required this.footerHref,
    this.helper,
    this.legal,
  });

  final String title;
  final String subtitle;
  final String primaryAction;
  final List<AuthField> fields;
  final Component? helper;
  final Component? legal;
  final String footerText;
  final String footerAction;
  final String footerHref;

  @override
  Component build(BuildContext context) {
    return div(
      [
        Component.element(
          tag: 'header',
          attributes: {
            'class':
                'absolute inset-x-0 top-0 z-10 flex h-16 items-center justify-between px-4 sm:px-6 lg:px-8'
          },
          children: [
            a(
              [
                img(
                    src: 'logo.png',
                    alt: 'ShipFlutter logo',
                    classes: 'h-8 w-8 rounded-lg'),
                span([Component.text('ShipFlutter')],
                    classes: 'font-bold text-lg tracking-tighter'),
              ],
              href: '/',
              classes: 'flex items-center gap-2',
            ),
            a([Component.text('Back to home')],
                href: '/',
                classes:
                    'text-sm font-medium text-muted-foreground transition-colors hover:text-foreground'),
          ],
        ),
        main_([
          div(
            [
              div(
                [
                  h1([Component.text(title)],
                      classes:
                          'text-center text-3xl font-bold tracking-tight sm:text-4xl'),
                  p([Component.text(subtitle)],
                      classes:
                          'mt-3 text-center text-sm leading-6 text-muted-foreground sm:text-base'),
                ],
                classes: 'mb-5 sm:mb-8',
              ),
              ShadCard(
                [
                  ShadCardContent(
                    [
                      div(
                        [
                          for (final field in fields)
                            div(
                              [
                                ShadLabel([Component.text(field.label)],
                                    htmlFor: field.id),
                                ShadInput(
                                  id: field.id,
                                  type: field.type,
                                  placeholder: field.placeholder,
                                ),
                              ],
                              classes: 'grid gap-2',
                            ),
                          if (helper != null) helper!,
                          ShadButton(
                            [Component.text(primaryAction)],
                            className:
                                'mt-2 w-full rounded-full bg-black !px-5 !py-3 text-sm font-semibold text-white shadow-lg shadow-zinc-200 hover:bg-zinc-800 dark:bg-white dark:text-black dark:shadow-none dark:hover:bg-zinc-200',
                            onPressed: () {},
                          ),
                          if (legal != null) legal!,
                        ],
                        classes: 'grid gap-4 sm:gap-5',
                      ),
                    ],
                    className: 'p-5 sm:p-8',
                  ),
                ],
                className:
                    'border-zinc-200 bg-white/95 shadow-xl shadow-zinc-200/50 backdrop-blur dark:border-zinc-800 dark:bg-zinc-950/95 dark:shadow-none',
              ),
              p(
                [
                  Component.text('$footerText '),
                  a([Component.text(footerAction)],
                      href: footerHref,
                      classes:
                          'font-semibold text-foreground underline-offset-4 hover:underline'),
                ],
                classes:
                    'mt-4 text-center text-sm text-muted-foreground sm:mt-6',
              ),
            ],
            classes: 'w-full max-w-md px-4',
          ),
        ],
            classes:
                'flex h-dvh items-center justify-center overflow-hidden bg-[radial-gradient(circle_at_top,_rgba(24,24,27,0.08),_transparent_34%),linear-gradient(180deg,_#ffffff_0%,_#fafafa_100%)] px-0 py-16 dark:bg-[radial-gradient(circle_at_top,_rgba(255,255,255,0.12),_transparent_34%),linear-gradient(180deg,_#000000_0%,_#000000_100%)] sm:min-h-screen sm:py-24'),
        div([Footer()], classes: 'hidden sm:block'),
      ],
      classes:
          'relative h-dvh overflow-hidden bg-white text-foreground font-sans selection:bg-primary/20 dark:bg-black sm:min-h-screen sm:h-auto sm:overflow-visible',
    );
  }
}

class AuthField {
  const AuthField({
    required this.id,
    required this.label,
    required this.placeholder,
    this.type,
  });

  final String id;
  final String label;
  final String placeholder;
  final InputType? type;
}

class LoginPage extends StatelessComponent {
  const LoginPage({super.key});

  @override
  Component build(BuildContext context) {
    return AuthPage(
      title: 'Welcome back',
      subtitle: 'Log in to your ShipFlutter account.',
      primaryAction: 'Log in',
      fields: const [
        AuthField(
          id: 'login-email',
          label: 'Email',
          placeholder: 'you@example.com',
          type: InputType.email,
        ),
        AuthField(
          id: 'login-password',
          label: 'Password',
          placeholder: '••••••••',
          type: InputType.password,
        ),
      ],
      helper: div(
        [
          a([Component.text('Forgot password?')],
              href: '/forgot-password',
              classes:
                  'text-sm font-medium text-muted-foreground underline-offset-4 hover:text-foreground hover:underline'),
        ],
        classes: 'flex justify-end',
      ),
      footerText: 'No account yet?',
      footerAction: 'Sign up',
      footerHref: '/signup',
    );
  }
}

class SignupPage extends StatelessComponent {
  const SignupPage({super.key});

  @override
  Component build(BuildContext context) {
    return AuthPage(
      title: 'Create your account',
      subtitle: 'Start building and shipping Flutter apps faster.',
      primaryAction: 'Create account',
      fields: const [
        AuthField(
          id: 'signup-name',
          label: 'Name',
          placeholder: 'Your name',
        ),
        AuthField(
          id: 'signup-email',
          label: 'Email',
          placeholder: 'you@example.com',
          type: InputType.email,
        ),
        AuthField(
          id: 'signup-password',
          label: 'Password',
          placeholder: 'Create a password',
          type: InputType.password,
        ),
      ],
      legal: p(
        [
          Component.text('By creating an account, you agree to the '),
          a([Component.text('Terms')],
              href: '/terms',
              classes: 'font-medium text-foreground hover:underline'),
          Component.text(' and '),
          a([Component.text('Privacy Policy')],
              href: '/privacy',
              classes: 'font-medium text-foreground hover:underline'),
          Component.text('.'),
        ],
        classes: 'text-center text-xs leading-5 text-muted-foreground',
      ),
      footerText: 'Already have an account?',
      footerAction: 'Log in',
      footerHref: '/login',
    );
  }
}

class ForgotPasswordPage extends StatelessComponent {
  const ForgotPasswordPage({super.key});

  @override
  Component build(BuildContext context) {
    return AuthPage(
      title: 'Reset your password',
      subtitle: 'Enter your email and we’ll send reset instructions.',
      primaryAction: 'Send reset link',
      fields: const [
        AuthField(
          id: 'forgot-password-email',
          label: 'Email',
          placeholder: 'you@example.com',
          type: InputType.email,
        ),
      ],
      footerText: 'Remember your password?',
      footerAction: 'Log in',
      footerHref: '/login',
    );
  }
}
