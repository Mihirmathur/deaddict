//
//  FirstViewController.h
//  deaddict
//
//  Created by Shashank Khanna on 1/21/17.
//  Copyright © 2017 Shashank Khanna. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PNChart.h"
@interface FirstViewController : UIViewController

@property (nonatomic) PNCircleChart * circleChart;
@property (weak, nonatomic) IBOutlet UIButton *increment;
@property (strong, nonatomic) NSNumber *_current;


@end

