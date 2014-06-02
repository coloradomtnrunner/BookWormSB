//
//  BookSvcArchive.m
//  BookWormSB
//
//  Created by Nancy Brokaw on 5/31/14.
//  Copyright (c) 2014 msse650. All rights reserved.
//

#import "BookSvcArchive.h"

@implementation BookSvcArchive

NSString *filePath;
NSMutableArray *books;

- (id) init {
    
    NSLog(@"in init for booksvcarchive");
    NSArray *dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsDir = [dirPaths objectAtIndex:0];
    filePath = [[NSString alloc]initWithString:[docsDir stringByAppendingPathComponent:@"Books.archive"]];
    
    NSLog(@"File path is %@", filePath);

    [self readArchive];
    return self;
}

- (void) readArchive {
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    if ([fileMgr fileExistsAtPath:filePath]){
        books = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
        NSLog(@"in read archiver after geting books");
        NSLog(@"first book in archive is: %@", [books[0] title]);
    }
    else {
        books = [NSMutableArray array];
    }
}

- (void) writeArchive {
    [NSKeyedArchiver archiveRootObject:books toFile:filePath];
}


- (Book *) createBook: (Book *) book {
    NSLog(@"Contact being created %@", [book title]);
    [books addObject:book];
    [self writeArchive];
    return book;
}


- (NSMutableArray *) retrieveAllBooks {
    return books;
}

- (Book *) updateBook: (Book *) book {
    
    NSInteger index = [books indexOfObject:book];
    [books replaceObjectAtIndex:index withObject:book];
    [self writeArchive];
    return book;
}

- (Book *) deleteBook: (Book *) book {
    NSLog(@"About to remove book %@", book.title);
    [books removeObject:book];
    [self writeArchive];
    return book;
}

- (NSUInteger) countOfList {
    return [books count];
}

@end
