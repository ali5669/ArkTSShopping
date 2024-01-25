import {Header} from '../common/components/CommonComponents'
import {Item, OrderItem} from '../viewmodel/ItemModel'
import {ItemData} from '../viewmodel/ItemData'
import { LocalDataManager } from '../viewmodel/LocalDataManager'

// 继承模式，只能写在全局
@Extend(Text) function priceText(){
  .fontColor('#F36')
  .fontSize(18)
}

@Component
export struct OrderPage {
  private username:string
  private localDataManager: LocalDataManager = LocalDataManager.instance()
  @Link orderList: OrderItem[]

  onPageShow(){
    this.orderList = this.localDataManager.queryOrderList()
  }

  build() {

    Column() {
      // 标题部分
      Header({title: '订单', username: this.username})
        .margin({bottom: 20})

      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          // 商品列表部分
          List({space: 8}){
            ForEach(
              this.orderList,
              (orderItem: OrderItem,index: number) => {
                ListItem(){
                  this.ItemCard(orderItem, index)
                }
              }
            )
          }
          .width('100%')
          .height('100%')
          .layoutWeight(1)
        }
        .tabBar('全部')

        TabContent() {
          Text('待付款').fontSize(30)
        }
        .tabBar('待付款')

        TabContent() {
          Text('待发货').fontSize(30)
        }
        .tabBar('待发货')

        TabContent() {
          Text('退款/售后').fontSize(30)
        }
        .tabBar('售后')

      }

    }.fillScreen()
    .width('100%')
  }




  // 局部公共样式函数
  @Styles fillScreen(){
    .width('100%')
    .height('100%')
    .backgroundColor('#EFEFEF')
    .padding(20)
  }

  // 局部自定义构建函数
  @Builder ItemCard(orderItem: OrderItem, index: number){
    Column({space: 4}){
      Row({space: 10}){
        Image(orderItem.item.image)
          .width(90)
        Column({space: 4}){
          Text(orderItem.item.title)
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
          Text('实付款 ￥' + orderItem.getTotalPrice())
            .priceText()
          Row(){
            Button('延长收货')
              .fontSize(12)
            Button('确认收货')
              .fontSize(12)
          }.justifyContent(FlexAlign.SpaceBetween)
          .width('40%')
        }
        .height('90%')
        .alignItems(HorizontalAlign.Start)
    }.width('100%')
      Text('付款时间:' + orderItem.payTime)
        .fontSize(12)
        .fontColor('#F36')
        .textAlign(TextAlign.Start)
        .height('10%')
    }
    .backgroundColor('#FFF')
    .borderRadius(20)
    .height(140)
    .padding(10)
  }
}