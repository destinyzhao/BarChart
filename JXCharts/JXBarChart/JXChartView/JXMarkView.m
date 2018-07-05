//
//  JXMarkView.m
//  JXCharts
//
//  Created by Destiny on 2018/7/5.
//  Copyright © 2018年 Destiny. All rights reserved.
//

#import "JXMarkView.h"
#import "UIView+JXFrame.h"

@interface JXMarkView ()

@property (strong, nonatomic) UIImageView *bgImgView;
@property (strong, nonatomic) UILabel *textLabel;

@end

@implementation JXMarkView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupBgView];
    }
    return self;
}

- (void)setupBgView
{
    self.bgImgView = [[UIImageView alloc]init];
    self.bgImgView.frame = CGRectMake(0, 0, self.width, self.height);
    self.bgImgView.image = [UIImage imageNamed:@"chart_mark"];
    [self addSubview:self.bgImgView];
    
    self.textLabel = [UILabel new];
    self.textLabel.frame = CGRectMake(0, 0, self.width, self.height);
    self.textLabel.font = [UIFont systemFontOfSize:10.f];
    self.textLabel.textColor = [UIColor whiteColor];
    self.textLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.textLabel];
}

- (void)setValueStr:(NSString *)valueStr
{
    self.textLabel.text = valueStr;
}

@end
