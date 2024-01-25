import {Header} from '../common/components/CommonComponents'
import {CartItem, Item, OrderItem} from '../viewmodel/ItemModel'
import { LocalDataManager } from '../viewmodel/LocalDataManager'



// 继承模式，只能写在全局
@Extend(Text) function priceText(){
  .fontColor('#F36')
  .fontSize(18)
}

@Component
export struct CartPage {
  @State message: string = 'Hello World'
  @State finallPrice: number =0
  private username:string
  private localDataManager: LocalDataManager = LocalDataManager.instance()
  @Link cartList: CartItem[]
  @Link orderList: OrderItem[]
  @State selectList: boolean[] = []

  private onRefresh?: () => void

  aboutToAppear(){
    for (let index = 0; index < this.cartList.length; index++) {
      this.selectList.push(false)
    }
  }

  onPageShow(){
    this.cartList = this.localDataManager.queryCartList()
    for (let index = 0; index < this.cartList.length; index++) {
      this.selectList[index] = false
    }
  }

  refreshCartPage(){
    if(this.onRefresh){
      this.onRefresh()
    }
    //TODO: 添加重新计算总和的函数
    this.finallPrice = 0
    for (let index = 0; index < this.selectList.length; index++) {

      if(this.selectList[index]){
        this.finallPrice = this.finallPrice + this.cartList[index].getTotalPrice()
      }
      // else{
      //   this.finallprice = this.finallprice - this.cartList[index].getTotalPrice()
      // }
    }
  }

  build() {
    Column() {
      // 标题部分
      Header({title: '购物车', username: this.username})
        .margin({bottom: 20})
      // 商品列表部分
      List({space: 8}){
        ForEach(
          this.cartList,
          (cartItem: CartItem, index: number) => {
            ListItem(){
              //TODO 修改接口，直接传 cartItem
              this.ItemCard(cartItem, index)
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

        Button(`总计 ￥`+this.finallPrice)
          .width('40%')
          .onClick(()=>{
              this.onCashButtonClick()
              this.refreshCartPage()
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

  onCashButtonClick(){
    let ids = []
    for (let index = 0; index < this.selectList.length; index++) {
      if(this.selectList[index]){
        console.log(index.toString())
        let cartItem = this.cartList[index]
        this.localDataManager.insertOrderFromCart(cartItem)
        ids.push(cartItem.item.id)
      }
    }
    this.localDataManager.deleteCart(ids)
  }

  // 局部自定义构建函数
  @Builder ItemCard(cartItem: CartItem, index: number){
    //TODO 显示 cardItem 的 quantity 在最右侧（物品数量），并且能够统计总金额
    Row({space: 10}){
      Checkbox()
        .select(this.selectList[index])
        .onChange(val => {
          this.selectList[index] = val
          this.refreshCartPage()//
        })
      Image(cartItem.item.image)
        .width(100)
      Column({space: 4}){
        Text(cartItem.item.title)
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
        Text('￥' + cartItem.getPrice())
          .priceText()
        Text('数量' + cartItem.quantity)
          .fontColor('#36D')
          .fontSize(15)
        Text('总金额￥' + cartItem.getTotalPrice())
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