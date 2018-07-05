//
//  XAxisView.h
//  JXCharts
//
//  Created by Destiny on 2018/6/15.
//  Copyright © 2018年 Destiny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XAxisView : UIView

/**字体*/
@property (strong, nonatomic) UIFont *xAxisFont;
/**字体颜色*/
@property (strong, nonatomic) UIColor *xAxisFontColor;
/**chart间隔*/
@property (assign, nonatomic) CGFloat barChartMargin;
/**chart宽度*/
@property (assign, nonatomic) CGFloat barChartWidth;
/**X轴数据*/
@property (strong, nonatomic) NSMutableArray *xAxisData;

@end
