//
//  UITestViewController.m
//  MJCSlideSwitch
//
//  Created by mjc on 16/10/9.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "UITestViewController.h"

@interface UITestViewController ()



@end

@implementation UITestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    
    UIButton *butatat = [UIButton buttonWithType:UIButtonTypeCustom];
    
    butatat.backgroundColor = [UIColor redColor];
    [butatat addTarget:self action:@selector(dismisadasd) forControlEvents:UIControlEventTouchUpInside];
    butatat.frame = CGRectMake(30, 30, 50, 50);
    
    [self.view addSubview:butatat];
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}

-(void)dismisadasd
{
    [self dismissViewControllerAnimated:YES completion:nil];
}




@end
