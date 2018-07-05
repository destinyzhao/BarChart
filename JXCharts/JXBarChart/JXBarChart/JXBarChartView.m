//
//  JXBarChartView.m
//  JXCharts
//
//  Created by Destiny on 2018/6/15.
//  Copyright © 2018年 Destiny. All rights reserved.
//

#import "JXBarChartView.h"
#import "XAxisView.h"
#import "YAxisView.h"
#import "JXBarChart.h"
#import "UIView+JXFrame.h"
#import "JXScrollView.h"
#import "JXMarkView.h"

/**Y轴默认宽度*/
static CGFloat KDefaultYAxisWidth = 40;
/**X轴默认高度*/
static CGFloat KDefaultXAxisHeight = 30;
/**Y轴默认显示Label个数*/
static NSInteger KDefaultYAxisLabelCount = 5;
/**默认BarChart宽度*/
static CGFloat KDefaultBarChartWidth = 30;
/**默认BarChart Margin*/
static CGFloat KDefaultBarChartMargin = 20;

@interface JXBarChartView()<UIScrollViewDelegate>


/**scrollView*/
@property (strong, nonatomic) JXScrollView *scrollView;
/**Y轴View*/
@property (strong, nonatomic) YAxisView *yAxisView;
/**X轴View*/
@property (strong, nonatomic) XAxisView *xAxisView;
/**X轴线*/
@property (strong, nonatomic) UIView *xAxisLine;
/**Y轴线*/
@property (strong, nonatomic) UIView *yAxisLine;
/** 最大值 默认为数据源中的最大值*/
@property(nonatomic,assign)CGFloat  maxValue;
/**mark View*/
@property (strong, nonatomic) JXMarkView *markView;

@end

@implementation JXBarChartView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (JXScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[JXScrollView alloc]init];
        _scrollView.delegate = self;
        _scrollView.backgroundColor = [UIColor clearColor];
        _scrollView.bounces = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
    }
    return _scrollView;
}

- (XAxisView *)xAxisView
{
    if (!_xAxisView) {
        _xAxisView = [XAxisView new];
        _xAxisView.backgroundColor = [UIColor clearColor];
    }
    return _xAxisView;
}

- (UIView *)xAxisLine
{
    if (!_xAxisLine) {
        _xAxisLine = [UIView new];
        _xAxisLine.backgroundColor = [UIColor blackColor];
    }
    return _xAxisLine;
}

- (YAxisView *)yAxisView
{
    if (!_yAxisView) {
        _yAxisView = [YAxisView new];
        _yAxisView.backgroundColor = [UIColor clearColor];
    }
    return _yAxisView;
}

- (UIView *)yAxisLine
{
    if (!_yAxisLine) {
        _yAxisLine = [UIView new];
        _yAxisLine.backgroundColor = [UIColor blackColor];
    }
    return _yAxisLine;
}

- (JXMarkView *)markView
{
    if (!_markView) {
        _markView = [[JXMarkView alloc]initWithFrame:CGRectMake(0, 0, 100, 32)];
        _markView.backgroundColor = [UIColor clearColor];
    }
    return _markView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupChartView];
    }
    return self;
}

- (void)layoutSubviews
{
    
}

/**
 初始化
 */
- (void)setupChartView
{
    self.yAxisView.frame = CGRectMake(0, 0, KDefaultYAxisWidth, self.height-KDefaultXAxisHeight);
    [self addSubview:self.yAxisView];
    
    self.scrollView.frame = CGRectMake(self.yAxisView.width, 0, self.width-self.yAxisView.width-10, self.height);
    [self addSubview:self.scrollView];
    
    [self.scrollView addSubview:self.xAxisView];
    
    [self addSubview:self.yAxisLine];
    [self addSubview:self.xAxisLine];
}

/**
 设置Y轴的宽度

 @param yAxisWidth 宽度
 */
- (void)setYAxisWidth:(CGFloat)yAxisWidth
{
    CGRect frame = self.yAxisView.frame;
    frame.size.width = yAxisWidth;
    self.yAxisView.frame = frame;
}

/**
 设置柱形图数据

 @param barChartData 柱形图数据
 */
- (void)setBarChartData:(NSMutableArray *)barChartData
{
    _barChartData = barChartData;
    self.maxValue = [[_barChartData valueForKeyPath:@"@max.floatValue"] floatValue];
    [self drawBarChart];
    self.yAxisView.yAxisData = barChartData;
    [self scrollViewDidScroll:_scrollView];
}


/**
 设置X轴数据

 @param xAxisData X轴数据
 */
- (void)setXAxisData:(NSMutableArray *)xAxisData
{
    self.xAxisView.barChartWidth = self.barChartWidth;
    self.xAxisView.barChartMargin = self.barChartMargin;
    
    [self.xAxisView setXAxisData:xAxisData];
}

/**
 绘制柱形图
 */
- (void)drawBarChart
{
    for (NSInteger i = 0; i < _barChartData.count; i++) {
        // 柱形图高度
        CGFloat barHeight = (self.scrollView.height-KDefaultXAxisHeight) * [self.barChartData[i] floatValue] / self.maxValue - self.markView.height-10;
        // 柱形图 Origin y
        CGFloat barOriginY = self.scrollView.height-KDefaultXAxisHeight-barHeight;
        // margin
        CGFloat margin = (i+1)*self.barChartMargin;
        
        JXBarChart *barChart = [JXBarChart new];
        barChart.frame = CGRectMake(i*self.barChartWidth + margin, barOriginY, self.barChartWidth, barHeight);
        barChart.backgroundColor = [UIColor greenColor];
        [self.scrollView addSubview:barChart];
    }
    
    [self.scrollView addSubview:self.markView];

    [self updateViewFrame];
}

/**
 更新坐标
 */
- (void)updateViewFrame
{
    [self.scrollView setContentSize:CGSizeMake(_barChartData.count*(self.barChartWidth+self.barChartMargin)+120,0)];
    
    self.xAxisView.frame = CGRectMake(0, self.height-KDefaultXAxisHeight, self.scrollView.contentSize.width, KDefaultXAxisHeight);
    
    self.xAxisLine.frame = CGRectMake(KDefaultYAxisWidth-1, self.xAxisView.top, self.scrollView.width, 0.5);
    self.yAxisLine.frame = CGRectMake(KDefaultYAxisWidth-1, 0, 0.6, self.yAxisView.height);
    
    self.yAxisLabelCount = self.yAxisLabelCount>0?self.yAxisLabelCount:KDefaultYAxisLabelCount;
}

/**
 设置Y轴Label个数

 @param yAxisLabelCount 数量
 */
- (void)setYAxisLabelCount:(NSInteger)yAxisLabelCount
{
    _yAxisLabelCount = yAxisLabelCount;
    _scrollView.yAxisLabelCount = yAxisLabelCount;
    self.yAxisView.yAxisLabelCount = yAxisLabelCount;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    [self markViewScroll:scrollView];
}

- (void)markViewScroll:(UIScrollView *)scrollView
{
   
    CGFloat barChartWidth = _barChartWidth>0?_barChartWidth:KDefaultBarChartWidth;
    CGFloat barChartMargin = _barChartMargin>0?_barChartMargin:KDefaultBarChartMargin;
    CGFloat contentOffsetX = scrollView.contentOffset.x;
    CGSize contentSize = scrollView.contentSize;

    CGFloat originX = _barChartData.count * (barChartWidth+barChartMargin) * scrollView.contentOffset.x / (scrollView.contentSize.width - scrollView.width)+_barChartWidth;
    
    NSInteger index = contentOffsetX * _barChartData.count/ (contentSize.width-self.bounds.size.width+30);
    
    if (self.barChartData.count > index) {
        // 柱形图高度
        CGFloat barHeight = (self.scrollView.height-KDefaultXAxisHeight) * [self.barChartData[index] floatValue] / self.maxValue - self.markView.height-10;
        
        CGRect rect = self.markView.frame;
        rect.origin.x = originX;
        rect.origin.y = self.scrollView.height-KDefaultXAxisHeight-barHeight-self.markView.height-5;
        _markView.frame = rect;
        
        self.markView.valueStr = [NSString stringWithFormat:@"%@",_barChartData[index]];
    }
}
@end
