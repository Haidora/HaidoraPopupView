//
//  HDPopupViewController.m
//  HaidoraPopupView
//
//  Created by Dailingchi on 15/5/13.
//  Copyright (c) 2015年 mrdaios. All rights reserved.
//

#import "HDPopupViewController.h"
#import <HaidoraPopupView.h>

@interface HDPopupViewController ()

@end

@implementation HDPopupViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before
navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)dismissButton:(id)sender
{
    [self dismissPopupViewControllerAnimated_HD:YES completion:nil];
}
@end
