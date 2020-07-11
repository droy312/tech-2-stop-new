import 'package:tech_two_stop/models/category_model.dart';

List<CategoryModel> getCategories() {

  List<CategoryModel> category = new List<CategoryModel>();
  CategoryModel categoryModel = CategoryModel();

  // 1
  categoryModel.id = 583;
  categoryModel.categoryName = "Accessories";
  categoryModel.imageUrl = "https://images.unsplash.com/3/www.madebyvadim.com.jpg?ixlib=rb-1.2.1&auto=format&fit=crop&w=1061&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  // 2
  categoryModel.id = 9;
  categoryModel.categoryName = "Android";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1541345023926-55d6e0853f4b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  // 3
  categoryModel.id = 6;
  categoryModel.categoryName = "Apps";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1512941937669-90a1b58e7e9c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  // 4
  categoryModel.id = 594;
  categoryModel.categoryName = "Audio Gears";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1590233325788-ffa59ae974ef?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  // 5
  categoryModel.id = 601;
  categoryModel.categoryName = "Cameras";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1512790182412-b19e6d62bc39?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1189&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  // 6
  categoryModel.id = 598;
  categoryModel.categoryName = "Comparisons";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1560092057-552a70533807?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1052&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  // 7
  categoryModel.id = 596;
  categoryModel.categoryName = "Computer Peripherals";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1550009158-9ebf69173e03?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1077&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  // 8
  categoryModel.id = 5328;
  categoryModel.categoryName = "COVID-19";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1585904529540-db52ff70f4c6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1053&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  // 9
  categoryModel.id = 588;
  categoryModel.categoryName = "Featured";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1568442258448-3247f8a7d7b2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1063&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  // 10
  categoryModel.id = 584;
  categoryModel.categoryName = "Games";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1529154691717-3306083d869e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  category.add(categoryModel);


  return category;
}