## What Is It?

JTTimeView is a simple view that can be used programatically or via a storyboard to select time via two sliders. The hours slider turns into a moon or sun icon depending on the time. The code is quite hardcoded to iPhone and my specific purpose at the moment, will make it more themeable if there is uptake :)

## How Do I Use It?¿

Drag a View to your storyboard and set its class to be JTViewType. Setup the required outlets like:

	@property (nonatomic, strong) IBOutlet JTTimeView *timeView;

and set it's delegate to be the view controller:

	self.timeView.delegate = self;

You will need to implement the delegate JTTimeViewDelegate in your view controller and implement the method:

	- (void)timeDidChangeToHours:(NSInteger)hours andMinutes:(NSInteger)minutes;
	
From in there you can then catch the selected hours and minutes, construct a date, populate a text field or log it out. 

## 1000 Words

![](https://github.com/voidet/JTTimeView/blob/master/screen.png?raw=true)