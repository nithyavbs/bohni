import React, { Component } from 'react';
import ProductService from '../services/ProductService';

class UpdateProductComponent extends Component {
    constructor(props) {
        super(props)

        this.state = {
            id: this.props.match.params.id,
            name: '',
            price: ''
        }
        this.changeProductNameHandler = this.changeProductNameHandler.bind(this);
        this.changeProductPriceHandler = this.changeProductPriceHandler.bind(this);
        this.saveOrUpdateProduct = this.saveOrUpdateProduct.bind(this);
    }
    componentDidMount(){
        ProductService.getProductById(this.state.id).then( (res) =>{
            let product = res.data;
            this.setState({name: product.name,
                price: product.price
            });
        });
    }
    changeProductNameHandler = (event) => {
        this.setState({ name: event.target.value });
    }

    changeProductPriceHandler = (event) => {
        this.setState({ price: event.target.value });
    }
   saveOrUpdateProduct = (e) => {
        e.preventDefault();
        let product = {name: this.state.name, price: this.state.price};
        console.log('product => ' + JSON.stringify(product));
        console.log('id => ' + JSON.stringify(this.state.id));
        ProductService.updateProduct(product, this.state.id).then( res => {
            this.props.history.push('/products');
        });
    }
    cancel(){
    this.props.history.push('/products');
    }


render() {
    return (
        <div>
            <div className="container">
                <div className="row">
                    <div className="card col-md-6 offset-md-3 offset-md-3">
                        <h3 className="text-center">Update Product</h3>
                        <div className="card-body">
                            <form>
                                <div className="form-group">
                                    <label>Product Name</label>
                                    <input placeholder="Product Name" name="name" className="form-control"
                                        value={this.state.name} onChange={this.changeProductNameHandler} />
                                </div>
                                <div className="form-group">
                                    <label>Price</label>
                                    <input placeholder="Price" name="price" className="form-control"
                                        value={this.state.price} onChange={this.changeProductPriceHandler} />
                                </div>
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

export default UpdateProductComponent;