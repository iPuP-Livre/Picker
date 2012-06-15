//
//  ViewController.m
//  Picker
//
//  Created by Jérémy Lagrue on 09/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    _monPickerView = [[UIPickerView alloc] initWithFrame:CGRectZero];
    CGSize pickerSize = [_monPickerView sizeThatFits:CGSizeZero];
    
    CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
    CGRect pickerRect = CGRectMake( 0.0,
                                   screenRect.size.height - 84.0 - pickerSize.height,
                                   pickerSize.width,
                                   pickerSize.height);
    
    _monPickerView.frame = pickerRect;
    _monPickerView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    _monPickerView.showsSelectionIndicator = YES;
    _monPickerView.delegate = self;
    _monPickerView.dataSource = self;
    [self.view addSubview:_monPickerView];
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(10, 30, 200, 20)];
    _label.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_label];
    
    _pickerViewArray = [[NSArray alloc] initWithObjects:@"Element 1",             @"Element 2", @"Element 3", @"Element 4", @"Element 5", @"Element 6", @"Element 7", nil];
    
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark -
#pragma mark UIPickerViewDelegate

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    _label.text = [NSString stringWithFormat:@"%@ - %d",
                   [_pickerViewArray objectAtIndex:[pickerView selectedRowInComponent:0]],
                   [pickerView selectedRowInComponent:1]];  
}
#pragma mark -
#pragma mark UIPickerViewDataSource

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *returnStr = @"";
    if (component == 0)
    {
        returnStr = [_pickerViewArray objectAtIndex:row];
    }
    else
    {
        returnStr = [[NSNumber numberWithInt:row] stringValue];
    }
    return returnStr;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    CGFloat componentWidth = 0.0;    
    if (component == 0)
        componentWidth = 240.0;
    else
        componentWidth = 40.0;
    
    return componentWidth;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 40.0;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [_pickerViewArray count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

@end
