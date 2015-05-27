//
//  ViewController.m
//  TipCtrl
//
//  Created by hesong on 15/5/27.
//  Copyright (c) 2015年 hesong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSMutableArray *messageArray;
    NSMutableArray *messageArray1;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor blueColor];
    messageArray = [NSMutableArray array];
    messageArray1 = [NSMutableArray array];
    [self addMessage];
    [self addMessage1];
    _tipsView = [[CMMessageTipsView alloc]initWithFrame:CGRectMake(20, 100, 90, 25)];
    _tipsView.backgroundColor = [UIColor redColor];
    _tipsView.Delay = 2;
    [_tipsView showTips:messageArray];
    [self.view addSubview:_tipsView];
    
    UIButton *bu = [UIButton buttonWithType:UIButtonTypeContactAdd];
    bu.frame = CGRectMake(100, 200, 40, 40);
    [bu addTarget:self action:@selector(tap) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bu];
    
}

- (void)tap{
    
    [_tipsView showTips:messageArray1];
}

- (void)addMessage{
    for (int i = 0; i < 3; i++) {
        [messageArray addObject:[NSString stringWithFormat:@"这是第%d个tip",i]];
    }
}
- (void)addMessage1{
    for (int i = 0; i < 3; i++) {
        [messageArray1 addObject:[NSString stringWithFormat:@"this is NO.%d tip",i]];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
