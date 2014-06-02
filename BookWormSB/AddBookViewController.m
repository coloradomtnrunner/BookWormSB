//
//  AddBookViewController.m
//  BookWormSB
//
//  Created by Nancy Brokaw on 5/23/14.
//  Copyright (c) 2014 msse650. All rights reserved.
//

#import "AddBookViewController.h"
#import "MasterViewController.h"
#import "Book.h"

@interface AddBookViewController ()

@end

@implementation AddBookViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// turn off selector warning
#pragma GCC diagnostic ignored "-Wundeclared-selector"


// The seque is called when the user presses Save from the add book screen, it will store
// each field for the book to be passed back to the main view controller

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NSLog(@"in prepare for seg, identifer is: %@", [segue identifier]);
    if ([[segue identifier] isEqualToString:@"newBook"]) {
        
        Book *book = [[Book alloc]init];
        
        book.title = _bookTitle.text;
        book.author = _author.text;
        book.yearpub = _yearPub.text;
        book.dateread = _dateRead.text;
        book.review = _review.text;
        book.rating = _rating.text;
        
        NSLog(@"in add book controller, title is: %@", book.title);
        
        self.book = book;
        
    }
}

#pragma mark Keyboard Management

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    if ((textField == self.bookTitle) || (textField == self.author) || (textField == self.yearPub) ||
                                          (textField == self.dateRead) || (textField == self.rating) ||
        (textField == self.review)) {
        [textField resignFirstResponder];
    }
    return YES;
}

// Call this method somewhere in your view controller setup code.

- (void)registerForKeyboardNotifications

{
    
    [[NSNotificationCenter defaultCenter] addObserver:self
     
                                             selector:@selector(keyboardWasShown:)
     
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
     
                                             selector:@selector(keyboardWillBeHidden:)
     
                                                 name:UIKeyboardWillHideNotification object:nil];
    
    
    
}


// Called when the UIKeyboardDidShowNotification is sent.

- (void)keyboardWasShown

{
    

    CGFloat desiredMove = -70.0f;
    [self.view setFrame:CGRectMake(0, desiredMove, self.view.frame.size.width, self.view.frame.size.height)];
    
}

// Called when the UIKeyboardWillHideNotification is sent

- (void)keyboardWillBeHidden

{
    [self.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField

{
    
    self.activeField = textField;
    if(textField == self.review) {
        [self registerForKeyboardNotifications];
        if([self.activeField isFirstResponder]) {
            [self keyboardWasShown];
        }
    }
    
}


- (void)textFieldDidEndEditing:(UITextField *)textField

{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    if ([self.activeField isFirstResponder] && [touch view] != self.activeField) {
        [self.activeField resignFirstResponder];
        [self keyboardWillBeHidden];
    }
    [super touchesBegan:touches withEvent:event];
}
@end
