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
#import "MJCSegmentFaceController.h"
#import "MJCImageViewController.h"
#import "MJCTESTViewController.h"
#import "MJCTest2Controller.h"

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
    
    MJCSegmentFaceController *control = [MJCSegmentFaceController new];
    
    [self.navigationController pushViewController:control animated:YES];
    
}

- (IBAction)demo7:(id)sender {
    MJCImageViewController *imageVC = [MJCImageViewController new];
    
    [self.navigationController pushViewController:imageVC animated:YES];
}

- (IBAction)demo8:(id)sender {
    
    MJCTESTViewController *test = [MJCTESTViewController new];
    
    [self.navigationController pushViewController:test animated:YES];
    
}
- (IBAction)demo9:(id)sender {
    
    MJCTest2Controller *viewVC = [MJCTest2Controller new];
    
    [self.navigationController pushViewController:viewVC animated:YES];
    
}



@end
