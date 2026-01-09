import 'dart:ui';

import 'package:camera_v1/core/l10n/app_localizations.dart';
import 'package:camera_v1/core/theme/app_theme.dart';
import 'package:camera_v1/features/auth/presentation/pages/register_page.dart';
import 'package:camera_v1/features/auth/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // 1. Application-wide Gradient Background
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF0F2027), // Deep Blue/Black
                    Color(0xFF203A43), // Rich Teal/Dark Blue
                    Color(0xFF2C5364), // Lighter Blue-Grey
                  ],
                  // Alternative "Premium Purple" Option:
                  // colors: [
                  //   Color(0xFF2E0249), // Deep Purple
                  //   Color(0xFF570A57), // Rich Magenta
                  //   Color(0xFFA91079), // Vibrant Pink
                  // ],
                ),
              ),
            ),
          ),

          // 2. Ambient Glow Orbs (Optional for extra "pop")
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.purple.withValues(alpha: 0.3),
                backgroundBlendMode: BlendMode.screen,
              ),
            ).blur(blur: 80),
          ),
          Positioned(
            bottom: -50,
            right: -50,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueAccent.withValues(alpha: 0.3),
                backgroundBlendMode: BlendMode.screen,
              ),
            ).blur(blur: 80),
          ),

          // 3. Main Content
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Help Button
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 24.0, bottom: 10),
                        child: TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.help_outline,
                            color: Colors.white70,
                          ),
                          label: Text(
                            AppLocalizations.of(context).translate('help'),
                            style: AppTheme.bodyMedium.copyWith(
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Logo / Shield Icon (Hero Animation)
                    Hero(
                      tag: 'app_logo_shield',
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withValues(alpha: 0.1),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blueAccent.withValues(alpha: 0.2),
                              blurRadius: 20,
                              spreadRadius: 5,
                            ),
                          ],
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.2),
                          ),
                        ),
                        child: const Icon(
                          Icons.security_rounded,
                          size: 48,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Welcome Text
                    Text(
                      AppLocalizations.of(context).translate('welcome'),
                      style: AppTheme.headingLarge.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: isTablet ? 40 : 32,
                        shadows: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.3),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      AppLocalizations.of(context).translate('login_subtitle'),
                      style: AppTheme.bodyMedium.copyWith(
                        color: Colors.white70,
                        fontSize: isTablet ? 16 : 14,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 32),

                    // Glassmorphism Card
                    _GlassCard(
                      width: isTablet
                          ? 500
                          : MediaQuery.of(context).size.width * 0.9,
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          // Custom Tab Selector
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TabBar(
                              controller: _tabController,
                              indicator: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Theme.of(context).colorScheme.primary
                                        .withValues(alpha: 0.4),
                                    blurRadius: 12,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              indicatorSize: TabBarIndicatorSize.tab,
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.white60,
                              labelStyle: AppTheme.bodyLarge.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                              dividerColor: Colors.transparent,
                              tabs: [
                                Tab(
                                  text: AppLocalizations.of(
                                    context,
                                  ).translate('login_tab'),
                                ),
                                Tab(
                                  text: AppLocalizations.of(
                                    context,
                                  ).translate('signup_tab'),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 24),

                          // Form Content
                          SizedBox(
                            height: isTablet
                                ? 550
                                : 500, // Fixed height for tab view
                            child: TabBarView(
                              controller: _tabController,
                              children: const [
                                LoginForm(), // Adjust this widget if needed to accept 'dark' mode props
                                RegisterPage(), // Ensure this has transparent bg
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// Reusable Glass Card Widget
// =============================================================================
class _GlassCard extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;

  const _GlassCard({
    required this.child,
    this.width,
    this.height,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: width,
          height: height,
          padding: padding,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.08), // Frosted white tint
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.12),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 20,
                spreadRadius: 2,
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}

extension BlurExtension on Widget {
  Widget blur({double blur = 10}) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
      child: this,
    );
  }
}
