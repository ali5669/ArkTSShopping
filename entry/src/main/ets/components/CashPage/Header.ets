import { Item } from '../../datatype/Item'
import router from '@ohos.router'

@Component
export struct Header {
  @Prop quantity: number
  @Consume chooseItem: Item
  build() {
    Row(){
      Image(this.chooseItem.image)
        .width(70)
      Text('￥' + this.chooseItem.price * this.quantity)
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