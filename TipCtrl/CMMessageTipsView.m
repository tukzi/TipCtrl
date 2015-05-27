//
//  CMMessageTipsView.m
//  TipCtrl
//
//  Created by hesong on 15/5/27.
//  Copyright (c) 2015年 hesong. All rights reserved.
//

#import "CMMessageTipsView.h"

@implementation CMMessageTipsView{
    NSMutableArray *_queuedTips;
    NSMutableArray *_queuedTemp;
    BOOL isRun;
}


- (id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self){
        self.clipsToBounds = YES;
        isRun = NO;
        _queuedTips = [[NSMutableArray alloc] init];
        _queuedTemp = [[NSMutableArray alloc]init];
        _tipView = [[UILabel alloc] initWithFrame:self.bounds];
        _tipView.center = CGPointMake(_tipView.center.x-5, -10);
        _tipView.textAlignment = NSTextAlignmentCenter;
        _tipView.textColor = [UIColor whiteColor];
        _tipView.font = [UIFont boldSystemFontOfSize:12];
        _showTipView = [[UILabel alloc] initWithFrame:self.bounds];
        _showTipView.center = CGPointMake(_showTipView.center.x-5, _showTipView.center.y);
        _showTipView.textAlignment = NSTextAlignmentCenter;
        _showTipView.textColor = [UIColor whiteColor];
        _showTipView.font = [UIFont boldSystemFontOfSize:12];
        _showTipView.hidden = YES;
        [self addSubview:_tipView];
        [self addSubview:_showTipView];
    }
    
    return self;
}

- (void)setTip:(NSString *) tip
{
    _tipView.text = tip;
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        _tipView.transform = CGAffineTransformMakeTranslation(0, 20);
        
        if(!_showTipView.hidden)
        {
            _showTipView.transform = CGAffineTransformMakeTranslation(0, 10);
            _showTipView.alpha = 0;
        }
    } completion:^(BOOL finished) {
        _tipView.transform = CGAffineTransformMakeTranslation(0,0);
        _showTipView.text = tip;
        _showTipView.hidden = NO;
        _showTipView.transform = CGAffineTransformMakeTranslation(0, 0);
        _showTipView.alpha = 1;
    }];
}

-(void) endTip
{
   
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
     if(!_showTipView.hidden)
        {
            _showTipView.transform = CGAffineTransformMakeTranslation(0, 10);
            _showTipView.alpha = 0;
        }
    } completion:^(BOOL finished) {
        _tipView.transform = CGAffineTransformMakeTranslation(0,0);
        _showTipView.hidden = YES;
        _showTipView.transform = CGAffineTransformMakeTranslation(0, 0);
        _showTipView.alpha = 1;
    }];
}

-(void)showTips:(NSMutableArray *)tipsArray{
    [_queuedTips removeAllObjects];
    [_queuedTemp removeAllObjects];
    
    [_queuedTips addObjectsFromArray:tipsArray];
    [_queuedTemp addObjectsFromArray:tipsArray];
    
    if(isRun)
        return;
    
    [self RunQueued];
}

-(void)RunQueued
{
    NSString *tip = [_queuedTemp lastObject];
    if(tip == nil)
    {
        if(isRun)
        {
            [self endTip];
        }
        isRun = NO;
        return;
    }
    isRun = YES;
    [_queuedTemp removeLastObject];
    if (_queuedTemp.count == 0) {
        [_queuedTemp addObjectsFromArray:_queuedTips];
    }
    
    [self setTip:tip];
    [self performSelector:@selector(RunQueued) withObject:nil afterDelay:_Delay + 1];
    
}

@end
