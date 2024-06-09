import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:square_repos/Features/home/data/models/reprository_model/reprository_model.dart';
import 'package:url_launcher/url_launcher.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  void Function(String)? onSubmit,
  void Function(String)? onChanged,
  required String? Function(String?)? validate,
  required String label,
  required IconData prefix,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmit,
      onChanged: onChanged,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        border: const OutlineInputBorder(),
      ),
    );

Widget buildRepoItem(context, ReprositoryModel model) => InkWell(
      onLongPress: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Choose an option'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  launchURL(model.htmlUrl!);
                },
                child: const Text('Go to Repository'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  launchURL(model.owner!.htmlUrl!);
                },
                child: const Text('Go to Owner'),
              ),
            ],
          ),
        );
      },
      child: Container(
        color: getItemColor(model),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text('Name:'),
                const SizedBox(
                  width: 5,
                ),
                Text(model.name ?? 'no name'),
              ],
            ),
            Row(
              children: [
                const Text('Description:'),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Text(
                    model.description ?? 'no description',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text('Owner:'),
                const SizedBox(
                  width: 5,
                ),
                Text(model.owner?.login ?? 'no owner'),
              ],
            ),
          ],
        ),
      ),
    );
Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );
Widget reposBuilder({required List<ReprositoryModel> repos}) =>
    ConditionalBuilder(
      condition: repos.isNotEmpty,
      builder: (context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildRepoItem(context, repos[index]),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: repos.length,
      ),
      fallback: (context) => const Center(child: CircularProgressIndicator()),
    );

Color? getItemColor(ReprositoryModel model) {
  if (model.fork == false || model.fork == null) {
    return Colors.lightGreen;
  } else {
    return Colors.white;
  }
}

Future<void> launchURL(String urlString) async {
  final Uri parsedUrl = Uri.parse(urlString);
  if (await canLaunchUrl(parsedUrl)) {
    await launchUrl(parsedUrl);
  } else {
    throw 'Could not launch $urlString';
  }
}
