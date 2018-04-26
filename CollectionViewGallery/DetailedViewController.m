//
//  DetailedViewController.m
//  CollectionViewGallery
//
//  Created by Tyler Boudreau on 2018-04-25.
//  Copyright © 2018 Tyler Boudreau. All rights reserved.
//

#import "DetailedViewController.h"

@interface DetailedViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *DetailedScrollView;


@property (nonatomic,strong)UIImageView *zoom;
@end

@implementation DetailedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.zoom =[[UIImageView alloc] initWithImage:self.image];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
