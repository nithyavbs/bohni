import React, { Component } from 'react'
import { FormControl } from '@material-ui/core';
import Select from "react-dropdown-select"
import CategoryService from '../services/CategoryService';
import ProductService from '../services/ProductService';
// const category={
//     categories:{
//         id:'',
//         name:''
//     }
// }
class CreateProductComponent extends Component {

    constructor(props) {
        super(props)

        this.state = {

            // step 2
            id: this.props.match.params.id,
            name: '',
            quantity: '',
            price: '',
            categoryId: '',
            categories: [],
            optionItems: []


        }
        this.handleChange = this.handleChange.bind(this);
        this.changeProductNameHandler = this.changeProductNameHandler.bind(this);
        this.saveOrUpdateProduct = this.saveOrUpdateProduct.bind(this);
    }
    // step 3
    componentDidMount() {
        CategoryService.getCategories().then((res) => {
            let initialCategories = res.data;
            console.log('categories =>' + initialCategories);
            this.setState({
                categories:initialCategories
                //  id1: category.id,
                // category_name: category.name,
            });
        });

        // step 4
        if (this.state.id === '_add') {
            return
        } else {
            ProductService.getProductById(this.state.id).then((res) => {
                let product = res.data;
                this.setState({
                    id: product.id,
                    name: product.name,
                    quantity: product.quantity,
                    price: product.price,
                    categoryId: product.categoryId

                });
            });
           
        }
    }
    saveOrUpdateProduct = (e) => {
        e.preventDefault();
        let product = { id: this.state.id, name: this.state.name, quantity: this.state.quantity, price: this.state.price, categoryId: this.state.categoryId };
        // let categories = { id1: this.state.categoryId, category_name: this.state.category_name }
        let categories = { categories: this.state.categories }

        console.log('product => ' + JSON.stringify(product));
        console.log('categories =>' + JSON.stringify(categories));

        // step 5
        if (this.state.id === '_add') {
            let product = { name: this.state.name, quantity: this.state.quantity, price: this.state.price, categoryId: this.state.categoryId };
            let categories = { categories: this.state.categories }
            ProductService.createProduct(product).then(res => {
                this.props.history.push('/products');
            });
        } else {
            let categories = { categories: this.state.categories }
            ProductService.updateProduct(product, this.state.id).then(res => {
                this.props.history.push('/products');
            });
            // ProductService.updateProduct(categories, this.state.id).then(res => {
            //     this.props.history.push('/products');
            // });


        }
    }

    changeProductNameHandler = (event) => {
        this.setState({ name: event.target.value });
    }
    changeProductQuantityHandler = (event) => {
        this.setState({ quantity: event.target.value });
    }

    changePriceHandler = (event) => {
        this.setState({ price: event.target.value });
    }
    changeCategoryHandler = (event) => {

        this.setState({ category_id: event.target.value });
    }


    cancel() {
        this.props.history.push('/products');
    }

    getTitle() {
        if (this.state.id === '_add') {
            return <h3 className="text-center">Add Product</h3>
        } else {
            return <h3 className="text-center">Update Product</h3>
        }
    }
    handleChange(e) {
        let selectedItem = [];
        selectedItem = e;
        console.log("selectedItem:" + JSON.stringify(selectedItem))

    }

    render() {
        this.optionItems = this.state.categories;
        return (
            <div>
                <br></br>
                <div className="container">
                    <div className="row">
                        <div className="card col-md-6 offset-md-3 offset-md-3">
                            {
                                this.getTitle()
                            }
                            <div className="card-body">
                                <form>
                                    <div className="form-group">
                                        <label> Product Name: </label>
                                        <input placeholder="Product Name" name="name" className="form-control"
                                            value={this.state.name} onChange={this.changeProductNameHandler} />
                                    </div>
                                    <div className="form-group">
                                        <label> Quantity: </label>
                                        <input placeholder="Quantity" name="quantity" className="form-control"
                                            value={this.state.quantity} onChange={this.changeProductQuantityHandler} />
                                    </div>

                                    <div className="form-group">
                                        <label> Price: </label>
                                        <input placeholder="Product Price" name="price" className="form-control"
                                            value={this.state.price} onChange={this.changePriceHandler} />
                                    </div>
                                    {/* <div className="form-group">
                                    <label>Category</label>
                                    <select id="categoryId" placeholder="Product Category" name="category" className="form-control" 
                                                value={this.state.category_name} onChange={this.changeCategoryHandler}>
                                                 <option value="{this.state.category_name}">-- Select --</option>
                                                </select>
                                                </div> */}
                                    <div className="form-group">
                                        <label> Category: </label>
                                        <Select onChange={this.handleChange}
                                            value={this.state.selectedItem}
                                            getOptionValue={option => option.id}
                                            getOptionLabel={option => option.name}
                                            options={this.optionItems}>

                                        </Select>
                                    </div>
                                    {/* <select>{
                                            this.dropDown()
                                         }</select>   */}

                                    {/* <FormControl as="select"><select onChange={(e) => this.changeCategoryHandler(e)}>
                                                {Categories.categories && Categories.categories.map((e, key) => {
                                                    return <option key={key} value={e.Key}>{e.Value}</option>;
                                                })
                                                }</select></FormControl> */}

                                    {/* {this.dropDown()} */}
                                    {/* <Select options={category_name} onChange={(this.changeCategoryHandler) }=> this.setValues{(this.changeCategoryHandler)} /> */}
                                    {/* <select id="categoryId" placeholder="Product Category" name="category" className="form-control" 
                                         value={this.state.product.map(product=><option value="product.value">{product.category_name}</option>)} onChange={this.changeCategoryHandler}>
                                            </select>  */}
                                    {/* <input placeholder="Product Category" name="category" className="form-control"
                                                value={this.dropDown()}onChange={this.changeCategoryHandler} /> */
                                        // value= { this.state.product.map(category=><option value="category.value">{category.category_name}</option>)}
                                    }

                                    {/* <div className = "form-group">
                                            <label> Category: </label>
                                            <select id="categoryId" placeholder="Product Category" name="category" className="form-control" 
                                                value= {this.state.category_name} onChange={this.changeCategoryHandler}>
                                                </select>
                                        </div>  */}


                                    <button className="btn btn-success" onClick={this.saveOrUpdateProduct}>Save</button>
                                    <button className="btn btn-danger" onClick={this.cancel.bind(this)} style={{ marginLeft: "10px" }}>Cancel</button>
                                </form>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        )
    }
}

export default CreateProductComponent