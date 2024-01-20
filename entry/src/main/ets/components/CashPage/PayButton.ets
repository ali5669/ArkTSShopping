import { Item } from '../../datatype/Item'

@Component
export struct PayButton{
  @Prop quantity: number
  @Consume chooseItem: Item
  build(){
    Row(){
      Button(`支付 ￥${this.chooseItem.price * this.quantity}`)
        .width('90%')
        .onClick(()=>{

        })
    }
    .padding({bottom: 10})
    .justifyContent(FlexAlign.Center)
  }
}
