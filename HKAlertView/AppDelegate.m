//
//  AppDelegate.m
//  HKAlertView
//
//  Created by waterhk on 12-9-13.
//  Copyright (c) 2012年 http://www.m439.com/blog/ All rights reserved.
//

#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

#pragma mark -HKDelegate

-(void)HKAlertView:(HKAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSString *str = @"";
    for (UIView *subview in alertView.subviews) {
        if ([subview isKindOfClass:[UITextField class]]) {
            UITextField *textfield = (UITextField *)subview;
            if (subview.tag == 1) {
                str = textfield.text;
            }
        }
    }
    
    if (buttonIndex == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"click index 0" message:nil delegate:self cancelButtonTitle:@"cancle" otherButtonTitles:@"other", nil ];
        [alert show];
        [alert release];
    }
    else if (buttonIndex == 1) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"click index 1, textfield text:" message:str delegate:self cancelButtonTitle:@"cancle" otherButtonTitles:@"other", nil ];
        [alert show];
        [alert release];
    }
}

-(void)onBtn{
    UITextField *passwordField = [[UITextField alloc] initWithFrame:CGRectMake(0,0,0,35)];
    passwordField.font = [UIFont systemFontOfSize:18];
    passwordField.backgroundColor = [UIColor whiteColor];
    passwordField.layer.cornerRadius = 5.0;
    passwordField.keyboardAppearance = UIKeyboardAppearanceAlert;
    passwordField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    passwordField.placeholder = @"input\\";
    passwordField.tag = 1;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 60)];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(0, 10, 80, 50);
    [btn setTitle:@"button" forState:UIControlStateNormal];
    [view addSubview:btn];
    [btn release];
    
    UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"940.jpeg"]];
    img.frame = CGRectMake(100, 10, 140, 50);
    [view addSubview:img];
    [img release];
    
    NSArray *subviews = [[NSArray alloc] initWithObjects:passwordField, view, nil];
    
    HKAlertView *alert = [[HKAlertView alloc] initWithTitle:@"your title" message:@"you message here" subviews:subviews delegate:self cancelButtonTitle:@"cancle" otherButtonTitles:@"other"];
    [alert show];
    [alert release];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];

    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 100, 50)];
   // btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"click me!!" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(onBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:btn];
    [btn release];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
