//
//  JXBarChartView.h
//  JXCharts
//
//  Created by Destiny on 2018/6/15.
//  Copyright © 2018年 Destiny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JXBarChartView : UIView

/**Y轴宽度*/
@property (assign, nonatomic) CGFloat yAxisWidth;
/**X轴间距*/
@property (assign, nonatomic) CGFloat xAxismargin;
/**柱形图宽度*/
@property (assign, nonatomic) CGFloat barChartWidth;
/**柱形图间距*/
@property (assign, nonatomic) CGFloat barChartMargin;
/**柱形图数据*/
@property (strong, nonatomic) NSMutableArray *barChartData;
/**X轴数据*/
@property (strong, nonatomic) NSMutableArray *xAxisData;
/**Y轴显示Label个数*/
@property (assign, nonatomic) NSInteger yAxisLabelCount;


@end
