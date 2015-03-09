//
//  LoginViewController.m
//  Ribbit
//
//  Created by Samia Al Rahmani on 3/5/15.
//  Copyright (c) 2015 Samia Al Rahmani. All rights reserved.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
}

- (IBAction)login:(id)sender {
    NSString *username = self.usernameField.text;
    NSString *password = self.passwordField.text;
    
    if ([username length] == 0 || [password length] == 0 ) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops!"
                                                            message:@"Make sure you enter a username and password!"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
        [alertView show];
        
    }
    else {
        [PFUser logInWithUsernameInBackground:username password:password
                                        block:^(PFUser *user, NSError *error) {
                                            if (user) {
                                                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry!"
                                                                                                    message:[error.userInfo objectForKey:@"error"]
                                                                                                   delegate:nil
                                                                                          cancelButtonTitle:@"OK" otherButtonTitles:nil];
                                                [alertView show];
                                                
                                            } else {
                                                [self.navigationController popToRootViewControllerAnimated:YES];
                                            }
                                        }];
        
    }

}

@end
