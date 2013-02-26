//
//  FMIndexViewController.h
//  CMframe
//
//  Created by rulong on 2/25/13.
//  Copyright (c) 2013 rulong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMTablelistViewController.h"   
@interface FMIndexViewController : UIViewController <UIScrollViewDelegate>{
    UITableView *indexTablelistView;
    UIPageControl *indexSliderPageControl;
    UIScrollView *indexSliderScrollView;
    FMTablelistViewController *tablelistController;
    UINavigationController *containerNav;
}
@property (strong, nonatomic)  UITableView *indexTablelistView;
@property (strong, nonatomic)  UIPageControl *indexSliderPageControl;
@property (strong, nonatomic)  UIScrollView *indexSliderScrollView;
@property (strong, nonatomic)  FMTablelistViewController *tablelistController;
@property (strong, nonatomic)  UINavigationController *containerNav;
@end
