//
//  MasterViewController.h
//  BookWormSB
//
//  Created by Nancy Brokaw on 5/23/14.
//  Copyright (c) 2014 msse650. All rights reserved.
//
//  Responsible for the initial view into the app - it will list all of the books that
//  have been added.
//

#import <UIKit/UIKit.h>
#import "AddBookViewController.h"


@class BookSvcArchive;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) BookSvcArchive *bookSvc;
-(IBAction) done:(UIStoryboardSegue *)segue;
@end
