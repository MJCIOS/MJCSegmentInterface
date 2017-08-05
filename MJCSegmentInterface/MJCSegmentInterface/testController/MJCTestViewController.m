//
//  MJCTestViewController.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/2.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCTestViewController.h"
#import "MJCPrefixHeader.pch"

@interface MJCTestViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *backImageViews;

@property (weak, nonatomic) IBOutlet UILabel *titlesLable;

@end

@implementation MJCTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSInteger tag  = arc4random() % 9;
    self.backImageViews.image = [UIImage imageNamed:[NSString stringWithFormat:@"back%ld",tag]];
    _titlesLable.text = [NSString stringWithFormat:@"%@",self.title];
}


@end
