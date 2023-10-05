import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../profile/profile.dart';

class EulaWidget extends ConsumerWidget {
  const EulaWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobn Terms'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
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
                            _title(context, _licenseTitle()),
                            _subtitle(context, _licenseSubtitle()),
                            const SizedBox(height: 16.0),
                            _title(context, _restrictionsTitle()),
                            _subtitle(context, _restrictionsSubtitle()),
                            const SizedBox(height: 16.0),
                            _title(context, _abuseTitle()),
                            _subtitle(context, _abuseSubtitle()),
                            const SizedBox(height: 16.0),
                            _title(context, _privacyTitle()),
                            _subtitle(context, _privacySubtitle()),
                            const SizedBox(height: 16.0),
                            _title(context, _openSourceTitle()),
                            _subtitle(context, _openSourceSubtitle()),
                            const SizedBox(height: 16.0),
                            _title(context, _intellectualPropertyTitle()),
                            _subtitle(context, _intellectualPropertySubtitle()),
                            const SizedBox(height: 16.0),
                            _title(context, _disclaimersTitle()),
                            _subtitle(context, _disclaimersSubtitle()),
                            const SizedBox(height: 16.0),
                            _title(context, _miscTitle()),
                            _subtitle(context, _miscSubtitle()),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8.0),
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
            const SizedBox(height: 8.0),
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
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.bold),
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
    const text = 'This End-User License Agreement (EULA) is a legal'
        ' agreement between you (either as an individual or on behalf'
        ' of an entity) and Mobn, Inc. regarding your use of Mobn\''
        ' applications, including Mobn for iOS and Android and'
        ' associated documentation (the "Software"). IF YOU DO'
        ' NOT AGREE TO ALL OF THE TERMS OF THIS EULA, DO NOT USE'
        ' THE SOFTWARE.';

    return text;
  }

  String _summaryTitle() {
    const text = 'Summary';

    return text;
  }

  String _summarySubtitle() {
    const text = 'You must agree to all of the terms of this EULA to'
        ' use this Software.\n\n'
        'If so, you may use the Software for free and for any lawful'
        ' purpose.\n\n'
        'This Software automatically communicates with Supabase'
        ' servers (our Backend-as-a-Service provider): (1) to create'
        ' and manage your user account; (2) to engage with other'
        ' users of the service; and (3) to create and manage content.\n\n'
        'This Software is provided "as-is" with no warranties, and you'
        ' agree that Mobn is not liable for anything you do with it.\n\n'
        'You really ought to just go ahead and read the whole EULA. It\'s'
        ' not all that long. You should not only rely on this summary.';

    return text;
  }

  String _agreementTitle() {
    const text = 'The Agreement';

    return text;
  }

  String _agreementSubtitle() {
    const text = 'By downloading, installing, or using the Software,'
        ' you accept and agree to be bound by the terms of this EULA.'
        ' If you do not agree to all of the terms of this EULA, you'
        ' may not download, install, or use the Software.';

    return text;
  }

  String _licenseTitle() {
    const text = 'The License';

    return text;
  }

  String _licenseSubtitle() {
    const text = 'This EULA entitles you to install as many copies of'
        ' the Software as you want, and use the Software for any lawful'
        ' purpose consistent with this EULA. Your license to use the'
        ' Software is expressly conditioned upon your agreement to all'
        ' of the terms of this EULA. This software is licensed, not'
        ' sold. Mobn reserves all other rights not granted by this EULA.';

    return text;
  }

  String _restrictionsTitle() {
    const text = 'The Restrictions';

    return text;
  }

  String _restrictionsSubtitle() {
    const text = 'You may not share abusive content, harass someone, or'
        ' encourage other people to do so.\n\n'
        'You may not sell, resell, rent, lease or exchange the Software'
        ' for anything of value.\n\n'
        'You may not remove or alter any proprietary notices or marks on'
        ' the Software.';
    return text;
  }

  String _abuseTitle() {
    const text = 'Abuse and Harassment';

    return text;
  }

  String _abuseSubtitle() {
    const text = 'You may not share abusive content, harass someone, or'
        ' encourage other people to do so.\n\n'
        'Encouraging or calling for others to harass an individual'
        ' or group of people: We prohibit behavior that encourages'
        ' others to harass or target specific individuals or groups'
        ' of people with abuse. This includes, but is not limited'
        ' to: calls to target people with abuse or harassment'
        ' online and behavior that urges offline action, such as'
        ' physical harassment.\n\n'
        'Unwanted Sexual Content & Graphic Objectification: While'
        ' some consensual nudity and adult content is permitted on'
        ' Mobn, we prohibit unwanted sexual conduct and graphic'
        ' objectification that sexually objectifies an individual'
        ' without their consent. This includes, but is not limited'
        ' to: (1) sending someone unsolicited, (2) and/or unwanted'
        ' adult media, including images, videos, and GIFs,'
        ' (3) unwanted sexual discussion of someone’s body,'
        ' solicitation of sexual acts, and any other content that'
        ' otherwise sexualizes an individual without their consent.\n\n'
        'Insults: We take action against the use of insults or'
        ' profanity to target others. In some cases, such as (but'
        ' not limited to) severe, repetitive usage of insults or'
        ' profanity where the context is to harass or intimidate'
        ' others, we may require Post removal. In other cases, such'
        ' as (but not limited to) moderate, isolated usage of'
        ' insults and profanity where the context is to harass or'
        ' intimidate others, we may limit Post visibility as further'
        ' described below. Please also note that while some'
        ' individuals may find certain terms to be offensive,'
        ' we will not take action against every instance where'
        ' insulting terms are used.\n\n'
        'Violent Event Denial: We prohibit content that denies that'
        ' mass murder or other mass casualty events took place,'
        ' where we can verify that the event occurred, and when the'
        ' content is shared with abusive context. This may include'
        ' references to such an event as a "hoax" or claims that'
        ' victims or survivors are fake or "actors." It includes,'
        ' but is not limited to, events like the Holocaust, school'
        ' shootings, terrorist attacks, and natural disasters.';

    return text;
  }

  String _privacyTitle() {
    const text = 'Privacy Notices';

    return text;
  }

  String _privacySubtitle() {
    const text = 'The Software automatically communicates with Supabase'
        ' servers for three purposes: (1) to create and manage your user'
        ' account; (2) to engage with other users of the service; and (3)'
        ' to create and manage content. If you would like to learn more'
        ' about the specific information we send, please reach out'
        ' to help@Mobnapp.io.';

    return text;
  }

  String _openSourceTitle() {
    const text = 'Open-Source Notices';

    return text;
  }

  String _openSourceSubtitle() {
    const text = 'Certain components of the Software may be subject to'
        ' open-source software licenses ("Open-Source Components"), which'
        ' means any software license approved as open-source licenses by the'
        ' Open Source Initiative or any substantially similar licenses,'
        ' including without limitation any license that, as a condition of'
        ' distribution of the software licensed under such license, requires'
        ' that the distributor make the software available in source code'
        ' format. The Software documentation includes copies of the'
        ' licenses applicable to the Open-Source Components.\n\n'
        'To the extent there is conflict between the license terms'
        ' covering the Open-Source Components and this EULA, the terms'
        ' of such licenses will apply in lieu of the terms of this EULA.'
        ' To the extent the terms of the licenses applicable to'
        ' Open-Source Components prohibit any of the restrictions in'
        ' this Agreement with respect to such Open-Source Component,'
        ' such restrictions will not apply to such Open-Source Component.'
        ' To the extent the terms of the licenses applicable to Open-Source'
        ' Components require Licensor to make an offer to provide source code'
        ' in connection with the Product, such offer is hereby made, and you'
        ' may exercise it by contacting help@Mobnapp.io.';

    return text;
  }

  String _intellectualPropertyTitle() {
    const text = 'Intellectual Property Notices';

    return text;
  }

  String _intellectualPropertySubtitle() {
    const text = 'The Software and all worldwide copyrights, trade secrets,'
        ' and other intellectual property rights therein are the exclusive'
        ' property of Mobn. Mobn reserves all rights in and to the'
        ' Software not expressly granted to you in this EULA.\n\n'
        'The names Mobn, Habitmates, Habinauts and related Mobn logos'
        ' and/or stylized names are trademarks of Mobn. You agree not to'
        ' display or use these trademarks in any manner without Mobn\''
        ' prior, written permission.';

    return text;
  }

  String _disclaimersTitle() {
    const text = 'Disclaimers and Limitations on Liability';

    return text;
  }

  String _disclaimersSubtitle() {
    const text = 'THE SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, AND NO'
        ' WARRANTY, EITHER EXPRESS OR IMPLIED, IS GIVEN. YOUR USE OF THE'
        ' SOFTWARE IS AT YOUR SOLE RISK. Mobn does not warrant that (i)'
        ' the Software will meet your specific requirements; (ii) the'
        ' Software is fully compatible with any particular platform; (iii)'
        ' your use of the Software will be uninterrupted, timely, secure, or'
        ' error-free; (iv) the results that may be obtained from the use of'
        ' the Software will be accurate or reliable; (v) the quality of any'
        ' products, services, information, or other material purchased or'
        ' obtained by you through the Software will meet your expectations;'
        ' or (vi) any errors in the Software will be corrected.\n\n'
        'YOU EXPRESSLY UNDERSTAND AND AGREE THAT Mobn SHALL NOT BE LIABLE'
        ' FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, CONSEQUENTIAL OR'
        ' EXEMPLARY DAMAGES, INCLUDING BUT NOT LIMITED TO, DAMAGES FOR LOSS'
        ' OF PROFITS, GOODWILL, USE, DATA OR OTHER INTANGIBLE LOSSES'
        ' (EVEN IF Mobn HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH'
        ' DAMAGES) RELATED TO THE SOFTWARE, including, for example: (i) the'
        ' use or the inability to use the Software; (ii) the cost of'
        ' procurement of substitute goods and services resulting from any'
        ' goods, data, information or services purchased or obtained or'
        ' messages received or transactions entered into through or from'
        ' the Software; (iii) unauthorized access to or alteration of your'
        ' transmissions or data; (iv) statements or conduct of any'
        ' third-party on the Software; (v) or any other matter relating to'
        ' the Software.\n\n'
        'Mobn reserves the right at any time and from time to time to'
        ' modify or discontinue, temporarily or permanently, the Software'
        ' (or any part thereof) with or without notice. Mobn shall not'
        ' be liable to you or to any third-party for any modification,'
        ' price change, suspension or discontinuance of the Software.';

    return text;
  }

  String _miscTitle() {
    const text = 'Miscellanea';

    return text;
  }

  String _miscSubtitle() {
    const text = 'The failure of Mobn to exercise or enforce any right or'
        ' provision of this EULA shall not constitute a waiver of'
        ' such right or provision.\n\n'
        'This EULA constitutes the entire agreement between you'
        ' and Mobn and governs your use of the Software,'
        ' superseding any prior agreements between you and Mobn'
        ' (including, but not limited to, any prior versions of the EULA).\n\n'
        'You agree that this EULA and your use of the Software'
        ' are governed under California law and any dispute related'
        ' to the Software must be brought in a tribunal of competent'
        ' jurisdiction located in or near San Francisco, California.\n\n'
        'Please send any questions about this EULA to help@Mobnapp.io.';

    return text;
  }
}
