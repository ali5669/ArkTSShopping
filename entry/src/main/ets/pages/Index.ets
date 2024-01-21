import router from '@ohos.router'
import { Item} from '../datatype/Item'

@Entry
@Component
struct Index {
  private ItemList:Item[]=[
    new Item('抽纸',$r('app.media.paper'),15.5),
    new Item('华为Mate60', $r('app.media.mate60'),6999),
    new Item('MateBookProX', $r('app.media.mateBookProX'),13999),
    new Item('WatchGT4', $r('app.media.watchGT4'),1438),
    new Item('FreeBuds Pro3', $r('app.media.freeBudsPro3'),1499),
    new Item('Mate X5', $r('app.media.mateX5'),12999),
    new Item('抽纸',$r('app.media.paper'),15.5),
    new Item('华为Mate60', $r('app.media.mate60'),6999),
    new Item('MateBookProX', $r('app.media.mateBookProX'),13999),
    new Item('WatchGT4', $r('app.media.watchGT4'),1438),
    new Item('FreeBuds Pro3', $r('app.media.freeBudsPro3'),1499),
    new Item('Mate X5', $r('app.media.mateX5'),12999)
  ]
  @Styles fillScreen(){
    .width('100%')
    .height('100%')
    .backgroundColor('#EFEFEF')
    .padding(20)
  }
  // @State param:any=router.getParams()
  @State username:string='用户名：UserName'
  build() {
    Column(){
      Row(){
        Column(){
          Text(this.username)
            .fontSize(15)
          // .fontWeight(FontWeight.Lighter)
        }
      }
      .height(25)
      Row(){
        Column(){
          Text('商品热卖中！')
            .fontWeight(FontWeight.Bold)
            .fontSize(30)
        }
      }
      List({space:'12vp'}){
        ForEach(this.ItemList,(item:Item)=>{
          this.Items(item)
        })
      }
      .lanes(2)
      .width('100%')
      .height('100%')
    }

  }
  @Builder Items(item:Item){
    Column(){
      Image(item.image)
        .width(100)
        .height(100)
        // .objectFit(ImageFit.Contain)
        .margin({top:16,bottom:8})
      Column(){
        Text(item.name)
          .maxLines(2)
          .fontSize(12)
      }
    }

  }
}