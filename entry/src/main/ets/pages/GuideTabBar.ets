import {Index} from './Index'
import {OrderPage} from './OrderPage'
import {CartPage} from './CartPage'
import router from '@ohos.router'

import {LocalDataManager} from '../utils/LocalDataManager'
import { CartItem, OrderItem } from '../viewmodel/ItemModel'

@Entry
@Component
struct GuideTabBar {
  @State param:any=router.getParams()

  @State fontColor: string = '#182431'
  @State selectedFontColor: string = '#007DFF'
  @State currentIndex: number = 0
  private controller: TabsController = new TabsController()

  private localDataManager: LocalDataManager = LocalDataManager.instance()
  @State shopCart: CartItem[] = []
  @State orderList: OrderItem[] = []

  onPageShow(){
    this.shopCart = this.localDataManager.queryShopCart()
    this.orderList = this.localDataManager.queryOrderList()
  }

  @Builder TabBuilder(index: number, name: string) {
    Column() {
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
        }.tabBar(this.TabBuilder(0, '首页'))

        TabContent() {
          CartPage({username: this.param.username, cartList: $shopCart}).width('100%').height('100%')
        }.tabBar(this.TabBuilder(1, '购物车'))

        TabContent() {
          OrderPage({username: this.param.username, orderList: $orderList}).width('100%').height('100%')
        }.tabBar(this.TabBuilder(2, '我的订单'))
      }
      .vertical(false)
      .barMode(BarMode.Fixed)
      .barHeight(56)
      .animationDuration(400)
      .onChange((index: number) => {
        this.currentIndex = index
      })
      .backgroundColor('#e0e0e0')
    }
    .width('100%')
    .height('100%')
  }
}