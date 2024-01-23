import {Header} from '../common/components/CommonComponents'
import {CartItem, Item} from '../viewmodel/ItemModel'
import {ItemData} from '../viewmodel/ItemData'
import { LocalDataManager } from '../utils/LocalDataManager'



// 继承模式，只能写在全局
@Extend(Text) function priceText(){
  .fontColor('#F36')
  .fontSize(18)
}

@Component
export struct CartPage {
  @State message: string = 'Hello World'
  private username:string
  private localDataManager: LocalDataManager = LocalDataManager.instance()
  @Link cartItems: CartItem[]

  onPageShow(){
    this.cartItems = this.localDataManager.queryShopCart()
  }

  build() {
    Column() {
      // 标题部分
      Header({title: '购物车', username: this.username})
        .margin({bottom: 20})
      // 商品列表部分
      List({space: 8}){
        ForEach(
          this.cartItems,
          (cartItem: CartItem) => {
            ListItem(){
              this.ItemCard(cartItem.item)
            }
          }
        )
      }.height('90%')

      Row(){
        // Checkbox()
        //   // .select(this.item.finished)
        //   .onChange(val => {
        //     // 1.更新当前任务状态
        //     // this.item.finished = val
        //     // // 2.更新已完成任务数量
        //     // this.onTaskChange()
        //   })

        Button(`总计 ￥110`)
          .width('40%')
          .onClick(()=>{

          })
      }
      .padding({bottom: 10})
      .justifyContent(FlexAlign.Center)




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
      Checkbox()
        // .select(this.item.finished)
        .onChange(val => {
          // 1.更新当前任务状态
          // this.item.finished = val
          // // 2.更新已完成任务数量
          // this.onTaskChange()
        })
      Image(item.image)
        .width(100)
      Column({space: 4}){
        Text(item.title)
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
          Text('￥' + item.price)
            .priceText()
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