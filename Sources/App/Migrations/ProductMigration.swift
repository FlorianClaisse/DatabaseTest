//
//  ProductMigration.swift
//  
//
//  Created by Florian Claisse on 06/11/2022.
//

import Fluent

struct ProductMigration: AsyncMigration {
    
    func prepare(on database: Database) async throws {
        try await database.schema(Product.schema)
            .id()
            .field(.name, .string, .required)
            .field(.price, .float, .required)
            .field(.image_url, .string, .required)
            .field(.quantity, .int, .required)
            .field(.categoryID, .uuid, .references(Category.schema, .id))
            .unique(on: .name)
            .update()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema(Product.schema).delete()
    }
}
