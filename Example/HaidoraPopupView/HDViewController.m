//
//  HDViewController.m
//  HaidoraPopupView
//
//  Created by mrdaios on 05/08/2015.
//  Copyright (c) 2014 mrdaios. All rights reserved.
//

#import "HDViewController.h"
#import "HDPopupViewController.h"

@interface HDViewController ()

@end

@implementation HDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)modelNav:(id)sender
{
    UIViewController *viewController;
    viewController =
        [[UINavigationController alloc] initWithRootViewController:[[HDViewController alloc] init]];
    [self popupViewController_HD:viewController animated:YES completion:nil];
}

- (IBAction)model:(id)sender
{
    UIViewController *viewController = [[HDViewController alloc] init];
    [self popupViewController_HD:viewController animated:YES completion:nil];
}

- (IBAction)dismiss:(id)sender
{
    [self dismissPopupViewControllerAnimated_HD:YES completion:nil];
}

- (IBAction)popupCustom:(id)sender
{
    UIViewController *viewController = [[HDPopupViewController alloc] init];
    [self popupViewController_HD:viewController animated:YES completion:nil];
}

@end
