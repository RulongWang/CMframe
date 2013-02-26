//
//  FMIndexViewController.m
//  CMframe
//
//  Created by rulong on 2/25/13.
//  Copyright (c) 2013 rulong. All rights reserved.
//

#import "FMIndexViewController.h"
#import "QuartzCore/QuartzCore.h"
@interface FMIndexViewController ()

@end

@implementation FMIndexViewController
@synthesize indexTablelistView,indexSliderPageControl,indexSliderScrollView;
@synthesize tablelistController;
@synthesize containerNav;//Navitation stack controller
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
#pragma mark - initialize scrollview  and pageControl
        indexSliderScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 150)];
        
        NSLog(@"slider width%f",indexSliderScrollView.frame.size.width);
        NSLog(@"slider width%f",indexSliderScrollView.frame.size.height);
        indexSliderScrollView.pagingEnabled = YES;
        indexSliderScrollView.contentSize =CGSizeMake(CGRectGetWidth(self.indexSliderScrollView.frame)*4, CGRectGetHeight(self.indexSliderScrollView.frame));
        [self.indexSliderScrollView setShowsHorizontalScrollIndicator:NO];
        [self.indexSliderScrollView setShowsVerticalScrollIndicator:NO];
        [indexSliderScrollView setDelegate:self];
        indexSliderPageControl = [[UIPageControl alloc] init];
        indexSliderPageControl.frame = CGRectMake(170, 150, 150, 20);
        indexSliderPageControl.numberOfPages = 4;
        indexSliderPageControl.currentPage = 0;
        [indexSliderPageControl addTarget:self action:@selector(changeSliderPage:) forControlEvents:UIControlEventTouchUpInside];
        indexSliderPageControl.backgroundColor = [UIColor grayColor];
        
        CGFloat width =indexSliderScrollView.frame.size.width;
        CGFloat height = indexSliderScrollView.frame.size.height;
        
        // 初始化Slider 里面的view 以及ViewController
        for (int i =0; i<indexSliderPageControl.numberOfPages; i++) {
            CGRect frame = CGRectMake(width*i, 0, width, height);
            NSString *imgName = [NSString stringWithFormat:@"%@%d%@",@"img",i+1,@".jpg"];
            UIView *sliderSubView = [[UIView alloc]initWithFrame:frame];
            UIImage *myImage = [UIImage imageNamed:imgName];
            UIImageView *myImageView = [[UIImageView alloc] initWithImage:myImage];
            
            [sliderSubView addSubview:myImageView];
            CGFloat r, g ,b;
            r = (arc4random() % 10) / 10.0;
            g = (arc4random() % 10) / 10.0;
            b = (arc4random() % 10) / 10.0;
            //[view setBackgroundColor:[UIColor colorWithRed:r green:g blue:b alpha:0.3]];
            [sliderSubView.layer setCornerRadius:15.0];
            [indexSliderScrollView addSubview:sliderSubView];
        }

        
        
        
        
#pragma mark - initialize indexTable 
        indexTablelistView = [[UITableView alloc]initWithFrame:CGRectMake(0, 190, 320, 360)];
        tablelistController = [[FMTablelistViewController alloc]init];
        tablelistController.tableView = indexTablelistView;
        [indexTablelistView setDelegate:tablelistController];
        [indexTablelistView setDataSource:tablelistController];

        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.view addSubview:indexTablelistView];
    [self.view addSubview:indexSliderPageControl];
    [self.view addSubview:indexSliderScrollView];
    
    tablelistController.navigation = self.navigationController;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -delegate implementation for UIScrollViewDelegate  and indexPageControl event action
- (void)scrollViewDidScroll:(UIScrollView *)sender{
    CGFloat width = sender.frame.size.width;
    //NSInteger currentPage = ((slider.contentOffset.x - width / 2) / width) + 1;
    NSInteger currentPage = (indexSliderScrollView.contentOffset.x - 160)/160+1;
    [indexSliderPageControl setCurrentPage:currentPage];
}
- (void)changeSliderPage:(id)sender{
    
    NSInteger page = indexSliderPageControl.currentPage;
    CGFloat width,height;
    width = indexSliderScrollView.frame.size.width;
    height = indexSliderScrollView.frame.size.height;
    CGRect frame = CGRectMake(width*page, 0, width, height);
    [indexSliderScrollView scrollRectToVisible:frame animated:YES];
    
    NSLog(@"%d",[sender currentPage]) ;
}




@end
