//
//  DHMoreApps.h
//  MoreApps
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DHMoreAppsViewController.h"

typedef void (^DHDismissBlock)(void);
typedef void (^DHSelectBlock)(NSString *appId);

@interface DHMoreApps : NSObject

@property (nonatomic, copy) DHDismissBlock willDismissBlock, didDismissBlock;
@property (nonatomic, copy) DHSelectBlock didSelectAppBlock;
@property (nonatomic) BOOL showActionButton, showPrice;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *closeButtonTitle;
@property (nonatomic, strong) UIColor *naviTintColor;
@property (nonatomic, strong) UIColor *naviBarTintColor;
@property (nonatomic, strong) NSDictionary<NSAttributedStringKey, id> *naviTextAttr;

+ (DHMoreApps *)sharedManager;

- (void)presentMoreAppsInViewController:(UIViewController *)viewController
                            developerId:(NSString *)devId
                        descriptionType:(DHDescriptionType)type
                             completion:(void (^)(void))completion;

- (void)presentMoreAppsInViewController:(UIViewController *)viewController
                                 appIds:(NSArray *)appIds
                        descriptionType:(DHDescriptionType)type
                             completion:(void (^)(void))completion;



@end
