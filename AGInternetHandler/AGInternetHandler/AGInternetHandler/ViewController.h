//
//  ViewController.h
//  AGInternetHandler
//
//  Created by Lion User on 30/11/2013.
//  Copyright (c) 2013 Amit Gowda. All rights reserved.
//

#import <UIKit/UIKit.h>
# import "AGInternetHandler.h"
@interface ViewController : UIViewController<AGInternetHandlerDelegate,UITableViewDelegate,UITableViewDataSource>
{
    IBOutlet UITableView *tableView;
    NSArray *itemArray;
}

@end
