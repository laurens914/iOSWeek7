//
//  DetailViewController.h
//  LocationReminders
//
//  Created by Lauren Spatz on 3/15/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import <UIKit/UIKit.h>
@import MapKit;

typedef void(^DetailViewControllerCompletion)(NSString *title, MKCircle *circle, CLCircularRegion * region);

@interface DetailViewController : UIViewController
@property (copy, nonatomic) NSString * annotationTitle;
@property CLLocationCoordinate2D coordinate;
@property (copy, nonatomic) DetailViewControllerCompletion completion;



@end
