//
//  YAxisView.m
//  JXCharts
//
//  Created by Destiny on 2018/6/15.
//  Copyright © 2018年 Destiny. All rights reserved.
//

#import "YAxisView.h"
#import "UIView+JXFrame.h"

@implementation YAxisView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setYAxisFont:(UIFont *)yAxisFont
{
    _yAxisFont = yAxisFont;
}

- (void)setYAxisFontColor:(UIColor *)yAxisFontColor
{
    _yAxisFontColor = yAxisFontColor;
}

- (void)setYAxisLabelCount:(NSInteger)yAxisLabelCount
{
    _yAxisLabelCount = yAxisLabelCount;
}

- (void)setYAxisData:(NSMutableArray *)yAxisData
{
    _yAxisData = yAxisData;
    
    [self setupYaxisLabel];
}

- (void)setupYaxisLabel
{
    CGFloat labelWidth = self.width;
    CGFloat labelHeight = 18;
    CGFloat originY = self.height/_yAxisLabelCount;
    
    CGFloat maxValue = [[_yAxisData valueForKeyPath:@"@max.floatValue"] floatValue];
    
    for (NSInteger i = 0; i < _yAxisLabelCount; i++) {
        
        UILabel *yAxisLabel = [UILabel new];
        yAxisLabel.frame = CGRectMake(0,originY*i-5, labelWidth, labelHeight);
        yAxisLabel.font = self.yAxisFont?self.yAxisFont:[UIFont systemFontOfSize:9];
        yAxisLabel.textColor = self.yAxisFontColor?self.yAxisFontColor:[UIColor blackColor];
        
        yAxisLabel.text = i== 0?@"":[NSString stringWithFormat:@"%.0f",maxValue/i];
        yAxisLabel.textAlignment = NSTextAlignmentCenter;
        yAxisLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:yAxisLabel];
    }
}

@end
