//
//  TableViewController.h
//  ObjPopoverPresentationController
//
//  Created by Kai Windle on 26/10/2015.
//  Copyright © 2015 Kai Windle. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UpdatePresentingViewControllerWithData <NSObject>

-(void)updateViewWithSelectedData:(NSString *)selectedString;

@end

@interface TableViewController : UITableViewController

@property (nonatomic, assign) id<UpdatePresentingViewControllerWithData> deleagate;

@end
