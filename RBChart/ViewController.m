//
//  ViewController.m
//  RBChart
//
//  Created by 天池邵 on 15/7/15.
//  Copyright (c) 2015年 rainbow. All rights reserved.
//

#import "ViewController.h"
#import "RBLineChart.h"
#import "RBBarChart.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    RBLineChart *chart = [[RBLineChart alloc] initWithFrame:CGRectMake(0, 40, CGRectGetWidth([UIScreen mainScreen].bounds), 94)];
    chart.backgroundColor = [UIColor clearColor];
    
    RBLineData *data = [RBLineData new];
    data.values = @[@10, @80, @90, @78, @98, @79, @87];
    RBLineDecorator *lineDecorator = [[RBLineDecorator alloc] initWithHandler:^(RBLineDecorator *decorator) {
        decorator.lineColor = [UIColor colorWithRed:0.095 green:0.744 blue:0.911 alpha:1.000];
        decorator.pointWidth = 5;
        decorator.lineWidth = 2.;
        decorator.lineNode = [[RBLineSolidNode alloc] initWithHandler:^(RBLineSolidNode *node) {
            node.fillColor = [UIColor colorWithRed:0.095 green:0.744 blue:0.911 alpha:1.000];
            node.strokeColor = [UIColor colorWithRed:0.095 green:0.744 blue:0.911 alpha:1.000];
        }];
    }];
    data.lineDecorator = lineDecorator;
    
    RBLineData *data2 = [RBLineData new];
    data2.values = @[@20, @60, @40, @98, @70, @65, @30];
    RBLineDecorator *lineDecorator2 = [[RBLineDecorator alloc] initWithHandler:^(RBLineDecorator *decorator) {
        decorator.lineColor = [UIColor colorWithRed:0.911 green:0.902 blue:0.169 alpha:1.000];
        decorator.pointWidth = 5;
        decorator.lineWidth = 2.;
        decorator.lineNode = [[RBLineHollowNode alloc] initWithHandler:^(RBLineHollowNode *node) {
            node.lineWidth = 2;
            node.strokeColor = [UIColor colorWithRed:0.911 green:0.902 blue:0.169 alpha:1.000];
        }];
    }];
    data2.lineDecorator = lineDecorator2;
    
    [chart setDatas:@[data, data2] titles:@[@"摄入", @"消耗"]];
    
    chart.chartDecorator = [[RBLineChartDecorator alloc] initWithHandler:^(RBLineChartDecorator *decorator) {
        decorator.backgroundColor = [UIColor colorWithRed:0.300 green:0.382 blue:0.715 alpha:1.000];
        decorator.leading = 20;
    }];
    
    chart.maxValue = 120;
    
    [chart handlerTouch:^(NSInteger index, NSArray *values) {
        NSLog(@"index %li values: %@", (long)index, values);
    }];
    [self.view addSubview:chart];
    [chart draw];
    
    RBBarChart *barChart = [[RBBarChart alloc] initWithFrame:CGRectMake(0, 144, CGRectGetWidth([UIScreen mainScreen].bounds), 94)];
    RBBarData *barData = [RBBarData new];
    barData.values = @[@10, @80, @90, @78, @98, @79, @87];
    RBBarDecorator *barDecorator = [[RBBarDecorator alloc] init];
    barDecorator.barColor = [UIColor redColor];
    barData.barDecorator = barDecorator;
    
    RBBarData *barData2 = [RBBarData new];
    barData2.values = @[@20, @60, @40, @98, @70, @65, @30];
    RBBarDecorator *barDecorator2 = [[RBBarDecorator alloc] init];
    barDecorator2.barColor = [UIColor blueColor];
    barData2.barDecorator = barDecorator2;
    
    [barChart setDatas:@[barData, barData2] titles:@[@"摄入", @"消耗"]];
    
    barChart.chartDecorator = [[RBChartDecorator alloc] initWithHandler:^(RBChartDecorator *decorator) {
        decorator.backgroundColor = [UIColor colorWithRed:0.300 green:0.382 blue:0.715 alpha:1.000];
        decorator.leading = 20;
    }];
    
    barChart.maxValue = 120;
    
    [self.view addSubview:barChart];
    [barChart draw];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
