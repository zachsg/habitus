import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../profile/profile.dart';

class EulaWidget extends ConsumerWidget {
  const EulaWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Habitus Terms'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Scrollbar(
                thumbVisibility: true,
                trackVisibility: true,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        _title(context, _eulaTitle()),
                        _subtitle(context, _eulaSubtitle()),
                        const SizedBox(height: 16.0),
                        _title(context, _summaryTitle()),
                        _subtitle(context, _summarySubtitle()),
                        const SizedBox(height: 16.0),
                        _title(context, _agreementTitle()),
                        _subtitle(context, _agreementSubtitle()),
                        const SizedBox(height: 16.0),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton(
                  onPressed: ref.read(profileProvider.notifier).acceptTerms,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text('Agree'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

  Widget _title(BuildContext context, String title) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }

  Text _subtitle(BuildContext context, String subtitle) {
    return Text(subtitle);
  }

  String _eulaTitle() {
    const text = 'End-User License Agreement';

    return text;
  }

  String _eulaSubtitle() {
    const text = 'This End-User License Agreement (EULA) is a legal agreement'
        ' between you (either as an individual or on behalf of an entity)'
        ' and GitHub, Inc. regarding your use of GitHub\'s desktop'
        ' applications, including GitHub DesktopTM for Mac and Windows'
        ' and associated documentation (the "Software").'
        ' IF YOU DO NOT AGREE TO ALL OF THE TERMS OF THIS EULA,'
        ' DO NOT INSTALL, USE OR COPY THE SOFTWARE.';

    return text;
  }

  String _summaryTitle() {
    const text = 'Summary';

    return text;
  }

  String _summarySubtitle() {
    const text = 'You must agree to all of the terms of this EULA to use'
        ' this Software.\n'
        ' If so, you may use the Software for free and for'
        ' any lawful purpose.'
        'This Software automatically communicates with GitHub servers'
        ' for three reasons: (1) to receive and install updates;'
        ' (2) to send error reports; and (3) to send anonymized'
        ' usage information. You can view sample data to see what'
        ' information is sent, and you may opt out of sending the'
        ' anonymized usage data.\n'
        'This Software is provided "as-is" with no warranties,'
        ' and you agree that GitHub is not liable for anything'
        ' you do with it.\n'
        'You really ought to just go ahead and read the'
        ' whole EULA. It\'s not all that long.'
        ' You should not only rely on this summary.\n';

    return text;
  }

  String _agreementTitle() {
    const text = 'The Agreement';

    return text;
  }

  String _agreementSubtitle() {
    const text = 'By downloading, installing, using, or copying the Software,'
        ' you accept and agree to be bound by the terms of this EULA.'
        ' If you do not agree to all of the terms of this EULA, you may not'
        ' download, install, use or copy the Software.';

    return text;
  }
}
