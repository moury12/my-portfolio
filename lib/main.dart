import 'package:flutter/material.dart';

// --- Placeholder for External Functionality ---
// In a real Flutter app (outside this sandbox environment), you would use
// the 'url_launcher' package to open these links and schemes.
Future<void> _launchUrl(String url) async {
  // In the Canvas environment, we use a simple print to simulate the action.
  // In a real app:
  // final uri = Uri.parse(url);
  // if (!await launchUrl(uri)) {
  //   throw 'Could not launch $url';
  // }
  print('Attempting to launch URL: $url');
}

// --- Data Model for Portfolio Content ---

class Project {
  final String title;
  final String description;
  final List<String> technologies;

  Project(this.title, this.description, this.technologies);
}

class Experience {
  final String title;
  final String company;
  final String duration;
  final List<String> responsibilities;

  Experience(this.title, this.company, this.duration, this.responsibilities);
}

class Education {
  final String degree;
  final String institution;
  final String duration;
  final String result;

  Education(this.degree, this.institution, this.duration, this.result);
}

// --- Placeholder Data based on CV content ---

const String userEmail = 'tanzibamouri00@gmail.com';
const String userPhone = '+8801716773054';
const String userGithubUrl = 'https://github.com/sadia-azad-placeholder'; // Placeholder, UPDATE THIS

final List<String> technicalSkills = [
  'Dart', 'Flutter', 'Bloc', 'GetX', 'Provider',
  'Dio', 'HTTP', 'REST API', 'Socket.IO', 'GraphQL',
  'Google Play Console', 'Apple App Store', 'C', 'C++', 'Python'
];

final List<Project> projects = [
  Project(
    'DUDU Car (Ride Sharing APP)',
    'A full-featured ride-sharing application. Implemented real-time tracking, chat, and payment gateway integration (Fiuu). Handled complex features like Google Places API for geofencing and Socket.IO for real-time trip events.',
    ['Flutter', 'Google Map', 'Socket.IO', 'Push Notification', 'Fiuu Payment'],
  ),
  Project(
    'My Tracks (Booking and Hosting APP)',
    'A location-based booking platform supporting two roles: Host (track management, event creation, Stripe promotion) and User (discovery, booking via Stripe, social sharing, reviews). Utilized Deep links for sharing.',
    ['Flutter', 'Google Map', 'Deep Link', 'Stripe'],
  ),
  Project(
    'Bazarya (Multi-vendor App)',
    'A multi-vendor e-commerce application featuring product browsing and seamless seller interaction. Integrated monthly/yearly subscriptions via RevenueCat and implemented real-time chat with sellers using Socket.IO.',
    ['Flutter', 'Socket.IO', 'In App Purchase', 'RevenueCat'],
  ),
];

final List<Experience> professionalExperience = [
  Experience(
    'Mobile Application Developer',
    'bdCalling IT Ltd, Dhaka, Bangladesh',
    'December 2024 - Present',
    [
      'Experienced in app deployment to Google Play Console, Apple App Store, and Huawei App Gallery.',
      'Implemented real-time features using socket events (emit/listener).',
      'Applied Bloc and GetX for scalable state management and clean architecture.',
      'Involved in requirement analysis and collaborated with foreign clients.',
    ],
  ),
  Experience(
    'Mobile Application Developer',
    'Wizard Software & Technology Bangladesh Ltd. | Eon Systems',
    'September 2023 - December 2024 (9 months)',
    [
      'Built and maintained Flutter apps with complex Figma designs, responsive UI, and animations.',
      'Integrated REST APIs using http/dio with caching, loading states, and error handling.',
      'Contributed to the full application lifecycle from development to maintenance.',
    ],
  ),
];

final List<Education> education = [
  Education(
    'B.SC in Computer Science and Engineering',
    'Daffodil International University',
    '2019-2023',
    'CGPA: 3.58',
  ),
  Education(
    'Higher Secondary Certificate',
    'Monipur High School And College',
    '2017-2019',
    'CGPA: 4.08',
  ),
];

// --- Main App Setup ---

void main() {
  runApp(const SadiaPortfolioApp());
}

class SadiaPortfolioApp extends StatelessWidget {
  const SadiaPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sadia Bennthe Azad - Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Color(0xFF1E3A8A)), // Deep Blue
          headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF1E3A8A)),
          titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Color(0xFF1E3A8A)),
          bodyLarge: TextStyle(fontSize: 16, color: Color(0xFF374151)), // Dark Gray
          bodyMedium: TextStyle(fontSize: 14, color: Color(0xFF6B7280)), // Medium Gray
        ),
      ),
      home: ResponsivePortfolio(),
    );
  }
}

// --- Responsive & Scroll Logic ---

const double desktopBreakpoint = 800.0;

class ResponsivePortfolio extends StatefulWidget {
  const ResponsivePortfolio({super.key});

  @override
  State<ResponsivePortfolio> createState() => _ResponsivePortfolioState();
}

class _ResponsivePortfolioState extends State<ResponsivePortfolio> {
  final ScrollController _scrollController = ScrollController();
  // Global Keys for navigation
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
        alignment: 0.0, // Scroll to the top edge of the section
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder( // We now wrap the Scaffold in the LayoutBuilder
      builder: (context, constraints) {
        bool isDesktop = constraints.maxWidth >= desktopBreakpoint; // isDesktop is defined here

        return Scaffold( // Scaffold is now inside the builder's scope
          body: CustomScrollView(
            controller: _scrollController,
            slivers: [
              _buildCustomAppBar(isDesktop),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    // Sections
                    HeroSection(key: _homeKey, isDesktop: isDesktop),
                    const Divider(height: 40),
                    SkillsSection(key: _skillsKey, isDesktop: isDesktop),
                    const Divider(height: 40),
                    ProjectsSection(key: _projectsKey, isDesktop: isDesktop),
                    const Divider(height: 40),
                    ExperienceSection(key: _experienceKey, isDesktop: isDesktop),
                    const Divider(height: 40),
                    EducationSection(isDesktop: isDesktop), // No dedicated scroll target needed for education
                    FooterSection(key: _contactKey),
                  ],
                ),
              ),
            ],
          ),
          drawer: !isDesktop ? _buildDrawer() : null, // isDesktop is now accessible here
        );
      },
    );
  }

  SliverAppBar _buildCustomAppBar(bool isDesktop) {
    return SliverAppBar(
      title: const Text(
        'S. Azad',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
      backgroundColor: const Color(0xFF1E3A8A), // Deep Blue AppBar
      pinned: true,
      centerTitle: false,
      actions: isDesktop
          ? [
        _AppBarLink(text: 'Home', onTap: () => _scrollToSection(_homeKey)),
        _AppBarLink(text: 'Skills', onTap: () => _scrollToSection(_skillsKey)),
        _AppBarLink(text: 'Projects', onTap: () => _scrollToSection(_projectsKey)),
        _AppBarLink(text: 'Experience', onTap: () => _scrollToSection(_experienceKey)),
        _AppBarLink(text: 'Contact', onTap: () => _scrollToSection(_contactKey)),
        const SizedBox(width: 20),
      ]
          : null,
      automaticallyImplyLeading: !isDesktop,
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(color: Color(0xFF1E3A8A)),
            child: Text(
              'Sadia Portfolio',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
            ),
          ),
          ListTile(title: const Text('Home'), onTap: () => _scrollToSection(_homeKey)),
          ListTile(title: const Text('Skills'), onTap: () => _scrollToSection(_skillsKey)),
          ListTile(title: const Text('Projects'), onTap: () => _scrollToSection(_projectsKey)),
          ListTile(title: const Text('Experience'), onTap: () => _scrollToSection(_experienceKey)),
          ListTile(title: const Text('Contact'), onTap: () => _scrollToSection(_contactKey)),
        ],
      ),
    );
  }
}

class _AppBarLink extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const _AppBarLink({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      ),
    );
  }
}

// --- Reusable Section Widgets ---

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}

// --- 1. Hero Section ---

class HeroSection extends StatelessWidget {
  final bool isDesktop;
  const HeroSection({super.key, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    final double padding = isDesktop ? 64.0 : 32.0;
    final Alignment alignment = isDesktop ? Alignment.centerLeft : Alignment.center;

    return Container(
      padding: EdgeInsets.all(padding),
      color: const Color(0xFFF3F4F6), // Light gray background
      child: Align(
        alignment: alignment,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
            children: [
              Text(
                'SADIA BENNTHE AZAD',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: isDesktop ? 60 : 40,
                  color: const Color(0xFF10B981), // Green highlight
                ),
                textAlign: isDesktop ? TextAlign.left : TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Mobile Application Developer (Flutter)',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: isDesktop ? 30 : 22,
                  color: const Color(0xFF1E3A8A),
                ),
                textAlign: isDesktop ? TextAlign.left : TextAlign.center,
              ),
              const SizedBox(height: 24),
              Text(
                'Experienced Flutter developer specialized in robust, real-time applications. Proficient in Bloc/GetX for scalable state management, and adept at full-cycle development, from complex UI implementation (Figma) to multi-platform deployment (Google Play, App Store, Huawei App Gallery).',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 18),
                textAlign: isDesktop ? TextAlign.left : TextAlign.center,
              ),
              const SizedBox(height: 32),
              _buildContactButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactButtons(BuildContext context) {
    final List<Widget> buttons = [
      ElevatedButton.icon(
        onPressed: () => _launchUrl('mailto:$userEmail'),
        icon: const Icon(Icons.email, color: Colors.white),
        label: const Text('Email Me', style: TextStyle(color: Colors.white)),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1E3A8A),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      OutlinedButton.icon(
        onPressed: () => _launchUrl(userGithubUrl),
        icon: const Icon(Icons.code, color: Color(0xFF1E3A8A)),
        label: const Text('View GitHub', style: TextStyle(color: Color(0xFF1E3A8A))),
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Color(0xFF1E3A8A), width: 2),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    ];

    return isDesktop
        ? Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        buttons[0],
        const SizedBox(width: 16),
        buttons[1],
      ],
    )
        : Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        buttons[0],
        const SizedBox(height: 16),
        buttons[1],
      ],
    );
  }
}

// --- 2. Skills Section ---

class SkillsSection extends StatelessWidget {
  final bool isDesktop;
  const SkillsSection({super.key, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(isDesktop ? 64.0 : 32.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(title: 'Technical Skills'),
            Wrap(
              spacing: 12.0,
              runSpacing: 12.0,
              children: technicalSkills.map((skill) => _SkillChip(skill: skill)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String skill;
  const _SkillChip({required this.skill});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        skill,
        style: const TextStyle(color: Color(0xFF1E3A8A), fontWeight: FontWeight.bold),
      ),
      backgroundColor: const Color(0xFFDBEAFE), // Light Blue
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: Color(0xFF93C5FD)),
      ),
    );
  }
}

// --- 3. Projects Section ---

class ProjectsSection extends StatelessWidget {
  final bool isDesktop;
  const ProjectsSection({super.key, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(isDesktop ? 64.0 : 32.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(title: 'Featured Projects'),
            if (isDesktop)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: projects.map((p) => Expanded(child: _ProjectCard(project: p))).toList(),
              )
            else
              Column(
                children: projects.map((p) => _ProjectCard(project: p)).toList(),
              ),
          ],
        ),
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final Project project;
  const _ProjectCard({required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: const EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              project.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            Text(
              project.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Text(
              'Tech Stack:',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: project.technologies.map((tech) => _TechTag(tech: tech)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _TechTag extends StatelessWidget {
  final String tech;
  const _TechTag({required this.tech});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFFEE2E2), // Light Red
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: const Color(0xFFFCA5A5)),
      ),
      child: Text(
        tech,
        style: const TextStyle(color: Color(0xFF991B1B), fontSize: 12, fontWeight: FontWeight.w500),
      ),
    );
  }
}

// --- 4. Experience Section ---

class ExperienceSection extends StatelessWidget {
  final bool isDesktop;
  const ExperienceSection({super.key, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(isDesktop ? 64.0 : 32.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(title: 'Professional Experience'),
            Column(
              children: professionalExperience.map((exp) => _ExperienceTile(experience: exp)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExperienceTile extends StatelessWidget {
  final Experience experience;
  const _ExperienceTile({required this.experience});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  experience.title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(color: const Color(0xFF1E3A8A)),
                ),
              ),
              Text(
                experience.duration,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            experience.company,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 12),
          ...experience.responsibilities
              .map((res) => Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('• ', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF10B981))),
                Expanded(
                  child: Text(
                    res,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ))
              .toList(),
        ],
      ),
    );
  }
}

// --- 5. Education Section ---

class EducationSection extends StatelessWidget {
  final bool isDesktop;
  const EducationSection({super.key, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(isDesktop ? 64.0 : 32.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(title: 'Education'),
            ...education.map((edu) => _EducationTile(education: edu)).toList(),
          ],
        ),
      ),
    );
  }
}

class _EducationTile extends StatelessWidget {
  final Education education;
  const _EducationTile({required this.education});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  education.degree,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(color: const Color(0xFF1E3A8A)),
                ),
              ),
              Text(
                education.duration,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            education.institution,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 4),
          Text(
            education.result,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}

// --- 6. Footer/Contact Section ---

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40.0),
      color: const Color(0xFF1E3A8A), // Deep Blue Footer
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Get in Touch',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 20),
          _ContactDetail(
            icon: Icons.email,
            text: userEmail,
            onTap: () => _launchUrl('mailto:$userEmail'),
          ),
          _ContactDetail(
            icon: Icons.phone,
            text: userPhone,
            onTap: () => _launchUrl('tel:$userPhone'),
          ),
          const _ContactDetail(
            icon: Icons.location_pin,
            text: 'Dhaka, Bangladesh',
            onTap: null, // Location is not a clickable link
          ),
          const SizedBox(height: 20),
          const Text(
            '© 2025 Sadia Bennthe Azad. Built with Flutter.',
            style: TextStyle(color: Color(0xFFA5B4FC), fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _ContactDetail extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onTap;

  const _ContactDetail({required this.icon, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    Widget content = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white, size: 24),
        const SizedBox(width: 12),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white, decoration: onTap != null ? TextDecoration.underline : null),
        ),
      ],
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: onTap != null
          ? InkWell(
        onTap: onTap,
        child: content,
      )
          : content,
    );
  }
}
