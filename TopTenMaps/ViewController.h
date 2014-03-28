//
//  ViewController.h
//  TopTenMaps
//
//  Created by Ileana Padilla on 26/03/14.
//  Copyright (c) 2014 Ileana Padilla. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic, retain)NSArray *placesArray;
@property(nonatomic, retain)NSArray *coordenadasArray;
@property(nonatomic, retain)NSArray *imagesArray;
@property(nonatomic)NSString *selectedPlace;

@end
