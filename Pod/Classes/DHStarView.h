//
//  DHStarView.h
//  Pods
//

#import <UIKit/UIKit.h>

typedef enum
{
    DHStarViewFillEmpty,
    DHStarViewFillHalf,
    DHStarViewFillFull
}
DHStarViewFill;

@interface DHStarView : UIView

- (instancetype)initWithFillMode:(DHStarViewFill)fillMode;

@property (nonatomic) DHStarViewFill fillMode;

@end
