//
//  ViewController.h
//  ColorPicker
//
//  Created by Syngmaster on 04/04/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColorPicker.h"

@interface ViewController : UIViewController <UIPopoverPresentationControllerDelegate, UpdateColorTagDelegate>

- (IBAction)showColorPicker:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIView *colorView;

@end


