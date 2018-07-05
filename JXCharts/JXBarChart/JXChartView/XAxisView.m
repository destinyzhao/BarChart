//
//  XAxisView.m
//  JXCharts
//
//  Created by Destiny on 2018/6/15.
//  Copyright © 2018年 Destiny. All rights reserved.
//

#import "XAxisView.h"
#import "UIView+JXFrame.h"

@interface XAxisView()

@end

@implementation XAxisView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setXAxisFont:(UIFont *)xAxisFont
{
    _xAxisFont = xAxisFont;
}

- (void)setXAxisFontColor:(UIColor *)xAxisFontColor
{
    _xAxisFontColor = xAxisFontColor;
}

- (void)setXAxisData:(NSMutableArray *)xAxisData
{
    _xAxisData = xAxisData;
    
    [self setupXaxisLabel];
}

- (void)setupXaxisLabel
{
    CGFloat labelWidth = self.barChartWidth+self.barChartMargin-1;
    for (NSInteger i = 0; i < _xAxisData.count; i++) {
        
        UILabel *xAxisLabel = [UILabel new];
        xAxisLabel.frame = CGRectMake(i*labelWidth+(i+1)*1+self.barChartMargin/2.0, 2, labelWidth, 20);
        xAxisLabel.font = self.xAxisFont?self.xAxisFont:[UIFont systemFontOfSize:9];
        xAxisLabel.textColor = self.xAxisFontColor?self.xAxisFontColor:[UIColor blackColor];
        xAxisLabel.text = _xAxisData[i];
        xAxisLabel.textAlignment = NSTextAlignmentCenter;
        xAxisLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:xAxisLabel];
    }
}


@end
