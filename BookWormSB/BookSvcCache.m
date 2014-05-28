//
//  BookSvcCache.m
//  BookWormSB
//
//  Created by Nancy Brokaw on 5/23/14.
//  Copyright (c) 2014 msse650. All rights reserved.
//

#import "BookSvcCache.h"
#import "Book.h"

@implementation BookSvcCache

NSMutableArray *books = nil;

-(id) init {
    if (self = [super init]) {
        books = [NSMutableArray array];
        return self;
    }
    return nil;
}

- (Book *) createBook: (Book *) book {
    
    [books addObject:book];
    return book;
    
}
- (NSMutableArray *) retrieveAllBooks {
    
    return books;
    
}

- (Book *) updateBook: (Book *) book {
    
    NSInteger index = [books indexOfObject:book];
    [books replaceObjectAtIndex:index withObject:book];
    return book;
    
}
- (Book *) deleteBook: (Book *) book {

    NSLog(@"About to remove book %@", book.title);
    [books removeObject:book];
    return book;
    
}

- (NSUInteger) countOfList {
    return [books count];
}

@end
