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
    .backgroundColor('#EFEFEF')
    .padding(30)
  }
  @State param:any=router.getParams()
  build() {
    Column(){
      Row(){
        Column(){
          Text('用户名: '+this.param.username)
            .fontSize(15)
        }
      }
      .height(25)
      Row(){
        Column(){
          Text('商品热卖中！')
            .fontWeight(FontWeight.Bold)
            .fontSize(30)
            .fontColor('#E92F4F')
        }
      }
      List({space:'12vp'}){
        ForEach(this.ItemList,(item:Item)=>{
          this.Items(item)
        })
      }
      .lanes(2)
      .width('95%')
      .height('100%')
    }
  }
  @Builder Items(item:Item){
    Column(){
      Image(item.image)
        .width(100)
        .height(100)
        .objectFit(ImageFit.Contain)
      Column(){
        Text(item.name)
          .maxLines(2)
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
        Text('￥'+item.price)
          .fontColor('#E92F4F')
          .fontSize(16)
      }
    }
    .height(200)
    .padding(30)
    .backgroundColor('#EFEFEF')
    .margin(8)
    .onClick(()=>{
      // router.pushUrl()
    })
  }
}