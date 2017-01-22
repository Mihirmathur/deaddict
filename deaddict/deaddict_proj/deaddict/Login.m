//
//  Login.m
//  deaddict
//
//  Created by Shashank Khanna on 1/21/17.
//  Copyright © 2017 Shashank Khanna. All rights reserved.
//

#import "Login.h"
#import "FirstViewController.h"
@interface Login ()

@end

@implementation Login

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"segueTest"])
    {
        // Get reference to the destination view controller
        FirstViewController *fvc = segue.destinationViewController;
        fvc.user_email = _email.text;
        
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
