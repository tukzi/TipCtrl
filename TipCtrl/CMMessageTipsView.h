//
//  CMMessageTipsView.h
//  TipCtrl
//
//  Created by hesong on 15/5/27.
//  Copyright (c) 2015年 hesong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMMessageTipsView : UIView

@property(nonatomic,strong)UILabel *tipView;
@property(nonatomic,strong)UILabel *showTipView;

@property (nonatomic) NSTimeInterval Delay;

-(void)showTips:(NSMutableArray *)tipsArray;

@end
