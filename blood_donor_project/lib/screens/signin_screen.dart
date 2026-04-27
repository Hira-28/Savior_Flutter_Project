import 'package:flutter/material.dart';
import 'signup_screen.dart';
import 'home_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  bool _hidePassword = true;
  bool _rememberMe = false;
  bool _loading = false;

  void _signIn() async {
    if (!_formKey.currentState!.validate()) return;
    FocusScope.of(context).unfocus();
    setState(() => _loading = true);
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    setState(() => _loading = false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Signed in successfully!'),
        backgroundColor: Color(0xFFE8304A),
      ),
    );
  }

  void _forgotPassword() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Forgot Password'),
        content: const Text(
          'A password reset link will be sent to your email.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE8304A),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Send', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Back Button ──────────────────────────────────────────
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => Navigator.maybePop(context),
                    child: const Padding(
                      padding: EdgeInsets.all(4),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 20,
                        color: Colors.black87,
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // ── Title ────────────────────────────────────────────────
                  const Text(
                    'Sign In Your Account',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Log in to find and explore blood donors around you.',
                    style: TextStyle(
                      fontSize: 12.5,
                      color: Colors.grey.shade500,
                    ),
                  ),

                  const SizedBox(height: 36),

                  // ── Email Field ──────────────────────────────────────────
                  _buildTextField(
                    controller: _emailCtrl,
                    hint: 'Email Address',
                    prefixIcon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    validator: (v) {
                      if (v == null || v.isEmpty) return 'Enter your email';
                      if (!v.contains('@')) return 'Enter a valid email';
                      return null;
                    },
                  ),

                  const SizedBox(height: 14),

                  // ── Password Field ───────────────────────────────────────
                  _buildTextField(
                    controller: _passwordCtrl,
                    hint: 'Password',
                    prefixIcon: Icons.lock_outline_rounded,
                    obscureText: _hidePassword,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _hidePassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Colors.grey.shade400,
                        size: 20,
                      ),
                      onPressed:(){
                        
                      }
                    ),
                    validator: (v) {
                      if (v == null || v.isEmpty) return 'Enter password';
                      if (v.length < 6) return 'Minimum 6 characters';
                      return null;
                    },
                  ),

                  const SizedBox(height: 14),

                  // ── Remember Me & Forgot Password ────────────────────────
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: Checkbox(
                              value: _rememberMe,
                              onChanged: (v) =>
                                  setState(() => _rememberMe = v ?? false),
                              activeColor: const Color(0xFFE8304A),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Remember Me',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: _forgotPassword,
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Color(0xFFE8304A),
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 28),

                  // ── Sign In Button ───────────────────────────────────────
                  _buildPrimaryButton(
                    label: 'Sign In',
                    onTap: _signIn,
                    loading: _loading,
                  ),

                  const SizedBox(height: 24),

                  // ── OR Divider ───────────────────────────────────────────
                  _buildOrDivider(),

                  const SizedBox(height: 24),

                  // ── Social Buttons ───────────────────────────────────────
                  _buildSocialRow(),

                  const SizedBox(height: 32),

                  // ── Sign Up Link ─────────────────────────────────────────
                  Center(
                    child: GestureDetector(
                      onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const SignUpScreen()),
                      ),
                      child: RichText(
                        text: TextSpan(
                          text: "Don't Have An Account? ",
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 13,
                          ),
                          children: const [
                            TextSpan(
                              text: 'Sign Up',
                              style: TextStyle(
                                color: Color(0xFFE8304A),
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ── Text Field ─────────────────────────────────────────────────────────────
  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData prefixIcon,
    TextInputType? keyboardType,
    bool obscureText = false,
    Widget? suffixIcon,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      style: const TextStyle(fontSize: 14, color: Colors.black87),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
        filled: true,
        fillColor: Colors.grey.shade100,
        prefixIcon: Icon(prefixIcon, color: Colors.grey.shade400, size: 20),
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE8304A), width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
        ),
      ),
    );
  }

  // ── Primary Button ─────────────────────────────────────────────────────────
  Widget _buildPrimaryButton({
    required String label,
    required VoidCallback onTap,
    bool loading = false,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: loading ? null : onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFE8304A),
          disabledBackgroundColor: const Color(0xFFE8304A).withOpacity(0.7),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: loading
            ? const SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2.5,
                ),
              )
            : Text(
                label,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  letterSpacing: 0.3,
                ),
              ),
      ),
    );
  }

  // ── OR Divider ─────────────────────────────────────────────────────────────
  Widget _buildOrDivider() {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey.shade300, thickness: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'Or continue with',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade500,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(child: Divider(color: Colors.grey.shade300, thickness: 1)),
      ],
    );
  }

  // ── Social Row ─────────────────────────────────────────────────────────────
  Widget _buildSocialRow() {
    return Row(
      children: [
        // ── Google Button ──────────────────────────────────────────────────
        Expanded(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              height: 52,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300, width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Google 'G' colored logo
                  SizedBox(
                    width: 22,
                    height: 22,
                    child: CustomPaint(painter: _GoogleLogoPainter()),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Google',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        const SizedBox(width: 12),

        // ── Facebook Button ────────────────────────────────────────────────
        Expanded(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              height: 52,
              decoration: BoxDecoration(
                color: const Color(0xFF1877F2),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF1877F2).withOpacity(0.35),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Facebook 'f' logo
                  Container(
                    width: 22,
                    height: 22,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        'f',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF1877F2),
                          height: 1.15,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Facebook',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ── Google Logo Painter ────────────────────────────────────────────────────
class _GoogleLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final r = size.width / 2;

    const segments = [
      {'color': const Color(0xFF4285F4), 'start': -0.5, 'sweep': 1.0},
      {'color': const Color(0xFF34A853), 'start': 0.5, 'sweep': 1.0},
      {'color': const Color(0xFFFBBC05), 'start': 1.5, 'sweep': 0.5},
      {'color': const Color(0xFFEA4335), 'start': -1.0, 'sweep': 0.5},
    ];

    for (final seg in segments) {
      canvas.drawArc(
        Rect.fromCircle(center: Offset(cx, cy), radius: r),
        (seg['start'] as double) * 3.14159,
        (seg['sweep'] as double) * 3.14159,
        true,
        Paint()
          ..color = seg['color'] as Color
          ..style = PaintingStyle.fill,
      );
    }

    // White inner circle
    canvas.drawCircle(Offset(cx, cy), r * 0.55, Paint()..color = Colors.white);

    // Blue horizontal bar for the 'G'
    canvas.drawLine(
      Offset(cx, cy),
      Offset(cx + r * 0.55, cy),
      Paint()
        ..color = const Color(0xFF4285F4)
        ..strokeWidth = r * 0.28
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke,
    );
  }

  @override
  bool shouldRepaint(_) => false;
}
