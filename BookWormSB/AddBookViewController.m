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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addBook:(id)sender {
    
    [self.view endEditing:YES];
    
    Book *book = [[Book alloc]init];
    book.title = _bookTitle.text;
    book.author = _author.text;
    book.yearpub = _yearPub.text;
    book.dateread = _dateRead.text;
    book.review = _review.text;
    book.rating = _rating.text;
  //[bookSvc createBook:book];
    
    NSLog(@"book added, returning to main view");
    
}

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

- (void)keyboardWasShown:(NSNotification*)aNotification

{
    
    NSDictionary* info = [aNotification userInfo];
    
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    
    self.scrollView.contentInset = contentInsets;
    
    self.scrollView.scrollIndicatorInsets = contentInsets;
    
    NSLog(@"in keyboard scroll view");
    
    // If active text field is hidden by keyboard, scroll it so it's visible
    
    // Your app might not need or want this behavior.
    
    CGRect aRect = self.view.frame;
    
    aRect.size.height -= kbSize.height;
    
    if (!CGRectContainsPoint(aRect, self.activeField.frame.origin) ) {
        
        [self.scrollView scrollRectToVisible:self.activeField.frame animated:YES];
        
    }
    
}



// Called when the UIKeyboardWillHideNotification is sent

- (void)keyboardWillBeHidden:(NSNotification*)aNotification

{
    
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    
    self.scrollView.contentInset = contentInsets;
    
    self.scrollView.scrollIndicatorInsets = contentInsets;
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField

{
    
    self.activeField = textField;
    
}



- (void)textFieldDidEndEditing:(UITextField *)textField

{
    
    self.activeField = nil;
    
}
@end
