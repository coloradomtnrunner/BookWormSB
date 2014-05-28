//
//  Book.m
//  BookWormSB
//
//  Created by Nancy Brokaw on 5/23/14.
//  Copyright (c) 2014 msse650. All rights reserved.
//

#import "Book.h"

@implementation Book

-(NSString *) description {
    return [NSString stringWithFormat:@"%@ %@ %@ %@ %@ %@", _title, _author, _yearpub, _dateread, _review, _rating];
}

@end
