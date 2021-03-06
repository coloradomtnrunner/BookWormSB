//
//  AddBookViewController.h
//  BookWormSB
//
//  Created by Nancy Brokaw on 5/23/14.
//  Copyright (c) 2014 msse650. All rights reserved.
//
//  Controller responsible for adding a new book to the collection.  It is called by the user
//  pressing the add button from the master view list.
//


#import <UIKit/UIKit.h>

@class MasterViewController;
@class Book;

@interface AddBookViewController : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *bookTitle;
@property (strong, nonatomic) IBOutlet UITextField *author;
@property (strong, nonatomic) IBOutlet UITextField *yearPub;
@property (strong, nonatomic) IBOutlet UITextField *dateRead;
@property (strong, nonatomic) IBOutlet UITextField *rating;
@property (strong, nonatomic) IBOutlet UITextField *review;
@property (retain, nonatomic) Book *book;
@property (strong, nonatomic) UITextField *activeField;

@end
