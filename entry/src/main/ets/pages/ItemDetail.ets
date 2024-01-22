import router from '@ohos.router'
import {MainHeader} from '../components/MainHeader/MainHeader'
import { Item } from '../viewmodel/ItemModel'
import { ItemData } from '../viewmodel/ItemData'

@Entry
@Component
struct ItemDetail {
  // private item:Item
  @State params: any = router.getParams()
  @State item: Item = ItemData.find(item => item.id == this.params.id)
  build() {
    Column() {
      MainHeader()
      Column(){
        Row(){
          Image(this.item.image)
            .width('100%')
        }.margin({bottom:30})
        Row(){
          Text('￥'+this.item.price)
            .fontColor('#F36')
            .fontSize(20)
        }
        // .justifyContent(FlexAlign.Start)
        .width('90%')
        .margin({bottom:20})
        Row(){
          Text(this.item.title)
            .fontSize(24)
        }
        .width('90%')
      }

      //加入购物车
      Row({space:5}){
        Button('加入购物车')
          .width('40%')
          .fontSize(22)
          .backgroundColor('#FCBC02')
          .onClick(()=>{
            router.pushUrl({
              url: 'pages/CashPage',
              params:{
                id: this.item.id,
                type: 0
              }
            },
              (err) => {
                if (err) {
                  console.error(`路由失败, errcode: ${err.code}, errMsg: ${err.message}`);
                }
              })

          })
        Button('立即购买')
        .width('40%')
        .fontSize(22)
        .backgroundColor('#FF2435')
        .onClick(()=>{
          router.pushUrl({
            url: 'pages/CashPage',
            params:{
              id: this.item.id,
              type: 1
            }
          },
            (err) => {
              if (err) {
                console.error(`路由失败, errcode: ${err.code}, errMsg: ${err.message}`);
              }
            })
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