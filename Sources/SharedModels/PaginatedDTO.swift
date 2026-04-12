//
//  PaginatedDTO.swift
//  GoFloraSharedPackage
//
//  Created by Terence Changadeya on 12/4/2026.
//

import Vapor

// MARK: - Pagination Response Wrapper

/// Generic paginated response wrapper for any content type
/// Use this for all paginated endpoints to provide consistent pagination metadata
public struct PaginatedResponse<T: Content>: Content {
    /// The actual data items for the current page
    public let items: [T]

    /// Pagination metadata
    public let pagination: PaginationMetadata

    public init(items: [T], pagination: PaginationMetadata) {
        self.items = items
        self.pagination = pagination
    }

    /// Convenience initializer with all pagination parameters
    public init(items: [T], page: Int, perPage: Int, total: Int) {
        self.items = items
        self.pagination = PaginationMetadata(
            page: page,
            perPage: perPage,
            total: total,
            totalPages: Int(ceil(Double(total) / Double(perPage)))
        )
    }
}

// MARK: - Pagination Metadata

/// Metadata about pagination state
public struct PaginationMetadata: Content {
    /// Current page number (1-indexed)
    public let page: Int

    /// Number of items per page
    public let perPage: Int

    /// Total number of items across all pages
    public let total: Int

    /// Total number of pages
    public let totalPages: Int

    /// Whether there is a next page
    public var hasNext: Bool {
        return page < totalPages
    }

    /// Whether there is a previous page
    public var hasPrevious: Bool {
        return page > 1
    }

    /// The next page number (nil if no next page)
    public var nextPage: Int? {
        return hasNext ? page + 1 : nil
    }

    /// The previous page number (nil if no previous page)
    public var previousPage: Int? {
        return hasPrevious ? page - 1 : nil
    }

    public init(page: Int, perPage: Int, total: Int, totalPages: Int) {
        self.page = page
        self.perPage = perPage
        self.total = total
        self.totalPages = totalPages
    }
}

// MARK: - Example JSON Response
/*
 {
   "items": [
     { "id": "123", "name": "Trip 1", ... },
     { "id": "456", "name": "Trip 2", ... }
   ],
   "pagination": {
     "page": 1,
     "perPage": 20,
     "total": 150,
     "totalPages": 8,
     "hasNext": true,
     "hasPrevious": false,
     "nextPage": 2,
     "previousPage": null
   }
 }

 Frontend Usage Examples:

 // Web - Page navigation
 const showPagination = response.pagination.totalPages > 1
 const pageNumbers = Array.from({length: response.pagination.totalPages}, (_, i) => i + 1)

 // Mobile - Infinite scroll
 if (response.pagination.hasNext) {
   loadMoreItems(response.pagination.nextPage)
 }

 // Progress indicator
 const progress = (response.pagination.page / response.pagination.totalPages) * 100

 // Load more button
 <button disabled={!response.pagination.hasNext}>
   Load More ({response.pagination.total - response.items.length} remaining)
 </button>
 */
