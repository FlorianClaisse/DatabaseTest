//
//  CategoryController.swift
//  
//
//  Created by Florian Claisse on 06/11/2022.
//

import Vapor

struct CategoryController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        let category = routes.grouped("categorys")
        category.get(use: self.index(req:))
        category.post(use: self.create(req:))
    }
    
    // GET /categorys
    func index(req: Request) async throws -> [Category] {
        return try await Category.query(on: req.db).with(\.$products).all()
    }
    
    // POST /categorys
    func create(req: Request) async throws -> HTTPStatus {
        let category = try req.content.decode(Category.self)
        try await category.save(on: req.db)
        return .ok
    }
}
