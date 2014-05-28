//
//  MasterViewController.m
//  BookWormSB
//
//  Created by Nancy Brokaw on 5/23/14.
//  Copyright (c) 2014 msse650. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "BookSvcCache.h"
#import "Book.h"
#import "AddBookViewController.h"

/*
@interface MasterViewController () {
    NSMutableArray *_objects;
}
@end
*/
@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.bookSvc = [[BookSvcCache alloc]init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

  /*  UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton; */

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
 /*   if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic]; */
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.bookSvc countOfList];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
   
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    Book *book= [[self.bookSvc retrieveAllBooks] objectAtIndex:indexPath.row];
    cell.textLabel.text = [book title];
    cell.detailTextLabel.text = [book author];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Book *book= [[self.bookSvc retrieveAllBooks] objectAtIndex:indexPath.row];
        NSLog(@"book title for delete: %@", book.title);
        [self.bookSvc deleteBook:book];

    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
    [[self tableView] reloadData];
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"prepare for seg entered, ident is %@", [segue identifier]);
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Book *object = [[self.bookSvc retrieveAllBooks] objectAtIndex:indexPath.row];
        DetailViewController *detailViewController = [segue destinationViewController];
        detailViewController.book = object;
        
        NSLog(@"detail view seque entered");
    }

}

- (IBAction)done:(UIStoryboardSegue *)segue {
    NSLog(@"done seg entered");
    NSLog(@"seg identifier is: %@", [segue identifier]);
    if ([[segue identifier] isEqualToString:@"newBook"]) {
        NSLog(@"segue for add book entered");
        
        AddBookViewController *addController = [segue sourceViewController];
        NSLog(@"book added title: %@ ", addController.book.title);
                NSLog(@"book added author: %@ ", addController.book.author);
        NSLog(@"book added rating: %@", addController.book.rating);
        if (addController.book) {
            
            NSLog(@"book added title: %@ ", addController.book.title);
           [self.bookSvc createBook:addController.book];
           [[self tableView] reloadData];
        }
    }
}

@end
