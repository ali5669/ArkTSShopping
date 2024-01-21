import router from '@ohos.router'
import {MainHeader} from '../components/MainHeader/MainHeader'
import { Item, ShowItem } from '../datatype/Item'


@Entry
@Component
struct ItemDetail {
  // private item:Item
  @State  params:any=router.getParams()


  build() {
    Column() {
      MainHeader()

      Column(){
        Row(){
          Image(this.params.image)
            .width('100%')
        }.margin({bottom:30})
        Row(){
          Text('￥'+this.params.price)
            .fontColor('#F36')
            .fontSize(20)
        }
        // .justifyContent(FlexAlign.Start)
        .width('90%')
        .margin({bottom:20})
        Row(){
          Text(this.params.name)
            .fontSize(24)
        }
        .width('90%')
      }

      //加入购物车
      Row({space:5}){
        Button('加入购物车')
          .width('60%')
          .fontSize(22)
          .backgroundColor('#FCBC02')
          .onClick(()=>{
            router.back()
          })
      }
      .width('100%')
      .height('4%')
      .alignItems(VerticalAlign.Bottom)
      .justifyContent(FlexAlign.Center)
      .position({y:'95%' })
      // .backgroundColor('#FCBC02')

    }
    .height('100%')
  }
}