//
//  ViewController.m
//  MJCSegmentInterface
//
//  Created by mjc on 16/10/28.
//  Copyright © 2016年 MJC. All rights reserved.
//
//  有啥问题加我QQ: 292251588 一起交流,我是菜菜..求大神指教

#import "ViewController.h"

#import "MJCDemoController.h"
#import "MJCDemoController1.h"
#import "MJCDemoController2.h"
#import "MJCDemoController3.h"
#import "MJCDemoController4.h"
#import "MJCDemoController5.h"
#import "MJCDemoController6.h"
#import "MJCDemoController7.h"
#import "MJCDemoController8.h"
#import "MJCDemoController9.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}


- (IBAction)demo:(id)sender {
    
    MJCDemoController *vc1 = [MJCDemoController new];
    
    [self.navigationController pushViewController:vc1 animated:YES];
    
}
- (IBAction)demo1:(id)sender {
    
    MJCDemoController1 *vc3 = [MJCDemoController1 new];
    
    [self.navigationController pushViewController:vc3 animated:YES];

}
- (IBAction)demo2:(id)sender {
    
    MJCDemoController2 *vc2 = [MJCDemoController2 new];
    
    [self.navigationController pushViewController:vc2 animated:YES];

    
}
- (IBAction)demo3:(id)sender {
    
    MJCDemoController3 *vc4 = [MJCDemoController3 new];
    
    [self.navigationController pushViewController:vc4 animated:YES];
    
}
- (IBAction)demo4:(id)sender {
    
    
    MJCDemoController4 *vc5 = [MJCDemoController4 new];
    
    [self.navigationController pushViewController:vc5 animated:YES];
    
}
- (IBAction)demo5:(id)sender {
    
    MJCDemoController5 *custon = [MJCDemoController5 new];
    
    [self.navigationController pushViewController:custon animated:YES];
    
}
- (IBAction)demo6:(id)sender {
    
    MJCDemoController6 *control = [MJCDemoController6 new];
    
    [self.navigationController pushViewController:control animated:YES];
    
}

- (IBAction)demo7:(id)sender {
    MJCDemoController7 *imageVC = [MJCDemoController7 new];
    
    [self.navigationController pushViewController:imageVC animated:YES];
}

- (IBAction)demo8:(id)sender {
    
    MJCDemoController8 *test = [MJCDemoController8 new];
    
    [self.navigationController pushViewController:test animated:YES];
    
}
- (IBAction)demo9:(id)sender {
    
    MJCDemoController9 *viewVC = [MJCDemoController9 new];
    
    [self.navigationController pushViewController:viewVC animated:YES];
    
}



@end
