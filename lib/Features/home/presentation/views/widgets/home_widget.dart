import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

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

Widget buildRepoItem() => InkWell(
      onLongPress: () {},
      child: Container(
        color: Colors.lightGreen,
        padding: const EdgeInsets.all(20.0),
        child: const Column(
          children: [
            Row(
              children: [
                Text('Name:'),
                SizedBox(
                  width: 5,
                ),
                Text('name'),
              ],
            ),
            Row(
              children: [
                Text('Description:'),
                SizedBox(
                  width: 5,
                ),
                Text('description'),
              ],
            ),
            Row(
              children: [
                Text('Owner:'),
                SizedBox(
                  width: 5,
                ),
                Text('owner'),
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
Widget repoBuilder() => ConditionalBuilder(
      condition: true,
      builder: (context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildRepoItem(),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: 10,
      ),
      fallback: (context) => const Center(child: CircularProgressIndicator()),
    );
