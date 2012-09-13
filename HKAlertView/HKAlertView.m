//
//  HKAlertView.m
//  HKAlertView
//
//  Created by waterhk on 12-9-13.
//  Copyright (c) 2012年 http://www.m439.com/blog/ All rights reserved.
//

#import "HKAlertView.h"

@implementation HKAlertView

#define TFAlertX       22
#define TFAlertY       45
#define TFAlertWidth   240
#define TFAlertGap     10

@synthesize TFDelegate;

#pragma mark -overload

-(id)initWithTitle:(NSString *)title message:(NSString *)message subviews:(NSArray *)subviews delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...{
    self = [super initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles , nil];
    if (self) {
        // Initialization code
        _subviews = [subviews retain];
    }
    self.TFDelegate = delegate;
    NSLog(@"init subviews : %d", _subviews.count);
    return self;
}

-(void)dealloc{
    [_subviews  release];
    _subviews = nil;
    [super dealloc];
}


#pragma mark -alertview delegate

-(void)willPresentAlertView:(UIAlertView *)alertView{
    //NSLog(@"subviews : %d", _subviews.count);
    if (_subviews) {
        CGRect frame = self.frame;
        CGFloat offsetHeight = TFAlertGap;
        CGFloat offY = TFAlertY;
        if (self.message && self.message!=@"") {
            offY += 24;
        }
        //set subviews frame
        for (UIView *subview in _subviews) {
            CGRect viewFrame = CGRectMake(TFAlertX, offY, TFAlertWidth, subview.frame.size.height);
            viewFrame.origin.y += offsetHeight;
            subview.frame = viewFrame;
            [self addSubview:subview];
            offsetHeight = offsetHeight + subview.frame.size.height + TFAlertGap ;
        }
        //set button frame
        for (UIView *subview in self.subviews) {
            if (![_subviews containsObject:subview]) {
                if ([subview isKindOfClass:[UIButton class]]) {
                    subview.frame = CGRectMake(subview.frame.origin.x, subview.frame.origin.y + offsetHeight, subview.frame.size.width, subview.frame.size.height);
                }
            }
        }
        frame.size.height += offsetHeight;
        self.frame = frame;
    }
    
    // To adjust the position of the AlertView
    CGRect rect = self.superview.frame;
    self.center = CGPointMake(rect.size.width / 2, rect.size.height / 2);
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if ([self.TFDelegate respondsToSelector:@selector(HKAlertView:clickedButtonAtIndex:)]) {
        [self.TFDelegate HKAlertView:self clickedButtonAtIndex:buttonIndex];
    }
}

@end
