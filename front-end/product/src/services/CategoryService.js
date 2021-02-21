import axios from 'axios';

const CATEGORY_API_BASE_URL = "http://localhost:8080/categories";

class CategoryService {

    getCategories(){
        return axios.get( CATEGORY_API_BASE_URL);
    }

    // createProduct(categories){
    //     return axios.post( CATEGORY_API_BASE_URL, categories);
    // }

    getCategoryById(categoryId){
        return axios.get( CATEGORY_API_BASE_URL + '/' + categoryId);
    }

    // updateProduct(categories, productId){
    //     console.log(CATEGORY_API_BASE_URL + '/' + productId);
    //         return axios.put( CATEGORY_API_BASE_URL + '/' + productId, categories);
    // }

    // deleteProduct(productId){
    //     return axios.delete( CATEGORY_API_BASE_URL + '/' + productId);
    // }
}

export default new CategoryService()