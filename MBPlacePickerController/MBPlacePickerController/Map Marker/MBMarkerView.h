//
//  CMPMapMarkerView.h
//  Mapper
//
//  Created by Moshe on 7/28/14.
//  Copyright (c) 2014 CampusMapper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MBMarkerView : UIView

/**
 *  The border color of the marker.
 */

@property (nonatomic, strong) UIColor *color;

/***
 *  The border width of the marker.
 */

@property (nonatomic, assign) CGFloat borderWidth;

/**
 *  The size of the marker.
 */

@property (nonatomic, assign) CGFloat diameter;

/**
 *
 */

@property (nonatomic, assign) BOOL animated;

@end
