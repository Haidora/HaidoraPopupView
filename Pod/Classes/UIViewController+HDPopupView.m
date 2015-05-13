//
//  UIViewController+HDPopupView.m
//  Pods
//
//  Created by Dailingchi on 15/5/10.
//
//

#import "UIViewController+HDPopupView.h"
#import <objc/runtime.h>

static char *kHD_PrivateBackgroundView = "kHD_PrivateBackgroundView";
static char *kHD_PrivatePopupingViewController = "kHD_PrivatePopupingViewController";

@interface UIViewController (HDPopupViewPrivate)

@property (nonatomic, strong) UIViewController *privatePopupingViewController;
@property (nonatomic, strong) UIImageView *privateBackgroundView_HD;

@end

@implementation UIViewController (HDPopupViewPrivate)

@dynamic privateBackgroundView_HD;
@dynamic privatePopupingViewController;

- (UIImageView *)privateBackgroundView_HD
{
    return objc_getAssociatedObject(self, kHD_PrivateBackgroundView);
}

- (void)setPrivateBackgroundView_HD:(UIImageView *)privateBackgroundView_HD
{
    objc_setAssociatedObject(self, kHD_PrivateBackgroundView, privateBackgroundView_HD,
                             OBJC_ASSOCIATION_RETAIN);
}

- (UIViewController *)privatePopupingViewController
{
    return objc_getAssociatedObject(self, kHD_PrivatePopupingViewController);
}

- (void)setPrivatePopupingViewController:(UIViewController *)privatePopupingViewController
{
    objc_setAssociatedObject(self, kHD_PrivatePopupingViewController, privatePopupingViewController,
                             OBJC_ASSOCIATION_RETAIN);
}

@end

@implementation UIViewController (HDPopupView)

#pragma mark
#pragma mark Utils

// https://github.com/AlvaroFranco/AFPopupView/blob/master/AFPopupView.m#L173
- (UIImage *)imageWithView_HDPopupView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.frame.size, view.opaque,
                                           [[UIScreen mainScreen] scale]);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *backgroundImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return backgroundImage;
}

#pragma mark
#pragma mark Public

- (void)popupViewController_HD:(UIViewController *)popupViewController
                      animated:(BOOL)flag
                    completion:(void (^)(void))completion NS_AVAILABLE_IOS(5_0)
{
    NSParameterAssert(popupViewController);
    __weak typeof(self) weakSelf = self;
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];

    UIImageView *imageView = self.privateBackgroundView_HD;
    UIImage *image = [self imageWithView_HDPopupView:window];
    if (nil == imageView)
    {
        imageView = [[UIImageView alloc] initWithFrame:[window bounds]];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.autoresizingMask =
            UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.privateBackgroundView_HD = imageView;
        popupViewController.privatePopupingViewController = self;
    }
    [self presentViewController:popupViewController
                       animated:flag
                     completion:^{
                       NSInteger index = [[window subviews] count] - 1;
                       weakSelf.privateBackgroundView_HD.image = image;
                       [window insertSubview:weakSelf.privateBackgroundView_HD atIndex:index];
                       if (completion)
                       {
                           completion();
                       }
                     }];
}

- (void)dismissPopupViewControllerAnimated_HD:(BOOL)flag
                                   completion:(void (^)(void))completion NS_AVAILABLE_IOS(5_0)
{
    UIViewController *parentViewController =
        self.parentViewController ? self.parentViewController : self;
    UIViewController *topViewController = parentViewController.privatePopupingViewController;
    [self dismissViewControllerAnimated:flag
                             completion:^{
                               if (topViewController.privateBackgroundView_HD)
                               {
                                   [topViewController.privateBackgroundView_HD removeFromSuperview];
                                   topViewController.privateBackgroundView_HD = nil;
                               }
                               if (completion)
                               {
                                   completion();
                               }
                             }];
}

@end
