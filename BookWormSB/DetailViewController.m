//
//  DetailViewController.m
//  BookWormSB
//
//  Created by Nancy Brokaw on 5/23/14.
//  Copyright (c) 2014 msse650. All rights reserved.
//

#import "DetailViewController.h"
#import "Book.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newBook
{
    if (_book != newBook){
        _book = newBook;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    Book *theBook = self.book;
    if (theBook) {
        self.bookTitleLabel.text = [theBook title];
        self.bookAuthorLabel.text = [theBook author];
        self.bookYearPublished.text = [theBook yearpub];
        self.bookDateReadLabel.text = [theBook dateread];
        self.bookRatingLabel.text = [theBook rating];
        self.bookReviewLabel.text = [theBook review];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
