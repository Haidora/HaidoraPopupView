//
//  UIViewController+HDPopupView.h
//  Pods
//
//  Created by Dailingchi on 15/5/10.
//
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface UIViewController (HDPopupView)

- (void)popupViewController_HD:(UIViewController *)popupViewController
                      animated:(BOOL)flag
                    completion:(void (^)(void))completion NS_AVAILABLE_IOS(5_0);

- (void)dismissPopupViewControllerAnimated_HD:(BOOL)flag
                                   completion:(void (^)(void))completion NS_AVAILABLE_IOS(5_0);

@end
