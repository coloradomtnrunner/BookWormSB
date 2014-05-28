//
//  MasterViewController.h
//  BookWormSB
//
//  Created by Nancy Brokaw on 5/23/14.
//  Copyright (c) 2014 msse650. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddBookViewController.h"

@class BookSvcCache;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) BookSvcCache *bookSvc;
-(IBAction) done:(UIStoryboardSegue *)segue;
@end
