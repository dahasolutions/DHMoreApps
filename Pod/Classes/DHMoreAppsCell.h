//
//  DHMoreAppsCell.h
//  MoreApps
//

#import <UIKit/UIKit.h>
#import "DHButtonCell.h"
#import "DHStarView.h"

#define SPACE_BETWEEN_CELLS 20.0f

@class DHMoreAppsCell;

@protocol DHMoreAppsCellDelegate <NSObject>

@optional

- (void)moreAppsCell:(DHMoreAppsCell *)cell buttonPressed:(UIButton *)button;
- (void)moreAppsCell:(DHMoreAppsCell *)cell heightCalculated:(CGFloat)height tag:(NSInteger)tag;

@end

@interface DHMoreAppsCell : UITableViewCell

@property (strong, nonatomic) UIImageView *imageViewIcon;
@property (strong, nonatomic) UILabel *labelTitle;
@property (strong, nonatomic) UILabel *labelSubtitle;
@property (strong, nonatomic) UILabel *labelReviewsCount;
@property (strong, nonatomic) DHButtonCell *buttonAction;
@property (strong, nonatomic) DHStarView *imageViewStar1;
@property (strong, nonatomic) DHStarView *imageViewStar2;
@property (strong, nonatomic) DHStarView *imageViewStar3;
@property (strong, nonatomic) DHStarView *imageViewStar4;
@property (strong, nonatomic) DHStarView *imageViewStar5;

@property (strong, nonatomic) UIImageView *imageViewScreenshotLandscape;
@property (strong, nonatomic) UIImageView *imageViewScreenshotPortrait1;
@property (strong, nonatomic) UIImageView *imageViewScreenshotPortrait2;

@property (strong, nonatomic) UILabel *labelDescription;
@property (strong, nonatomic) NSLayoutConstraint *labelDescriptionHeightConstraint;

@property (weak, nonatomic) id <DHMoreAppsCellDelegate> delegate;

- (void)setNumberOfStars:(CGFloat)stars;
- (void)showButton:(BOOL)show;

- (void)setPortraitScreenshot:(UIImage *)image position:(NSInteger)position;
- (void)setLandscapeScreenshot:(UIImage *)screenshot;

- (void)setTextDescription:(NSString *)text;

@end
