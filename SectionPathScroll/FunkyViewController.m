//
//  FunkyViewController.m
//  SectionPathScroll
//
//  Created by Oleg Langer on 26.03.14.
//  Copyright (c) 2014 Oleg Langer. All rights reserved.
//

#import "FunkyViewController.h"
#import "TableViewController.h"

@interface FunkyViewController ()
@property TableViewController *tvController;

@end

@implementation FunkyViewController

- (void)viewDidLoad {
    NSArray *titles = @[@"Juny", @"July", @"August", @"September", @"October", @"November", @"December", @"January", @"February", @"March", @"April", @"May"];
    [self.horizontalSectionPathView setupWithTitles:titles];
    self.tvController = self.childViewControllers[0];
    self.tvController.sectionTitles = titles;
    self.horizontalSectionPathView.delegate = self.tvController;
    self.tvController.horizontalSectionPathViewDelegate = self.horizontalSectionPathView;
}

@end
