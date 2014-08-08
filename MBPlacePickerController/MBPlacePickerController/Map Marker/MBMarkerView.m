//
//  CMPMapMarkerView.m
//  Mapper
//
//  Created by Moshe on 7/28/14.
//  Copyright (c) 2014 CampusMapper. All rights reserved.
//

#import "MBMarkerView.h"

@interface MBMarkerView ()

/**
 *  An outline view that pulses.
 */

@property (nonatomic, strong) UIView *pulsingView;

/**
 *  The maximum diameter of the pulsing ring.
 */

@property (nonatomic, assign) CGFloat maxPulsingSize;


@end

@implementation MBMarkerView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _color = [UIColor blueColor];
        _borderWidth = 2.0f;
        _diameter = 20.0f;
        _pulsingView = [[UIView alloc] init];
        _maxPulsingSize = _diameter;
        _animated = YES;
        self.clipsToBounds = NO;
        self.userInteractionEnabled = NO;
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
    
    [self pulse];
}
/**
 *  Set the color.
 */

- (void)setColor:(UIColor *)color
{
    _color = color;
    
    self.layer.borderColor = color.CGColor;
    self.backgroundColor = [color colorWithAlphaComponent:0.5f];
    
    self.pulsingView.layer.borderColor = [color colorWithAlphaComponent:0.7].CGColor ;
}

/**
 *  Set the border width.
 */

- (void)setBorderWidth:(CGFloat)borderWidth
{
    _borderWidth = borderWidth;
    
    self.layer.borderWidth = borderWidth;
    
    self.pulsingView.layer.borderWidth = borderWidth;
}

/**
 *  Set the diameter.
 */

- (void)setDiameter:(CGFloat)diameter
{
    _diameter = diameter;
    
    if(diameter > 0)
    {
        /**
         *  Set the corner radius
         */
        
        self.layer.cornerRadius = diameter/2.0f;
        
        /**
         *  Set the frame of the view.
         */
        
        CGRect frame = self.frame;
        
        frame.size = CGSizeMake(diameter, diameter);
        
        self.frame = frame;
        
        /**
         *  Set the pulsing view up.
         */
        
        _maxPulsingSize = _diameter;
        
        self.pulsingView.layer.cornerRadius = _maxPulsingSize/2.0f;
    }
}

/***
 *
 */

- (void)pulse
{
    [self addSubview:self.pulsingView];
    
    self.pulsingView.alpha = 0.0f;
    CGRect frame = self.pulsingView.frame;
    frame.size = CGSizeMake(_maxPulsingSize, _maxPulsingSize);
    frame.origin = CGPointMake(0, 0);
    self.pulsingView.layer.cornerRadius = CGRectGetHeight(frame)/2.0;
    self.pulsingView.frame = frame;
    
    self.pulsingView.transform = CGAffineTransformIdentity;

    
    [UIView animateWithDuration:0.9
                          delay: 0.0
                         options: (UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat)
                     animations:^{
                         self.pulsingView.alpha = 1.0;
                         self.pulsingView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.8, 0.8);

                         if (!self.animated) {
                             [self.pulsingView.layer removeAllAnimations];
                         }
                     }
                     completion:^(BOOL finished) {

                     }];
}
@end
