//
//  MJCIndicatorView.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/27.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCIndicatorView.h"
#import "UIView+MJCClassExtension.h"
#import "MJCSegmentInterface.h"

static CGFloat const animalTime= 0.25;
@implementation MJCIndicatorView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor blackColor];
        self.userInteractionEnabled = NO;
        self.enabled = NO;
        self.hidden = NO;
    }
    return self;
}
-(void)awakeFromNib
{
    [super awakeFromNib];
    self.backgroundColor = [UIColor blackColor];
    self.userInteractionEnabled = NO;
    self.enabled = NO;
    self.hidden = NO;
}

-(void)setIndicatorImage:(UIImage *)indicatorImage
{
    _indicatorImage = indicatorImage;
    [self setImage:indicatorImage forState:UIControlStateNormal];
    [self sizeToFit];
}
-(void)setupIndicatorViewCenterAndWidthIsAnimal:(BOOL)isIndicatorsAnimals indicatorStyles:(NSUInteger)indicatorStyles selectedTitleButton:(UIButton*)selectedTitleButton indicatorFrame:(CGRect)indicatorFrame;
{
//    ![selectedTitleButton.titleLabel.text isEqualToString:@""]
    if (isIndicatorsAnimals) {
        if (indicatorStyles == MJCIndicatorItemTextStyle &&  selectedTitleButton.titleLabel.text != nil) {
            [selectedTitleButton.titleLabel sizeToFit];
            [UIView animateWithDuration:animalTime animations:^{
                self.jc_width = selectedTitleButton.titleLabel.jc_width;
                self.jc_centerX = selectedTitleButton.jc_centerX;
            }];
        }else{
            CGFloat indiCatorNewW;
            if (indicatorFrame.size.width == 0) {
                indiCatorNewW = selectedTitleButton.jc_width;
            }else{
                indiCatorNewW = indicatorFrame.size.width;
            }
            [UIView animateWithDuration:animalTime animations:^{
                self.jc_width = indiCatorNewW;
                self.jc_centerX = selectedTitleButton.jc_centerX;
            }];;
        }
    }else{
        if (indicatorStyles == MJCIndicatorItemTextStyle) {
            [selectedTitleButton.titleLabel sizeToFit];
            self.jc_width = selectedTitleButton.titleLabel.jc_width;
            self.jc_centerX = selectedTitleButton.jc_centerX;
        }else{
            if (indicatorFrame.size.width == 0) {
                self.jc_width = selectedTitleButton.jc_width;
            }else{
                self.jc_width = indicatorFrame.size.width;
            }
            self.jc_centerX = selectedTitleButton.jc_centerX;
        }
    }
}
@end
