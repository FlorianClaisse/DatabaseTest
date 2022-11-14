//
//  Product.swift
//  
//
//  Created by Florian Claisse on 04/11/2022.
//

import Fluent
import Vapor

final class Product: Model, Content {
    
    static var schema: String = "products"
    
    @ID(key: .id) var id: UUID?
    
    @Field(key: "name") var name: String
    @Field(key: "price") var price: Float
    @Field(key: "image_url") var imageURL: String
    @Field(key: "quantity") var quantity: Int
    
    @Parent(key: "category_id") var category: Category
    
    
    init() { }
    
    init(id: UUID? = nil, name: String, price: Float, imageURL: String, quantity: Int, categoryID: Category.IDValue) {
        self.id = id
        self.name = name
        self.price = price
        self.imageURL = imageURL
        self.quantity = quantity
        self.$category.id = categoryID
    }
    
}
