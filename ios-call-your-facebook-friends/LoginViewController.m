//
//  LoginViewController.m
//  ios-call-your-facebook-friends
//
//  Created by Ali Minty on 6/21/15.
//  Copyright (c) 2015 Ali Minty. All rights reserved.
//

#import "LoginViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>

@interface LoginViewController ()
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    loginButton.readPermissions = @[@"user_friends"];
    
    loginButton.center = self.view.center;
    [self.view addSubview:loginButton];
    
    [FBSDKProfile enableUpdatesOnAccessTokenChange:YES];
    
    if ([FBSDKAccessToken currentAccessToken]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"UserDidLoginNotification"
                                                            object:nil
                                                          userInfo:@{@"userId" : [[FBSDKAccessToken currentAccessToken] userID]}];
        
        [self performSegueWithIdentifier:@"showMaster" sender:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)ContinueAction:(id)sender {
    if ([FBSDKAccessToken currentAccessToken]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"UserDidLoginNotification"
                                                            object:nil
                                                          userInfo:@{@"userId" : [[FBSDKAccessToken currentAccessToken] userID]}];
        
        [self performSegueWithIdentifier:@"showMaster" sender:nil];
    }
}
@end
