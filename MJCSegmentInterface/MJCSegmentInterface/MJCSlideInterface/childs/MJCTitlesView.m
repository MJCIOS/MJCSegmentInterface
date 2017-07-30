//
//  MJCTitlesScollView.m
//  MJCSlideSwitch
//
//  Created by mjc on 16/11/21.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "MJCTitlesView.h"
#import "UIView+MJCClassExtension.h"

@interface MJCTitlesView ()

@property (nonatomic,weak) UIImageView *backgroudView;

@end

@implementation MJCTitlesView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.backgroundColor = [UIColor whiteColor];
        UIImageView *backgroudView = [[UIImageView alloc]init];
        backgroudView.hidden = YES;
        [self addSubview:backgroudView];
        _backgroudView = backgroudView;
    }
    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.backgroundColor = [UIColor whiteColor];
    UIImageView *backgroudView = [[UIImageView alloc]init];
    backgroudView.hidden = YES;
    [self addSubview:backgroudView];
    _backgroudView = backgroudView;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    _backgroudView.frame = self.bounds;
}

-(void)setBackgroudImage:(UIImage *)backgroudImage
{
    _backgroudView.hidden  = NO;
    _backgroudImage = backgroudImage;
    _backgroudView.image = backgroudImage;
}


@end
