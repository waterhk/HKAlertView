//
//  HKAlertView.h
//  HKAlertView
//
//  Created by waterhk on 12-9-13.
//  Copyright (c) 2012年 http://www.m439.com/blog/ All rights reserved.
//

#import <UIKit/UIKit.h>

@class HKAlertView;

@protocol HKAlertViewDelegate <NSObject>
-(void)HKAlertView:(HKAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
@end

@interface HKAlertView : UIAlertView <UIAlertViewDelegate>{
    NSArray *_subviews;
}
@property (nonatomic, assign) id<HKAlertViewDelegate> HKDelegate;

-(id)initWithTitle:(NSString *)title message:(NSString *)message subviews:(NSArray *)subviews delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...;

@end
