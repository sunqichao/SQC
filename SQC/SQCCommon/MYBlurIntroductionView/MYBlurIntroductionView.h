//
//  MYBlurIntroductionView.h
//  MYBlurIntroductionView-Example
//
//  Created by Matthew York on 10/16/13.
//  Copyright (c) 2013 Matthew York. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "AMBlurView.h"
#import "MYIntroductionPanel.h"
#import "SQCLoginViewController.h"
#import "SQCRegisterViewController.h"

#define DismissLoginAndRegisterTime 1.0f

static UIColor *kBlurTintColor = nil;
static const CGFloat kPageControlWidth = 148;
static const CGFloat kLeftRightSkipPadding = 10;
static UIFont *kSkipButtonFont = nil;

typedef enum {
    SQCLoginAppearYES = 0,
    SQCLoginAppearNO = 1
    
}SQCLoginAppear;

//Enum to define types of introduction finishes
typedef enum {
    MYFinishTypeSwipeOut = 0,
    MYFinishTypeSkipButton
}MYFinishType;

//Enum to define language direction
typedef enum {
    MYLanguageDirectionLeftToRight = 0,
    MYLanguageDirectionRightToLeft
}MYLanguageDirection;

@class MYBlurIntroductionView;

/******************************/
//Delegate Method Declarations
/******************************/
@protocol MYIntroductionDelegate
@optional
-(void)introduction:(MYBlurIntroductionView *)introductionView didFinishWithType:(MYFinishType)finishType;
-(void)introduction:(MYBlurIntroductionView *)introductionView didChangeToPanel:(MYIntroductionPanel *)panel withIndex:(NSInteger)panelIndex;
@end

/******************************/
//MYBlurIntroductionView
/******************************/
@interface MYBlurIntroductionView : UIView <UIScrollViewDelegate>{
    NSArray *Panels;
    
    NSInteger LastPanelIndex;
}

/******************************/
//Properties
/******************************/

//Delegate
@property (weak) id <MYIntroductionDelegate> delegate;

@property (nonatomic, retain) AMBlurView *BlurView;
@property (nonatomic, retain) UIView *BackgroundColorView;
@property (retain, nonatomic) UIImageView *BackgroundImageView;
@property (retain, nonatomic) UIScrollView *MasterScrollView;
@property (retain, nonatomic) UIPageControl *PageControl;
@property (retain, nonatomic) UIButton *RightSkipButton;
@property (retain, nonatomic) UIButton *LeftSkipButton;
@property (nonatomic ,retain) UIButton *loginButton;
@property (nonatomic ,retain) UIButton *registerButton;
@property (nonatomic, assign) NSInteger CurrentPanelIndex;
@property (nonatomic, assign) MYLanguageDirection LanguageDirection;
@property (nonatomic ,assign) SQCLoginAppear isLogin;
@property (nonatomic ,retain) SQCLoginViewController *loginController;
@property (nonatomic ,retain) SQCRegisterViewController *registerController;

//Construction Methods
-(void)buildIntroductionWithPanels:(NSArray *)panels;

//Interaction Methods
- (IBAction)didPressSkipButton;
-(void)changeToPanelAtIndex:(NSInteger)index;

//Enables or disables use of the introductionView. Use this if you want to hold someone on a panel until they have completed some task
-(void)setEnabled:(BOOL)enabled;

//Customization Methods
-(void)setBlurTintColor:(UIColor *)blurTintColor;
@end
