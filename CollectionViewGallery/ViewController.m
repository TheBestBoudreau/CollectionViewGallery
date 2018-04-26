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
@property (strong,nonatomic) UICollectionViewFlowLayout *defaultLayout;
@property (strong,nonatomic) UICollectionViewFlowLayout *switchLayout;
@property (strong,nonatomic) NSMutableArray *myBigArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.myCollectionView reloadData];
    
    [self setupSwitchLayout];
    [self setupdefaultLayout];
    
    self.myCollectionView.collectionViewLayout=self.defaultLayout;
    
    
    
    NSMutableArray *catMembers= [[NSMutableArray alloc]initWithObjects:@"cat1",@"cat2",@"cat3", nil];
    NSMutableDictionary *catDictionary =[[NSMutableDictionary alloc]initWithObjectsAndKeys:catMembers, @"members", @"Cats", @"title", nil];
    
    NSMutableArray *frogMembers = [[NSMutableArray alloc]initWithObjects:@"frog1",@"frog2",@"frog3", nil];
    NSMutableDictionary *frogDictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:frogMembers,@"members", @"Pepe", @"title", nil];
    
    NSMutableArray *willMembers = [[NSMutableArray alloc]initWithObjects:@"will1",@"will2",@"will3", nil];
    NSMutableDictionary *willDictionary = [[NSMutableDictionary alloc]initWithObjectsAndKeys:willMembers ,@"members", @"Will Ferrel", @"title", nil];
    
    NSMutableArray *officeMembers =[[NSMutableArray alloc] initWithObjects:@"office1",@"office2",@"office3", nil];
    NSMutableDictionary *officeDictionary = [[NSMutableDictionary alloc]initWithObjectsAndKeys:officeMembers, @"members", @"Office", @"title", nil];
    
    self.myBigArray = [[NSMutableArray alloc] initWithObjects:officeDictionary,willDictionary,frogDictionary,catDictionary, nil];

}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (self.myCollectionView.collectionViewLayout == self.defaultLayout){
        int total = 0;
        for (NSDictionary *dictionary in self.myBigArray) {
            NSArray * myArray = [dictionary objectForKey:@"members"];
            total += myArray.count;
      
        }
        return total;
        
        
    }else if (self.myCollectionView.collectionViewLayout == self.switchLayout){
       NSMutableDictionary *dict =[self.myBigArray objectAtIndex:section];
        NSArray * myArray = [dict objectForKey:@"members"];
        return myArray.count;
    }
    return 0;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView
                                   cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{

    

    CollectionViewCell *cell=[self.myCollectionView dequeueReusableCellWithReuseIdentifier:@"cell1"
                                                                            forIndexPath:indexPath];
    if(self.myCollectionView.collectionViewLayout==self.defaultLayout){
    NSMutableArray *array = [NSMutableArray new];
    for (NSDictionary *dictionary in self.myBigArray) {
       [array addObjectsFromArray:[dictionary objectForKey:@"members"]];
    }
    cell.myImagecell1.image = [UIImage imageNamed:[array objectAtIndex:indexPath.row]];
    

    return cell;
    }else{
        NSMutableDictionary *dict =[self.myBigArray objectAtIndex:indexPath.section];
        NSArray * myArray = [dict objectForKey:@"members"];
        cell.myImagecell1.image = [UIImage imageNamed:[myArray objectAtIndex:indexPath.row]];
        return cell;
    }
}
-(void)setupdefaultLayout{
    
    self.defaultLayout = [[UICollectionViewFlowLayout alloc]init];
    self.defaultLayout.itemSize = CGSizeMake(100, 150);
    self.defaultLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    self.defaultLayout.minimumInteritemSpacing=5;
    self.defaultLayout.minimumLineSpacing=10;
    self.defaultLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    
    self.defaultLayout.headerReferenceSize = CGSizeMake(200, 0);
    
}


-(void)setupSwitchLayout{
    self.switchLayout = [[UICollectionViewFlowLayout alloc]init];
    self.switchLayout.itemSize = CGSizeMake(150, 150);
    self.switchLayout.sectionInset = UIEdgeInsetsMake(15, 15, 15, 15);
    self.switchLayout.minimumLineSpacing=5;
    self.switchLayout.minimumInteritemSpacing=5;
    self.switchLayout.scrollDirection = UICollectionViewScrollDirectionVertical;

    
    // IF THERES A CRASH REMOVE THIS
    self.switchLayout.headerReferenceSize = CGSizeMake(160, 100);

    
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    if (self.myCollectionView.collectionViewLayout == self.defaultLayout){
        return 1;
    }else{
        return 4;
    }
    
    }



- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath{
    
    [kind isEqualToString:UICollectionElementKindSectionHeader];
    MyHeaderViewCollectionReusableView *header = [self.myCollectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
withReuseIdentifier:@"Myheader"forIndexPath:indexPath];
    
    
    if(self.myCollectionView.collectionViewLayout == self.defaultLayout){
        
    }else{
        NSMutableDictionary *dict =[self.myBigArray objectAtIndex:indexPath.section];
        header.label.text = [dict objectForKey:@"title"];
        
        
    }
//  header.label.text = [self.myBigArray objectAtIndex: indexPath.section];
    
    return header;
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)segmentedAction:(id)sender {


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
    
    [self.myCollectionView setCollectionViewLayout:nextLayout animated:YES];
    
    [_myCollectionView reloadData];
    
    
}



@end
