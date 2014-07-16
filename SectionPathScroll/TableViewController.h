//
//  TableViewController.h
//  SectionPathScroll
//
//  Created by Oleg Langer on 26.03.14.
//  Copyright (c) 2014 Oleg Langer. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HorizontalSectionPathView.h"


@interface TableViewController : UITableViewController <HorizontalSectionPathViewDelegate>
@property (nonatomic, strong) NSArray *sectionTitles;
@property (weak, nonatomic) id<TableViewControllerDelegate> horizontalSectionPathViewDelegate;

@end
