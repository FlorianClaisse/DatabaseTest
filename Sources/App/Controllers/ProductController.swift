//
//  ProductController.swift
//  
//
//  Created by Florian Claisse on 06/11/2022.
//

import Vapor

struct ProductController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let products = routes.grouped("products")
        products.get(use: self.index(req:))
        products.post(use: self.create(req:))
    }
    
    // GET /products
    func index(req: Request) async throws -> [Product] {
        return try await Product.query(on: req.db).with(\.$category).all()
    }
    
    // POST /products
    func create(req: Request) async throws -> HTTPStatus {
        let product = try req.content.decode(Product.self)
        try await product.save(on: req.db)
        return .ok
    }
}
