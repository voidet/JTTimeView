//
//  JTTimeView.m
//
//  Created by Richard S on 18/03/2014.
//  Copyright (c) 2014 Jotlab. All rights reserved.
//

#import "JTTimeView.h"

@interface JTTimeView()

@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, assign) NSInteger hours;
@property (nonatomic, assign) NSInteger minutes;

@end

@implementation JTTimeView

- (id)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		[self setupUI];
	}
	return self;
}

- (void)awakeFromNib {
	[self setupUI];
}

- (void)setupUI {
	CGSize size = self.frame.size;
	NSInteger width = 250;
	float x = (size.width / 2) - (width / 2);

	self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, 0, width, 100)];
	self.timeLabel.textColor = [UIColor whiteColor];
	self.timeLabel.textAlignment = NSTextAlignmentCenter;

	[self addSubview:self.timeLabel];

	UISlider *hours = [[UISlider alloc] initWithFrame:CGRectMake(x, 120, width, 20)];
	[hours addTarget:self action:@selector(hoursChanged:) forControlEvents:UIControlEventValueChanged];
	[hours setMinimumTrackImage:[UIImage imageNamed:@"minSlider"] forState:UIControlStateNormal];
	[hours setThumbImage:[UIImage imageNamed:@"sunTrackThumb"] forState:UIControlStateNormal];
	hours.minimumValue = 0;
	hours.maximumValue = 23;
	self.hours = 9;
	[hours setValue:self.hours];

	UISlider *minutes = [[UISlider alloc] initWithFrame:CGRectMake(x, CGRectGetMaxY(hours.frame) + 30, width, 20)];
	[minutes addTarget:self action:@selector(minutesChanged:) forControlEvents:UIControlEventValueChanged];
	[minutes setMinimumTrackImage:[UIImage imageNamed:@"minSlider"] forState:UIControlStateNormal];
	minutes.minimumValue = 0;
	minutes.maximumValue = 59;
	self.minutes = 0;
	[minutes setValue:self.minutes];

	[self addSubview:hours];
	[self addSubview:minutes];
	[self updateTimeLabel];
}

- (void)updateTimeLabel {
	NSString *hoursString = self.hours > 9 ? [NSString stringWithFormat:@"%i", (int)self.hours] : [NSString stringWithFormat:@"0%i", (int)self.hours];
	NSString *minutesString = self.minutes > 9 ? [NSString stringWithFormat:@"%i",(int)self.minutes] : [NSString stringWithFormat:@"0%i", (int)self.minutes];

	if (self.delegate) {
		[self.delegate timeDidChangeToHours:self.hours andMinutes:self.minutes];
	}
}

- (void)hoursChanged:(UISlider *)sender {
	self.hours = (NSInteger)sender.value;

	if (self.hours < 6 || self.hours > 20) {
		[sender setThumbImage:[UIImage imageNamed:@"moonTrackThumb"] forState:UIControlStateNormal];
	} else {
		[sender setThumbImage:[UIImage imageNamed:@"sunTrackThumb"] forState:UIControlStateNormal];
	}

	[self updateTimeLabel];
}

- (void)minutesChanged:(UISlider *)sender {
	self.minutes = (NSInteger)sender.value;
	[self updateTimeLabel];
}

@end
