//
//  ViewController.h
//  Picker
//
//  Created by Jérémy Lagrue on 09/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource> 
{
    UIPickerView *_monPickerView;
    UILabel *_label;
    NSArray *_pickerViewArray;
}

@end
