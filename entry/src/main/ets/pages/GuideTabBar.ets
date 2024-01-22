import {Index} from './Index'
import {OrderPage} from './OrderPage'

@Entry
@Component
struct GuideTabBar {
  @State fontColor: string = '#182431'
  @State selectedFontColor: string = '#007DFF'
  @State currentIndex: number = 0
  private controller: TabsController = new TabsController()

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
          Index().width('100%').height('100%')
        }.tabBar(this.TabBuilder(0, '首页'))

        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#007DFF')
        }.tabBar(this.TabBuilder(1, '购物车'))

        TabContent() {
          OrderPage().width('100%').height('100%')
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