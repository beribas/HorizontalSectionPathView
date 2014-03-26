//
//  HorizontalSectionPathView.h
//  SectionPathScroll
//
//  Created by Oleg Langer on 26.03.14.
//  Copyright (c) 2014 Oleg Langer. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol TableViewControllerDelegate;

@protocol HorizontalSectionPathViewDelegate <NSObject>

@optional
- (void) sectionPathViewSelectedSectionAtIndex: (int) sectionIndex;
- (void) sectionPathViewSelectedSectionWithTitle: (NSString*) title;

@end

@interface HorizontalSectionPathView : UIView <UIScrollViewDelegate, TableViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) id<HorizontalSectionPathViewDelegate> delegate;

- (void) setupWithTitles: (NSArray*) titles;

@end
