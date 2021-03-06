//
//  DetailViewController.h
//  BookWormSB
//
//  Created by Nancy Brokaw on 5/23/14.
//  Copyright (c) 2014 msse650. All rights reserved.
//
//  Detail view is called from the master view controller when a book item is selected.
//  It will display the properties of the book selected.
//


#import <UIKit/UIKit.h>
@class Book;

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Book *book;

@property (strong, nonatomic) IBOutlet UITextField *bookAuthorLabel;
@property (strong, nonatomic) IBOutlet UITextField *bookYearPublished;
@property (strong, nonatomic) IBOutlet UITextField *bookRatingLabel;
@property (strong, nonatomic) IBOutlet UITextField *bookDateReadLabel;
@property (strong, nonatomic) IBOutlet UITextField *bookReviewLabel;
@property (strong, nonatomic) IBOutlet UITextField *bookTitleLabel;
@end
