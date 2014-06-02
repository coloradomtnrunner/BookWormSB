//
//  Book.m
//  BookWormSB
//
//  Created by Nancy Brokaw on 5/23/14.
//  Copyright (c) 2014 msse650. All rights reserved.
//
//  Implementation of Book object to store information about each book.
//

#import "Book.h"

static NSString *const TITLE = @"title";
static NSString *const AUTHOR = @"author";
static NSString *const YEARPUB = @"yearpub";
static NSString *const DATEREAD = @"dateread";
static NSString *const RATING = @"rating";
static NSString *const REVIEW = @"review";

@implementation Book

- (void) encodeWithCoder:(NSCoder *) coder {
    [coder encodeObject:self.title forKey:TITLE];
    [coder encodeObject:self.author forKey:AUTHOR];
    [coder encodeObject:self.yearpub forKey:YEARPUB];
    [coder encodeObject:self.dateread forKey:DATEREAD];
    [coder encodeObject:self.rating forKey:RATING];
    [coder encodeObject:self.review forKey:REVIEW];
}

- (id) initWithCoder:(NSCoder *) decoder {
    self = [super init];
    if (self) {
        _title = [decoder decodeObjectForKey:TITLE];
        _author = [decoder decodeObjectForKey:AUTHOR];
        _yearpub = [decoder decodeObjectForKey:YEARPUB];
        _dateread = [decoder decodeObjectForKey:DATEREAD];
        _rating = [decoder decodeObjectForKey:RATING];
        _review = [decoder decodeObjectForKey:REVIEW];
    }
    return self;

}

-(NSString *) description {
    return [NSString stringWithFormat:@"%@ %@ %@ %@ %@ %@", _title, _author, _yearpub, _dateread, _rating, _review];
}

@end
