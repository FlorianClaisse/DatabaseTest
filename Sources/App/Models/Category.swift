//
//  Category.swift
//  
//
//  Created by Florian Claisse on 04/11/2022.
//

import Fluent
import Vapor

final class Category: Model, Content {
    
    static var schema: String = "categorys"
    
    @ID(key: .id) var id: UUID?
    
    @Field(key: "name") var name: String
    
    @Children(for: \.$category) var products: [Product]
    
    init() { }
    
    init(id: UUID? = nil, name: String) {
        self.id = id
        self.name = name
    }
}
