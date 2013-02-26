//
//  FMTablelistViewController.h
//  CMframe
//
//  Created by rulong on 2/25/13.
//  Copyright (c) 2013 rulong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMTablelistViewController : UITableViewController <UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *contentList ;
    UINavigationController *navigation;
}
@property(strong,nonatomic) NSMutableArray *contentList;
@property(strong,nonatomic) UINavigationController *navigation;
@end
