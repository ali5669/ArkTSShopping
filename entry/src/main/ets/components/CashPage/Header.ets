import { Item, Specification, ItemStyle } from '../../viewmodel/ItemModel'
import router from '@ohos.router'

@Component
export struct Header {
  item: Item
  quantity: number
  @Consume finalPrice: number
  build() {
    Row(){
      if(this.item.image != ''){
        Image(this.item.image)
          .width(70)
      }

      Text('￥' + this.finalPrice * this.quantity)
        .fontSize(45)
      Blank()
      Button(){
        Image($r('app.media.close'))
          .width(15)
          .onClick(()=>{
            router.back()
          })
      }
    }
    .width('100%')
    .padding(10)
  }
}