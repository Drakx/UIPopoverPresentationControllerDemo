//
//  ViewController.m
//  ObjPopoverPresentationController
//
//  Created by Kai Windle on 26/10/2015.
//  Copyright © 2015 Kai Windle. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UILabel *lblSelectedInformation;

@end

@implementation ViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)buttonPressed:(id)sender {
    
    // Note the terrible method name
    TableViewController *tableVC = (TableViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"tableVC"];
    
    tableVC.modalPresentationStyle = UIModalPresentationPopover;
    tableVC.deleagate = self;
    
    UIPopoverPresentationController *popPC = tableVC.popoverPresentationController;
    popPC.barButtonItem = sender;
    popPC.permittedArrowDirections = UIPopoverArrowDirectionAny;
    popPC.delegate = self;
    
    [self presentViewController:tableVC animated:YES completion:nil];
}

-(void)barButtonDonePressed:(UIBarButtonItem *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark - UIPopoverPresentationControllerDelegate
-(UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller{
    
//    return UIModalPresentationFullScreen;
    return UIModalPresentationNone;
}

-(UIViewController *)presentationController:(UIPresentationController *)controller viewControllerForAdaptivePresentationStyle:(UIModalPresentationStyle)style {
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller.presentedViewController];
    UIBarButtonItem *barButtonDone = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(barButtonDonePressed:)];
    
    navController.topViewController.navigationItem.rightBarButtonItem = barButtonDone;
    
    return navController;
}

#pragma UpdatePresentingViewControllerWithData
-(void)updateViewWithSelectedData:(NSString *)selectedString {
    
    NSLog(@"Delegate called");
    self.lblSelectedInformation.text = selectedString;
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
