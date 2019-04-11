//
//  DHMoreApps.m
//  MoreApps
//

#import "DHMoreApps.h"
#import "DHMoreAppsNavigationController.h"

@interface DHMoreApps() <DHMoreAppsViewControllerDelegate>

@property (nonatomic, strong) DHMoreAppsViewController *moreAppsVC;

@end

@implementation DHMoreApps

+ (DHMoreApps *)sharedManager {
    static DHMoreApps *sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[DHMoreApps alloc] init];
    });
    
    return sharedInstance;
}

- (id)init {
    self = [super init];
    
    if (self) {
        [[UINavigationBar appearanceWhenContainedIn:[DHMoreAppsNavigationController class], nil] setBarTintColor:nil];
        [[UINavigationBar appearanceWhenContainedIn:[DHMoreAppsNavigationController class], nil] setTintColor:nil];
        [[UINavigationBar appearanceWhenContainedIn:[DHMoreAppsNavigationController class], nil] setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
        [[UINavigationBar appearanceWhenContainedIn:[DHMoreAppsNavigationController class], nil] setShadowImage:nil];
        [[UINavigationBar appearanceWhenContainedIn:[DHMoreAppsNavigationController class], nil] setTitleTextAttributes:nil];
        [[UIBarButtonItem appearanceWhenContainedIn:[DHMoreAppsNavigationController class], nil] setTintColor:nil];
    }
    
    return self;
}

- (void)presentMoreAppsInViewController:(UIViewController *)viewController
                            developerId:(NSString *)devId
                        descriptionType:(DHDescriptionType)type
                             completion:(void (^)(void))completion {
    _moreAppsVC = [[DHMoreAppsViewController alloc] initWithDeveloperId:devId
                                                        descriptionType:type
                                                               delegate:self];

    [self presentMoreAppsViewController:_moreAppsVC inViewController:viewController completion:completion];
}

- (void)presentMoreAppsInViewController:(UIViewController *)viewController
                                 appIds:(NSArray *)appIds
                        descriptionType:(DHDescriptionType)type
                             completion:(void (^)(void))completion {
    _moreAppsVC = [[DHMoreAppsViewController alloc] initWithAppIds:appIds
                                                   descriptionType:type
                                                          delegate:self];

    [self presentMoreAppsViewController:_moreAppsVC inViewController:viewController completion:completion];
}

- (void)presentMoreAppsViewController:(DHMoreAppsViewController *)moreAppsVC inViewController:(UIViewController *)viewController completion:(void (^)(void))completion {
    DHMoreAppsNavigationController *navController = [[DHMoreAppsNavigationController alloc] initWithRootViewController:moreAppsVC];
    if (_naviBarTintColor) {
        [navController navigationBar].barTintColor = _naviBarTintColor;
    }
    if (_naviTintColor) {
        [navController navigationBar].tintColor = _naviTintColor;
    }
    if (_naviTextAttr) {
        [navController navigationBar].titleTextAttributes = _naviTextAttr;
    }
    navController.modalPresentationStyle = UIModalPresentationFormSheet;
    
    moreAppsVC.title = _title;
    moreAppsVC.showActionButton = _showActionButton;
    moreAppsVC.showPrice = _showPrice;
    moreAppsVC.closeButtonTitle = _closeButtonTitle;

    [viewController presentViewController:navController animated:YES completion:^{
        if (completion) {
            completion();
        }
    }];
}

- (void)setShowActionButton:(BOOL)showActionButton {
    _showActionButton = showActionButton;
    if (_moreAppsVC) {
        [_moreAppsVC setShowActionButton:showActionButton];
    }
}

- (void)setShowPrice:(BOOL)showPrice {
    _showPrice = showPrice;
    if (_moreAppsVC) {
        [_moreAppsVC setShowPrice:showPrice];
    }
}

- (void)setTitle:(NSString *)title {
    _title = title;
    if (_moreAppsVC) {
        [_moreAppsVC setTitle:title];
    }
}

#pragma mark - DHMoreAppsViewControllerDelegate methods

- (void)willDismissMoreAppsViewController:(DHMoreAppsViewController *)moreAppsVC {
    if (_willDismissBlock) {
        _willDismissBlock();
    }
}

- (void)didDismissMoreAppsViewController:(DHMoreAppsViewController *)moreAppsVC {
    if (_didDismissBlock) {
        _didDismissBlock();
    }
    
    _moreAppsVC = nil;
}

- (void)moreAppsViewController:(DHMoreAppsViewController *)moreAppsVC didSelectApp:(NSString *)appId {
    if (_didSelectAppBlock) {
        _didSelectAppBlock(appId);
    }
}

@end
