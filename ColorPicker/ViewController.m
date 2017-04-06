//
//  ViewController.m
//  ColorPicker
//
//  Created by Syngmaster on 04/04/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import "ViewController.h"
#import "ColorPicker.h"

@interface ViewController () {
    
    ColorPicker *color;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    color = [[ColorPicker alloc] initWithColorPicker];
    color.myDelegate = self;

}


- (IBAction)showColorPicker:(UIButton *)sender {
    
    [self setPopOver];
    [self presentViewController:color animated:false completion:^{
    }];
}


-(void) popoverControllerDismissed:(UIColor *)colorForView {
    
    _colorView.backgroundColor = colorForView;
    
}



-(void) setPopOver {
    
    UIPopoverPresentationController *pc = [color popoverPresentationController];
    pc.sourceRect = CGRectMake(0, self.view.frame.size.height, 0.0, 0.0);
    pc.delegate = self;
    pc.sourceView = self.view;
    pc.permittedArrowDirections = 0;
    
    
}

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    
    return UIModalPresentationNone;
}

@end
