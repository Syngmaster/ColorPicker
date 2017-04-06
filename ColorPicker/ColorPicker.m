//
//  ColorPicker.m
//  ColorPicker
//
//  Created by Syngmaster on 04/04/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import "ColorPicker.h"

@interface ColorPicker ()

@end

@implementation ColorPicker

- (instancetype)initWithColorPicker;
{
    self = [super init];
    
    if (self) {
        
        _colorArray = [NSArray arrayWithObjects:[UIColor blueColor], [UIColor brownColor],[UIColor grayColor],[UIColor greenColor],[UIColor yellowColor],[UIColor redColor],[UIColor purpleColor],[UIColor magentaColor],[UIColor cyanColor],[UIColor orangeColor],[UIColor darkTextColor],[UIColor lightGrayColor], nil];
        
        
        
        _toolView = [UIView new];
        _toolView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview:_toolView];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[_toolView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_toolView)]];
        
        _titleLabel = [UILabel new];
        [_titleLabel setTextAlignment:NSTextAlignmentCenter];
        [_titleLabel setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline]];
        [_titleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_titleLabel setText:@"The title"];
        [_toolView addSubview:_titleLabel];
        
        _submitButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_submitButton setTitle:@"Dismiss" forState:UIControlStateNormal];
        [_submitButton addTarget:self action:@selector(submitButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
        _submitButton.titleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
        [_submitButton setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_toolView addSubview:_submitButton];
        
        [_toolView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-[_titleLabel]-<=200-[_submitButton]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_titleLabel,_submitButton)]];
        [_toolView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_titleLabel]-|" options:NSLayoutFormatAlignAllCenterY metrics:nil views:NSDictionaryOfVariableBindings(_titleLabel)]];
        [_toolView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_submitButton]-|" options:NSLayoutFormatAlignAllCenterY metrics:nil views:NSDictionaryOfVariableBindings(_submitButton)]];
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _colorView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _colorView.delegate = self;
        _colorView.dataSource = self;
        _colorView.backgroundColor = [UIColor clearColor];
        _colorView.translatesAutoresizingMaskIntoConstraints = NO;
        [_colorView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        [self.view addSubview:_colorView];
        
        
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_toolView(50)]-[_colorView]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_toolView,_colorView)]];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_colorView]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_toolView,_colorView)]];
        
    }
    
    //set size of pop up view
    
    self.modalPresentationStyle = UIModalPresentationPopover;
    self.preferredContentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height/4);
    
    return self;
}


- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    
    return UIModalPresentationNone;
}


-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
    
}

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 12;
    
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [_colorView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.backgroundColor = _colorArray[indexPath.row];
    cell.layer.borderColor = [UIColor blackColor].CGColor;
    cell.layer.borderWidth = 2.0;
    
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(50, 50);
    
}

-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.alpha = 0.5;
    _colorSelected = _colorArray[indexPath.row];
    [self.myDelegate popoverControllerDismissed:_colorSelected];
    //self.updateViewColor(_colorSelected);
    

}


-(void) collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.alpha = 1.0;
    
}


- (void)submitButtonTouched:(id)sender;
{
    [self dismissViewControllerAnimated:NO completion:^{
    }];
}





@end
