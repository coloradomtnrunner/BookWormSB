//
//  BookSvc.h
//  BookWormSB
//
//  Created by Nancy Brokaw on 5/23/14.
//  Copyright (c) 2014 msse650. All rights reserved.
//
//  This is the interface that must be implemented to create a book service factory.
//

#import <Foundation/Foundation.h>
#import "Book.h"

@protocol BookSvc <NSObject>

- (Book *) createBook: (Book *) book;
- (NSMutableArray *) retrieveAllBooks;
- (Book *) updateBook: (Book *) book;
- (Book *) deleteBook: (Book *) book;
- (NSUInteger) countOfList;

@end
