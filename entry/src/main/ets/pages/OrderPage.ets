import {Header} from '../common/components/CommonComponents'

class Item {
  name: string
  image: ResourceStr
  price: number
  discount: number

  constructor(name: string, image: ResourceStr, price: number, discount: number = 0) {
    this.name = name
    this.image = image
    this.price = price
    this.discount = discount
  }
}

// 继承模式，只能写在全局
@Extend(Text) function priceText(){
  .fontColor('#F36')
  .fontSize(18)
}
@Entry
@Component

struct OrderPage {
  @State message: string = 'Hello World'
  // 商品数据
  private items: Array<Item> = [
    new Item('华为Mate60', $r('app.media.mate60'),6999, 500),
    new Item('MateBookProX', $r('app.media.mateBookProX'),13999,300),
    new Item('WatchGT4', $r('app.media.watchGT4'),1438),
    new Item('FreeBuds Pro3', $r('app.media.freeBudsPro3'),1499),
    new Item('Mate X5', $r('app.media.mateX5'),12999),
    new Item('FreeBuds Pro3', $r('app.media.freeBudsPro3'),1499),
    new Item('Mate X5', $r('app.media.mateX5'),12999),
    new Item('FreeBuds Pro3', $r('app.media.freeBudsPro3'),1499),
    new Item('Mate X5', $r('app.media.mateX5'),12999),
    new Item('Mate X5', $r('app.media.mateX5'),12999)
  ]


  build() {

    Column() {
      // 标题部分
      Header({title: '订单'})
        .margin({bottom: 20})

      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          // 商品列表部分
          List({space: 8}){
            ForEach(
              this.items,
              (item: Item) => {
                ListItem(){
                  this.ItemCard(item)
                }
              }
            )
          }
          .width('100%')
          .layoutWeight(2)
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
  @Builder ItemCard(item: Item){
    Row({space: 10}){
      Image(item.image)
        .width(100)
      Column({space: 4}){
        Text(item.name)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
        Text('实付款 ￥' + item.price)
          .priceText()
        Row(){
          Button('延长收货')
          //  Button('查看物流')
          Button('确认收货')
        }.justifyContent(FlexAlign.SpaceBetween)
        .width('40%')
      }
      .height('100%')
      .alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .backgroundColor('#FFF')
    .borderRadius(20)
    .height(140)
    .padding(10)

  }
}