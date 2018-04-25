//
//  ViewController.m
//  CollectionViewGallery
//
//  Created by Tyler Boudreau on 2018-04-25.
//  Copyright © 2018 Tyler Boudreau. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
#import "MyHeaderViewCollectionReusableView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (readonly,nonatomic)NSMutableArray <UIImage *> *imageArray;
@property (strong,nonatomic) UICollectionViewFlowLayout *defaultLayout;
@property (strong,nonatomic) UICollectionViewFlowLayout *switchLayout;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.myCollectionView reloadData];
    
    [self setupSwitchLayout];
    [self setupdefaultLayout];
    
    self.myCollectionView.collectionViewLayout=self.defaultLayout;
    

//    self.myCollectionView.collectionViewLayout=self.defaultLayout;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.imageArray.count;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView
                                   cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{

    
    
    CollectionViewCell *cell=[self.myCollectionView dequeueReusableCellWithReuseIdentifier:@"cell1"
                                                                              forIndexPath:indexPath];
    UIImage *images = [self.imageArray objectAtIndex: indexPath.row];
    cell.myImagecell1.image=images;

    return cell;

}
-(void)setupdefaultLayout{
    
    self.defaultLayout = [[UICollectionViewFlowLayout alloc]init];
    self.defaultLayout.itemSize = CGSizeMake(100, 150);
    self.defaultLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    self.defaultLayout.minimumInteritemSpacing=15;
    self.defaultLayout.minimumLineSpacing=10;
    
    self.defaultLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.defaultLayout.headerReferenceSize = CGSizeMake(50, self.myCollectionView.frame.size.height);
    
    
}


-(void)setupSwitchLayout{
    self.switchLayout = [[UICollectionViewFlowLayout alloc]init];
    self.switchLayout.itemSize = CGSizeMake(50, 50);
    self.switchLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    self.switchLayout.minimumLineSpacing=5;
    self.switchLayout.minimumInteritemSpacing=5;
    self.switchLayout.headerReferenceSize = CGSizeMake(CGRectGetWidth(self.myCollectionView.frame), 15);
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSArray <UIImage *> *)imageArray{
    return @[
             [UIImage imageNamed:@"cat1"],
             [UIImage imageNamed:@"cat2"],
             [UIImage imageNamed:@"cat3"],
             [UIImage imageNamed:@"will1"],
             [UIImage imageNamed:@"will2"],
             [UIImage imageNamed:@"will3"],
             [UIImage imageNamed:@"frog1"],
             [UIImage imageNamed:@"frog2"],
             [UIImage imageNamed:@"frog3"],
             [UIImage imageNamed:@"office1"],
             [UIImage imageNamed:@"office2"],
             [UIImage imageNamed:@"office3"],

             
             
             ];
}

//-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
//    [kind isEqualToString:UICollectionElementKindSectionHeader];
//    MyHeaderViewCollectionReusableView *header =[self.myCollectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MyHeaderView" forIndexPath:indexPath];
//
//    return header;
//}


- (IBAction)segmentedAction:(id)sender {
    
    
    self.switchLayout = [[UICollectionViewFlowLayout alloc]init];
    self.switchLayout.itemSize = CGSizeMake(50, 50);
    self.switchLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    self.switchLayout.minimumLineSpacing=5;
    self.switchLayout.minimumInteritemSpacing=5;
    self.switchLayout.headerReferenceSize = CGSizeMake(CGRectGetWidth(self.myCollectionView.frame), 15);
    
    
//        self.myCollectionView.collectionViewLayout=self.switchLayout;
        [self.myCollectionView.collectionViewLayout invalidateLayout];

        [self.myCollectionView setCollectionViewLayout:self.switchLayout animated:YES];

    /*
    UICollectionViewLayout *nextLayout;
    switch (self.segmentedControl.selectedSegmentIndex) {
        case 0:
            nextLayout=self.defaultLayout;
            break;
            
        case 1:
            nextLayout=self.switchLayout;
            break;
            
        default:
            break;
    }
//    [self.myCollectionView.collectionViewLayout invalidateLayout];
    
    self.myCollectionView.collectionViewLayout=nextLayout;

//    [self.myCollectionView setCollectionViewLayout:nextLayout animated:YES];
     
     */
    
}



@end
