//
//  DHStarView.m
//  Pods
//

#import "DHStarView.h"

@implementation DHStarView

- (instancetype)initWithFillMode:(DHStarViewFill)fillMode {
    self = [super initWithFrame:CGRectMake(0, 0, 12, 12)];
    
    if (self) {
        self.fillMode = fillMode;
        [self initialize];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.fillMode = DHStarViewFillFull;
        [self initialize];
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self initialize];
}

- (void)initialize {
    self.backgroundColor = [UIColor clearColor];
}

- (void)setFillMode:(DHStarViewFill)fillMode {
    _fillMode = fillMode;
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    //// Color Declarations
    UIColor *color = [UIColor colorWithRed: 1 green: 0.561 blue: 0.173 alpha: 1];
    
    CGFloat scale = 0.6;
    
    //// Star Drawing
    UIBezierPath* starPath = UIBezierPath.bezierPath;
    [starPath moveToPoint: CGPointMake(7.5 * scale, 0)];
    [starPath addLineToPoint: CGPointMake(9.18 * scale, 5.19 * scale)];
    [starPath addLineToPoint: CGPointMake(14.63 * scale, 5.18 * scale)];
    [starPath addLineToPoint: CGPointMake(10.21 * scale, 8.38 * scale)];
    [starPath addLineToPoint: CGPointMake(11.91 * scale, 13.57 * scale)];
    [starPath addLineToPoint: CGPointMake(7.5 * scale, 10.35 * scale)];
    [starPath addLineToPoint: CGPointMake(3.09 * scale, 13.57 * scale)];
    [starPath addLineToPoint: CGPointMake(4.79 * scale, 8.38 * scale)];
    [starPath addLineToPoint: CGPointMake(0.37 * scale, 5.18 * scale)];
    [starPath addLineToPoint: CGPointMake(5.82 * scale, 5.19 * scale)];
    [starPath closePath];
    
    starPath.lineWidth = 0.5f;
    if (self.fillMode == DHStarViewFillEmpty || self.fillMode == DHStarViewFillHalf) {
        if (self.fillMode == DHStarViewFillHalf) {
            UIBezierPath* halfStarPath = UIBezierPath.bezierPath;
            [halfStarPath moveToPoint: CGPointMake(7.5 * scale, 0)];
            [halfStarPath addLineToPoint: CGPointMake(7.5 * scale, 10.35 * scale)];
            [halfStarPath addLineToPoint: CGPointMake(3.09 * scale, 13.57 * scale)];
            [halfStarPath addLineToPoint: CGPointMake(4.79 * scale, 8.38 * scale)];
            [halfStarPath addLineToPoint: CGPointMake(0.37 * scale, 5.18 * scale)];
            [halfStarPath addLineToPoint: CGPointMake(5.82 * scale, 5.19 * scale)];
            [halfStarPath closePath];
            [color setFill];
            [halfStarPath fill];
        }
    }
    else if (self.fillMode == DHStarViewFillFull) {
        [color setFill];
        [starPath fill];
    }
    [color setStroke];
    [starPath stroke];
}

@end
