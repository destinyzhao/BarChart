//
//  YAxisView.h
//  JXCharts
//
//  Created by Destiny on 2018/6/15.
//  Copyright © 2018年 Destiny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YAxisView : UIView

/**字体*/
@property (strong, nonatomic) UIFont *yAxisFont;
/**字体颜色*/
@property (strong, nonatomic) UIColor *yAxisFontColor;
/**Y轴显示Label个数*/
@property (assign, nonatomic) NSInteger yAxisLabelCount;
/**Y轴数据*/
@property (strong, nonatomic) NSMutableArray *yAxisData;

@end
