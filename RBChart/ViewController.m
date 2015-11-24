//
//  ViewController.m
//  RBChart
//
//  Created by 天池邵 on 15/7/15.
//  Copyright (c) 2015年 rainbow. All rights reserved.
//

#import "ViewController.h"
#import "RBChartCanvas.h"
#import "RBLine.h"
#import "RBNode.h"
#import "RBLineChart.h"
#import "RBLineChartDrawer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RBLineChart *chart = [[RBLineChart alloc] initWithFrame:CGRectMake(0, 40, CGRectGetWidth([UIScreen mainScreen].bounds), 200)];
    
    RBLineChartDrawer *drawer = [[RBLineChartDrawer alloc] initWithHandler:^(RBLineChartDrawer *drawer) {
        drawer.datas = @[@10, @80, @90, @78, @98, @79, @87];
        drawer.line = [RBLine lineWithType:RBDefaultDashLine];
        drawer.node = [RBNode nodeWithType:TriangleNode];
    }];
    
    RBLineChartDrawer *drawer2 = [[RBLineChartDrawer alloc] initWithHandler:^(RBLineChartDrawer *drawer) {
        drawer.datas = @[@20, @60, @40, @98, @70, @65, @30];
        drawer.line = [RBLine lineWithType:RBDefaultYellowLine];
        drawer.node = [RBNode nodeWithType:RBDefaultYellowNode];
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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
