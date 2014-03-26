//
//  TableViewController.h
//  SectionPathScroll
//
//  Created by Oleg Langer on 26.03.14.
//  Copyright (c) 2014 Oleg Langer. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HorizontalSectionPathViewDelegate;

@protocol TableViewControllerDelegate <NSObject>

@optional
- (void) tableViewWillDisplaySectionAtIndex: (int)sectionIndex;
- (void) tableViewWillDisplaySectionWithTitle: (NSString*) title;

@end

@interface TableViewController : UITableViewController <HorizontalSectionPathViewDelegate>
@property (nonatomic, strong) NSArray *sectionTitles;
@property (weak, nonatomic) id<TableViewControllerDelegate> horizontalSectionPathViewDelegate;

@end
