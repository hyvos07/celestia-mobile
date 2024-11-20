import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:celestia_mobile/core/constants/endpoints.dart';
import 'package:celestia_mobile/core/themes/_themes.dart';
import 'package:celestia_mobile/features/main/presentation/pages/_pages.dart';
import 'package:celestia_mobile/features/main/presentation/widgets/_widgets.dart';
import 'package:celestia_mobile/features/product/data/models/product_model.dart';
import 'package:celestia_mobile/features/product/presentation/widgets/_widgets.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

part 'add_product.dart';
part 'all_product.dart';
