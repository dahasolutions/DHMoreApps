//
//  DHMoreAppsViewController.h
//  MoreApps
//

#import <UIKit/UIKit.h>

typedef enum {
    DHDescriptionTypeNone = 0,
    DHDescriptionTypeText,
    DHDescriptionTypeScreenshots,
}
DHDescriptionType;

@class DHMoreAppsViewController;

@protocol DHMoreAppsViewControllerDelegate <NSObject>

@optional

- (void)willDismissMoreAppsViewController:(DHMoreAppsViewController *)moreAppsVC;
- (void)didDismissMoreAppsViewController:(DHMoreAppsViewController *)moreAppsVC;
- (void)moreAppsViewController:(DHMoreAppsViewController *)moreAppsVC didSelectApp:(NSString *)appId;

@end

@interface DHMoreAppsViewController : UIViewController

@property (nonatomic, weak) id <DHMoreAppsViewControllerDelegate> delegate;
@property (nonatomic) BOOL showPrice;
@property (nonatomic) BOOL showActionButton;
@property (nonatomic) NSString *closeButtonTitle;

- (id)initWithDeveloperId:(NSString *)developerId
          descriptionType:(DHDescriptionType)description
                 delegate:(id <DHMoreAppsViewControllerDelegate>)delegate;

- (id)initWithAppIds:(NSArray *)appIds
     descriptionType:(DHDescriptionType)description
            delegate:(id <DHMoreAppsViewControllerDelegate>)delegate;

@end
