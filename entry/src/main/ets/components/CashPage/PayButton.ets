@Component
export struct PayButton{
  @Prop quantity: number
  @Consume finalPrice: number
  build(){
    Row(){
      Button(`支付 ￥${this.finalPrice * this.quantity}`)
        .width('90%')
        .onClick(()=>{

        })
    }
    .padding({bottom: 10})
    .justifyContent(FlexAlign.Center)
  }
}
