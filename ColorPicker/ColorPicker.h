//
//  ColorPicker.h
//  ColorPicker
//
//  Created by Syngmaster on 04/04/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import <UIKit/UIKit.h>


//protocol to pass data from popoverViewController to the main ViewController

@protocol UpdateColorTagDelegate <NSObject>

-(void) popoverControllerDismissed: (UIColor *) colorForView;

@end


@interface ColorPicker : UIViewController <UIPopoverPresentationControllerDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

- (instancetype)initWithColorPicker;

@property UILabel* titleLabel;
@property (strong, nonatomic) UIButton* submitButton;
@property (strong, nonatomic) UIView *toolView;
@property (strong, nonatomic) NSMutableArray *dateArray;
@property (strong, nonatomic) NSArray *colorArray;
@property (strong, nonatomic) UIColor *colorSelected;
@property UICollectionView *colorView;

@property (nonatomic, copy) void (^updateViewColor)(UIColor *responseColor);

@property (nonatomic, assign) id <UpdateColorTagDelegate> myDelegate;

@end





