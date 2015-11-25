//
//  ViewController.m
//  RBChart
//
//  Created by 天池邵 on 15/7/15.
//  Copyright (c) 2015年 rainbow. All rights reserved.
//

#import "ViewController.h"
#import "RBPie.h"
#import "RBChart.h"
#import "RBPieChartDrawer.h"
#import "RBChartDefines.h"
#import "RBBarChartDrawer.h"
#import "RBChartBar.h"
#import "RBChartCanvas.h"
#import "RBChartLine.h"
#import "RBChartNode.h"
#import "RBLineChartDrawer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RBChart *chart = [RBChart chartWithType:RBDefaultLineChart];
    chart.frame = CGRectMake(0, 40, CGRectGetWidth([UIScreen mainScreen].bounds), 200);
    
    RBLineChartDrawer *drawer = [[RBLineChartDrawer alloc] initWithHandler:^(RBLineChartDrawer *drawer) {
        drawer.datas = @[@10, @80, @90, @78, @98, @79, @87];
        drawer.line = [RBChartLine lineWithType:RBDefaultDashLine];
        drawer.node = [RBChartNode nodeWithType:TriangleNode];
    }];
    
    RBLineChartDrawer *drawer2 = [[RBLineChartDrawer alloc] initWithHandler:^(RBLineChartDrawer *drawer) {
        drawer.datas = @[@20, @60, @40, @98, @70, @65, @30];
        drawer.line = [RBChartLine lineWithType:RBDefaultYellowLine];
        drawer.node = [RBChartNode nodeWithType:RBDefaultYellowNode];
    }];
    
    RBChartCanvas *canvas = [RBChartCanvas canvasWithType:RBGridCanvas];
    [canvas setupProperty:^(RBChartCanvas *canvas) {
        canvas.leading = 20.;
        canvas.backgroundColor = [UIColor colorWithRed:0.300 green:0.382 blue:0.715 alpha:1.000];
        canvas.maxValue = 120;
        canvas.drawers = @[drawer, drawer2];
    }];
    
    chart.canvas = canvas;
    
    [self.view addSubview:chart];
    
    // Bar chart
    
    RBChart *barChart = [RBChart chartWithType:RBDefaultBarChart];
    barChart.frame = CGRectMake(0, 260, CGRectGetWidth([UIScreen mainScreen].bounds), 200);
    RBBarChartDrawer *barDrawer1 = [[RBBarChartDrawer alloc] initWithHandler:^(RBBarChartDrawer *drawer) {
        drawer.datas = @[@10, @80, @90, @78, @98, @79, @87];
        drawer.bar = [[RBChartBar alloc] initWithHandler:^(RBChartBar *bar) {
            bar.barColor = kRBDefaultBlue;
        }];
    }];
    
    RBBarChartDrawer *barDrawer2 = [[RBBarChartDrawer alloc] initWithHandler:^(RBBarChartDrawer *drawer) {
        drawer.datas = @[@20, @60, @40, @98, @70, @65, @30];
        drawer.bar = [[RBChartBar alloc] initWithHandler:^(RBChartBar *bar) {
            bar.barColor = kRBDefaultYellow;
        }];
    }];
    
    RBChartCanvas *barChartCanvas = [RBChartCanvas canvasWithType:RBDefaultCanvas];
    [barChartCanvas setupProperty:^(RBChartCanvas *canvas) {
        canvas.leading = 20.;
        canvas.backgroundColor = [UIColor colorWithRed:0.300 green:0.382 blue:0.715 alpha:1.000];
        canvas.maxValue = 120;
        canvas.drawers = @[barDrawer1, barDrawer2];
    }];
    
    barChart.canvas = barChartCanvas;
    [self.view addSubview:barChart];
    
    // Pie Chart
    
    RBChart *pieChart = [RBChart chartWithType:RBDefaultPieChart];
    pieChart.frame = CGRectMake(0, 480, CGRectGetWidth([UIScreen mainScreen].bounds), 200);
    RBPieChartDrawer *pieDrawer = [[RBPieChartDrawer alloc] initWithHandler:^(RBPieChartDrawer *drawer) {
        drawer.datas = @[@10, @80, @90, @78, @98, @79, @87];
        drawer.pie = [[RBPie alloc] initWithHandler:^(RBPie *pie) {
            pie.colors = @[[UIColor colorWithRed:0.616 green:0.671 blue:0.890 alpha:1.000],
                           [UIColor colorWithRed:0.431 green:0.506 blue:0.804 alpha:1.000],
                           [UIColor colorWithRed:0.702 green:0.612 blue:0.894 alpha:1.000],
                           [UIColor colorWithRed:0.545 green:0.427 blue:0.804 alpha:1.000],
                           [UIColor colorWithRed:1.000 green:0.953 blue:0.651 alpha:1.000],
                           [UIColor colorWithRed:1.000 green:0.925 blue:0.478 alpha:1.000],
                           [UIColor colorWithRed:1.000 green:0.894 blue:0.651 alpha:1.000]];
        }];
    }];
    
    RBChartCanvas *pieChartCanvas = [RBChartCanvas canvasWithType:RBDefaultCanvas];
    [pieChartCanvas setupProperty:^(RBChartCanvas *canvas) {
        canvas.leading = 20.;
        canvas.backgroundColor = [UIColor colorWithRed:0.300 green:0.382 blue:0.715 alpha:1.000];
        canvas.maxValue = 120;
        canvas.drawers = @[pieDrawer];
    }];
    
    pieChart.canvas = pieChartCanvas;
    [self.view addSubview:pieChart];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
