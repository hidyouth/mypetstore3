package cus21047.web.mypetstore.service;

import cus21047.web.mypetstore.domain.Category;
import cus21047.web.mypetstore.domain.Item;
import cus21047.web.mypetstore.domain.Product;
import cus21047.web.mypetstore.persistence.CategoryDao;
import cus21047.web.mypetstore.persistence.ItemDao;
import cus21047.web.mypetstore.persistence.ProductDao;
import cus21047.web.mypetstore.persistence.impl.CategoryDaoImpl;
import cus21047.web.mypetstore.persistence.impl.ItemDaoImpl;
import cus21047.web.mypetstore.persistence.impl.ProductDaoImpl;

import java.util.List;

public class CatalogService {
    private CategoryDao categoryDao;
    private ProductDao productDao;
    private ItemDao itemDao;

    public CatalogService(){
        this.categoryDao = new CategoryDaoImpl();
        this.itemDao = new ItemDaoImpl();
        this.productDao = new ProductDaoImpl();
    }
    public List<Category> getCategoryList() {
        return categoryDao.getCategoryList();
    }

    public Category getCategory(String categoryId) {
        return categoryDao.getCategory(categoryId);
    }

    public Product getProduct(String productId) {
        return productDao.getProduct(productId);
    }

    public List<Product> getProductListByCategory(String categoryId) {
        return productDao.getProductListByCategory(categoryId);
    }

    // TODO enable using more than one keyword
    public List<Product> searchProductList(String keyword) {
        return productDao.searchProductList("%" + keyword.toLowerCase() + "%");
    }

    public List<Item> getItemListByProduct(String productId) {
        return itemDao.getItemListByProduct(productId);
    }

    public Item getItem(String itemId) {
        return itemDao.getItem(itemId);
    }

    public boolean isItemInStock(String itemId) {
        return itemDao.getInventoryQuantity(itemId) > 0;
    }
}
