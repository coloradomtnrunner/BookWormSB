//
//  Book.h
//  BookWormSB
//
//  Created by Nancy Brokaw on 5/23/14.
//  Copyright (c) 2014 msse650. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Book : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *author;
@property (strong, nonatomic) NSString *yearpub;
@property (strong, nonatomic) NSString *dateread;
@property (strong, nonatomic) NSString *review;
@property (strong, nonatomic) NSString *rating;

@end
