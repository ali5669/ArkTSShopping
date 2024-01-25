import {Index} from './Index'
import {OrderPage} from './OrderPage'
import {CartPage} from './CartPage'
import router from '@ohos.router'

import {LocalDataManager} from '../viewmodel/LocalDataManager'
import { CartItem, OrderItem } from '../viewmodel/ItemModel'

@Entry
@Component
struct GuideTabBar {
  @State param:any=router.getParams()

  @State fontColor: string = '#182431'
  @State selectedFontColor: string = '#ffff0000'
  @State currentIndex: number = 0
  private controller: TabsController = new TabsController()

  private localDataManager: LocalDataManager = LocalDataManager.instance()
  @State cartList: CartItem[] = []
  @State orderList: OrderItem[] = []

  onPageShow(){
    this.cartList = this.localDataManager.queryCartList()
    this.orderList = this.localDataManager.queryOrderList()
  }

  // 刷新购物车和订单
  refresh(){
    this.cartList = this.localDataManager.queryCartList()
    this.orderList = this.localDataManager.queryOrderList()
  }


  @Builder TabBuilder(index: number, name: string, img: ResourceStr, fc_img: ResourceStr) {
    Column() {
      Image(this.currentIndex === index ? fc_img : img)
        .width(24)
        .margin({bottom: 4})
      Text(name)
        .fontColor(this.currentIndex === index ? this.selectedFontColor : this.fontColor)
        .fontSize(16)
        .fontWeight(this.currentIndex === index ? 900 : 400)
        .lineHeight(22)
    }.width('100%')
  }

  build() {
    Column() {
      Tabs({ barPosition: BarPosition.End, controller: this.controller }) {
        TabContent() {
          Index({username: this.param.username}).width('100%').height('100%')
        }.tabBar(this.TabBuilder(0, '首页', $r('app.media.ic_home_normal'), $r('app.media.ic_home_focus')))

        TabContent() {
          CartPage({
            username: this.param.username,
            cartList: $cartList,
            onRefresh:() => this.refresh()
          })
            .width('100%')
            .height('100%')
        }.tabBar(this.TabBuilder(1, '购物车', $r('app.media.ic_cart_normal'), $r('app.media.ic_cart_focus')))

        TabContent() {
          OrderPage({username: this.param.username, orderList: $orderList}).width('100%').height('100%')
        }.tabBar(this.TabBuilder(2, '我的订单', $r('app.media.ic_personal_normal'), $r('app.media.ic_personal_focus')))
      }
      .vertical(false)
      .barMode(BarMode.Fixed)
      .barHeight(60)
      .animationDuration(200)
      .onChange((index: number) => {
        this.currentIndex = index
      })
      .backgroundColor('#e0e0e0')
    }
    .width('100%')
    .height('100%')
  }
}