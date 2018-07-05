//
//  JXScrollView.m
//  JXCharts
//
//  Created by Destiny on 2018/7/5.
//  Copyright © 2018年 Destiny. All rights reserved.
//

#import "JXScrollView.h"

@implementation JXScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    
    [self drawGridLine];
}

- (void)setYAxisLabelCount:(NSInteger)yAxisLabelCount
{
    _yAxisLabelCount = yAxisLabelCount;
    [self drawRect:self.bounds];
}

/**
 绘制网格
 */
- (void)drawGridLine
{
    CGFloat height = (self.frame.size.height-30)/_yAxisLabelCount;
    //设置等分数量
    for (NSInteger j = 0; j < _yAxisLabelCount; j ++) {
        
        CGContextRef currentContext = UIGraphicsGetCurrentContext();
        //设置虚线颜色
        CGContextSetStrokeColorWithColor(currentContext, [UIColor blackColor].CGColor);
        //设置虚线宽度
        CGContextSetLineWidth(currentContext, 0.5);
        //设置虚线绘制起点
        CGContextMoveToPoint(currentContext, 0,height*j);
        //设置虚线绘制终点
        CGContextAddLineToPoint(currentContext, self.frame.size.width, height*j);
        //设置虚线排列的宽度间隔:下面的arr中的数字表示先绘制3个点再绘制1个点
        CGFloat arr[] = {3,1};
        //下面最后一个参数“2”代表排列的个数。
        CGContextSetLineDash(currentContext, 0, arr, 2);
        CGContextDrawPath(currentContext, kCGPathStroke);
    }
}


@end
