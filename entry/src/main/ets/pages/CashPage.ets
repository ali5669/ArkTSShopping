import { Item, ShowItem } from '../datatype/Item'

import { QuantityAdjustBar } from '../components/CashPage/QuantityAdjustBar'
import { TypeChooseList } from '../components/CashPage/TypeChooseList'
import { PayButton } from '../components/CashPage/PayButton'
import { Header } from '../components/CashPage/Header'

@Styles function cardStyle() {
  .width('95%')
  .margin({ top: 5, bottom: 5 })
  .padding(10)
  .backgroundColor(Color.White)
  .borderRadius(5)
}

@Entry
@Component
struct CashPage {
  private showItem: ShowItem = new ShowItem(
    new Item('抽纸', $r('app.media.paper'), 15),
    [
      new Item('抽纸1', $r('app.media.paper'), 15.5),
      new Item('抽纸2', $r('app.media.paper'), 25),
      new Item('抽纸3', $r('app.media.paper'), 35)
    ]
  )
  @Provide chooseItem: Item = this.showItem.itemType[0]
  @State quantity: number = 1

  build() {
    Column() {

      // brief introduction and back button
      Header({ quantity: this.quantity })


      // address configuration row
      Row() {

      }


      // type choose row
      Row() {
        TypeChooseList({ showItem: this.showItem })
      }
      .cardStyle()


      // number of item choose row
      Row() {
        Text('数量')
          .fontSize(25)
        QuantityAdjustBar({ quantity: $quantity })
      }
      .cardStyle()
      .justifyContent(FlexAlign.SpaceBetween)


      Blank()


      PayButton({ quantity: this.quantity })

    }
    .height('100%')
    .backgroundColor('#e0e0e0')
  }
}


