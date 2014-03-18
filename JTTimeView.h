//
//  JTTimeView.h
//
//  Created by Richard S on 18/03/2014.
//  Copyright (c) 2014 Jotlab. All rights reserved.
//

@protocol JTTimeSelectorDelegate

- (void)timeDidChangeToHours:(NSInteger)hours andMinutes:(NSInteger)minutes;

@end

@interface JTTimeView : UIView

@property (nonatomic, weak) id <JTTimeSelectorDelegate>delegate;

@end
