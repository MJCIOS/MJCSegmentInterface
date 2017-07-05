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

@property (weak, nonatomic) IBOutlet UILabel *titlesLable;

@end

@implementation MJCTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _titlesLable.text = [NSString stringWithFormat:@"我是第%@个",[MJCInterfaceTools setupNSStringWithNumberCount:_titlesCount]];
}


@end
