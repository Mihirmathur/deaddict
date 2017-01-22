//
//  FirstViewController.h
//  deaddict
//
//  Created by Shashank Khanna on 1/21/17.
//  Copyright © 2017 Shashank Khanna. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PNChart.h"
@import Firebase;
@interface FirstViewController : UIViewController

@property (nonatomic) PNCircleChart * circleChart;
@property (weak, nonatomic) IBOutlet UIButton *increment;
@property (strong, nonatomic) NSNumber *_current;
@property (weak, nonatomic) IBOutlet UIImageView *tip_of_day;

@property (strong, nonatomic) FIRDatabaseReference *ref;


@property (weak, nonatomic) IBOutlet UILabel *tip_detail;
@property (strong, nonatomic)NSString *user_email;

@end

