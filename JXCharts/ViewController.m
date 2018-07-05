//
//  ViewController.m
//  JXCharts
//
//  Created by Destiny on 2018/6/15.
//  Copyright © 2018年 Destiny. All rights reserved.
//

#import "ViewController.h"
#import "JXBarChartView.h"
#import "UIView+JXFrame.h"

@interface ViewController ()

@property (strong, nonatomic) JXBarChartView *chartView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setupChartView];
    [self setBarChartData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupChartView
{
    self.chartView = [[JXBarChartView alloc]initWithFrame:CGRectMake(0, 100, self.view.width, 300)];
    self.chartView.barChartMargin = 20;
    self.chartView.barChartWidth = 25;
    self.chartView.yAxisLabelCount = 6;
    [self.view addSubview:self.chartView];
}

- (void)setBarChartData
{
    NSMutableArray *dataArr = [NSMutableArray array];
    NSMutableArray *xAxisDataArr = [NSMutableArray array];
    
    for (int i = 0; i < 50; i++) {
        int num = 20 +  (arc4random() % 100);
        NSString *data = [NSString stringWithFormat:@"%d",num];
        [dataArr addObject:data];
        
        NSString *xAxisData = [NSString stringWithFormat:@"测试数%d",i];
        [xAxisDataArr addObject:xAxisData];
    }
    
    
    self.chartView.barChartData = dataArr;
    self.chartView.xAxisData = xAxisDataArr;
}


@end
