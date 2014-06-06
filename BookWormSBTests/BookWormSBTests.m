//
//  BookWormSBTests.m
//  BookWormSBTests
//
//  Created by Nancy Brokaw on 5/23/14.
//  Copyright (c) 2014 msse650. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Book.h"
#import "BookSvcArchive.h"

@interface BookWormSBTests : XCTestCase

@end

@implementation BookWormSBTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testBookSvcArchive
{
    NSLog(@"*** Starting testBookSvcArchive ***");
    BookSvcArchive *bookSvc = [[BookSvcArchive alloc]init];
    int initialCount = [[bookSvc retrieveAllBooks] count];
    
    Book *book = [[Book alloc]init];
    book.title = @"test book";
    book.author = @"test author";
    book.yearpub = @"1999";
    book.dateread = @"2000";
    book.rating = @"10";
    book.review = @"test review";
    
    [bookSvc createBook:book];
    int finalCount = [[bookSvc retrieveAllBooks]count];
    
    NSLog(@"initial count %i, final count %i", initialCount, finalCount);
    
    NSLog(@"*** Ending testBookSvcArchive");
}

@end
