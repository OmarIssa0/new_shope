import 'package:new_shope/core/utils/app_image.dart';

import 'model_category.dart';

class CategoriesList {
  static List<CategoryModel> categoryList = [
    CategoryModel(
      id: MangerImage.kWatchCategories,
      image: MangerImage.kWatchCategories,
      name: 'Watch',
    ),
    CategoryModel(
      id: MangerImage.kShoesCategories,
      image: MangerImage.kShoesCategories,
      name: 'Shoes',
    ),
    CategoryModel(
      id: MangerImage.kPcCategories,
      image: MangerImage.kPcCategories,
      name: 'Pc',
    ),
    CategoryModel(
      id: MangerImage.kFashionCategories,
      image: MangerImage.kFashionCategories,
      name: 'Fashion',
    ),
    CategoryModel(
      id: MangerImage.kElectronCategories,
      image: MangerImage.kElectronCategories,
      name: 'Electron',
    ),
    CategoryModel(
      id: MangerImage.kCosmeticCategories,
      image: MangerImage.kCosmeticCategories,
      name: 'Cosmetics',
    ),
    CategoryModel(
      id: MangerImage.kBookCategories,
      image: MangerImage.kBookCategories,
      name: 'Book',
    ),
    CategoryModel(
      id: MangerImage.kMobilesCategories,
      image: MangerImage.kMobilesCategories,
      name: 'Mobile',
    ),
  ];
}
