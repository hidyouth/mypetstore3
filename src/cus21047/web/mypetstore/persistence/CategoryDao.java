package cus21047.web.mypetstore.persistence;



import cus21047.web.mypetstore.domain.Category;

import java.util.List;

public interface CategoryDao {
    List<Category> getCategoryList();

    Category getCategory(String categoryId);
}
