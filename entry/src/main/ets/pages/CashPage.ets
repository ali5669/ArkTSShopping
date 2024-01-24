import { CartItem, Item } from '../viewmodel/ItemModel'
import { ItemData } from '../viewmodel/ItemData'
import { QuantityAdjustBar } from '../components/CashPage/QuantityAdjustBar'
import { TypeChooseList } from '../components/CashPage/TypeChooseList'
import { PayButton } from '../components/CashPage/PayButton'
import { AddButton } from '../components/CashPage/AddButton'
import { Header } from '../components/CashPage/Header'
import router from '@ohos.router'
import { LocalDataManager } from '../utils/LocalDataManager'

@Styles function cardStyle() {
  .width('95%')
  .margin({ top: 5, bottom: 5 })
  .padding(10)
  .backgroundColor(Color.White)
  .borderRadius(5)
}

@Entry
@Component
export struct CashPage {
  @State params: any = router.getParams()
  @State item: Item = ItemData.find(item => item.id == this.params.id)
  @State quantity: number = 1
  @Provide finalPrice: number = this.item.price

  private localDataManager: LocalDataManager = LocalDataManager.instance()
  private styles: number[] = []

  // 加入购物车按钮被点下时
  onCartButtonClicked(){
    this.localDataManager.insertShopCart(this.item.id, this.styles, this.quantity)
    router.back()
  }

  // 结算按钮被点下时
  onCashButtonClicked(){
    this.localDataManager.insertOrderList(this.item.id, this.styles, this.quantity)
    router.back()
  }

  // 商品特殊类型变更时
  onStylesChanged(currentStyles: number[]){
    this.styles = currentStyles.slice()
  }

  build() {
    Column() {

      // brief introduction and back button
      Header({item: this.item, quantity: this.quantity })


      // address configuration row
      Row() {

      }


      // type choose row
      Row() {
        TypeChooseList({item: this.item, onStylesChanged:() => this.onStylesChanged})
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
      if(this.params.type == 0){
        AddButton({
          onClicked: () => this.onCartButtonClicked()
        })
      }
      else{
        PayButton({
          quantity: this.quantity,
          onClicked: () => this.onCashButtonClicked()
        })
      }

    }
    .height('100%')
    .backgroundColor('#e0e0e0')
  }
}


