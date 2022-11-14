//
//  CategoryMigration.swift
//  
//
//  Created by Florian Claisse on 06/11/2022.
//

import Fluent

struct CategoryMigration: AsyncMigration {
    
    func prepare(on database: Database) async throws {
        try await database.schema(Category.schema)
            .id()
            .field(.name, .string, .required)
            .unique(on: .name)
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema(Category.schema).delete()
    }
}
